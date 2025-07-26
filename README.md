# Node Cloud Run Template

This template demonstrates a simple Node.js web service with a unified `deploy.sh` script for local Docker development and production deployment to Google Cloud Run.

## Getting Started

1. Copy the example environment files:
   ```sh
   cp .env.example .env
   cp .env.deploy.example .env.deploy
   cp .env.gcr.yml.example .env.gcr.yml
   ```
2. Fill in the values in each file.

## Local Development

Run the service locally inside Docker:
```sh
./deploy.sh dev-check
./deploy.sh dev-launch
```
The app will be available at `http://localhost:8080`.

## Production Deployment

Deploy to Google Cloud Run:
```sh
./deploy.sh prod-check      # verify gcloud and env files
./deploy.sh prod-init       # one-time setup of service account and registry
./deploy.sh prod-launch     # build, push, and deploy
```

`deploy.sh` expects three environment files:
- `.env` for local development variables
- `.env.deploy` for GCR settings (project, region, repo, etc.)
- `.env.gcr.yml` for Cloud Run runtime variables

## Project Structure

- `server.js` – minimal Fastify server serving static files from `public/`
- `deploy.sh` – deployment automation script
- `Dockerfile` – container image definition
- `public/` – static assets (contains `index.html`)

Use this repository as a starting point for new projects that follow the same deployment pattern.
