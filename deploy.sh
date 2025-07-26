
#!/bin/bash
set -e

# Usage: ./deploy.sh <mode>
# Modes:
#   dev-check   : Check dependencies for local development
#   dev-launch  : Build and launch Docker container for local testing
#   prod-check  : Check dependencies for production deployment
#   prod-init   : Initialize GCR resources (service account, repo, permissions)
#   prod-launch : Build, push, and deploy to GCR/Cloud Run

MODE="$1"

# Check dependencies for local development
function dev_check() {
  echo "[dev-check] Checking dependencies for local deployment..."
  command -v docker >/dev/null 2>&1 || { echo "Docker is not installed."; exit 1; }
  command -v npm >/dev/null 2>&1 || { echo "npm is not installed."; exit 1; }
  [ -f .env ] || { echo ".env file missing. Copy from .env.example and fill in your values."; exit 1; }
  echo "All local dependencies are present."
}

# Build and launch Docker container for local testing
function dev_launch() {
  dev_check
  echo "[dev-launch] Building Docker image for local testing..."
  docker build -t node-template-local .
  echo "[dev-launch] Launching Docker container..."
  docker run --env-file .env -p 8080:8080 node-template-local
}

# Check dependencies for production deployment
function prod_check() {
  echo "[prod-check] Checking dependencies for remote deployment..."
  command -v gcloud >/dev/null 2>&1 || { echo "gcloud CLI is not installed."; exit 1; }
  command -v docker >/dev/null 2>&1 || { echo "Docker is not installed."; exit 1; }
  [ -f .env.deploy ] || { echo ".env.deploy file missing. Copy from .env.deploy.example and fill in your values."; exit 1; }
  [ -f .env.gcr.yml ] || { echo ".env.gcr.yml file missing. Fill in your production environment variables."; exit 1; }
  echo "All remote deployment dependencies are present."
}

# Initialize GCR resources: service account, permissions, and repo
function prod_init() {
  prod_check
  source .env.deploy
  echo "[prod-init] Setting gcloud project to $GCR_PROJECT..."
  gcloud config set project "$GCR_PROJECT"
  echo "[prod-init] Initializing GCR resources..."
  # Create service account if not exists
  if ! gcloud iam service-accounts list --filter="name:${GCR_SERVICE_ACCOUNT_NAME}" --format="value(email)" | grep "${GCR_SERVICE_ACCOUNT_NAME}@${GCR_PROJECT}.iam.gserviceaccount.com" >/dev/null; then
    echo "[prod-init] Creating GCR service account..."
    gcloud iam service-accounts create "${GCR_SERVICE_ACCOUNT_NAME}" \
      --description="Service account for Cloud Run deployment" \
      --display-name="Cloud Run deploy"
    echo "Service account creation triggered. Waiting for account to be available..."

    # Poll for service account existence (max 90 seconds, check every 10 seconds)
    SA_EMAIL="${GCR_SERVICE_ACCOUNT_NAME}@${GCR_PROJECT}.iam.gserviceaccount.com"
    for i in {1..9}; do
      sleep 10
      if gcloud iam service-accounts list --filter="email:$SA_EMAIL" --format="value(email)" | grep "$SA_EMAIL" >/dev/null; then
        echo "Service account is now available."
        break
      fi
      echo "Waiting for service account to be created... ($((i*10))s elapsed)"
      if [ "$i" -eq 9 ]; then
        echo "Service account was not created after 90 seconds. Exiting."
        exit 1
      fi
    done
  else
    echo "Service account already exists."
  fi
  # Grant permissions to service account
  echo "[prod-init] Granting permissions to service account..."
  gcloud projects add-iam-policy-binding "$GCR_PROJECT" \
    --member="serviceAccount:${GCR_SERVICE_ACCOUNT_NAME}@${GCR_PROJECT}.iam.gserviceaccount.com" \
    --role="roles/storage.admin"
  gcloud projects add-iam-policy-binding "$GCR_PROJECT" \
    --member="serviceAccount:${GCR_SERVICE_ACCOUNT_NAME}@${GCR_PROJECT}.iam.gserviceaccount.com" \
    --role="roles/artifactregistry.writer"
  # Create Artifact Registry repo if not exists
  echo "[prod-init] Checking for Artifact Registry repository: $GCR_REPO in $GCR_PROJECT ($GCR_REGION)"
  REPO_EXISTS=$(gcloud artifacts repositories list --project="$GCR_PROJECT" --location="$GCR_REGION" --format="value(name)" | grep "$GCR_REPO" || true)
  if [ -z "$REPO_EXISTS" ]; then
    echo "[prod-init] Creating Artifact Registry repository..."
    gcloud artifacts repositories create "$GCR_REPO" \
      --repository-format=docker \
      --location="$GCR_REGION" \
      --description="Docker repo for $APP_NAME"
    echo "Artifact Registry repository created."
  else
    echo "Artifact Registry repository already exists."
  fi
  echo "[prod-init] Initialization complete."
  echo "To deploy your application, run:"
  echo "    ./deploy.sh prod-launch"
}

# Build, push, and deploy to GCR/Cloud Run
function prod_launch() {
  prod_check
  source .env.deploy
  # Authenticate with GCR using service account key if provided
  if [ -n "$GCR_SERVICE_ACCOUNT_KEY" ]; then
    echo "[prod-launch] Authenticating with GCR using service account key..."
    gcloud auth activate-service-account --key-file "$GCR_SERVICE_ACCOUNT_KEY"
  fi
  # Build Docker image and push to Artifact Registry
  IMAGE_URI="$GCR_REGION-docker.pkg.dev/$GCR_PROJECT/$GCR_REPO/$APP_NAME:$GCR_IMAGE_TAG"
  echo "[prod-launch] Building Docker image: $IMAGE_URI"
  gcloud builds submit --tag "$IMAGE_URI"
  # Deploy to Cloud Run
  echo "[prod-launch] Deploying to Cloud Run..."
  gcloud run deploy "$APP_NAME" \
    --image "$IMAGE_URI" \
    --region "$GCR_REGION" \
    --platform managed \
    --cpu 0.25 \
    --memory 128Mi \
    --concurrency 1 \
    --execution-environment gen1 \
    --env-vars-file .env.gcr.yml
  echo "Deployment complete."
}

# Main entrypoint: dispatch based on mode argument
case "$MODE" in
  dev-check)
    dev_check
    ;;
  dev-launch)
    dev_launch
    ;;
  prod-check)
    prod_check
    ;;
  prod-init)
    prod_init
    ;;
  prod-launch)
    prod_launch
    ;;
  *)
    echo "Usage: $0 {dev-check|dev-launch|prod-check|prod-init|prod-launch}"
    exit 1
    ;;
esac
