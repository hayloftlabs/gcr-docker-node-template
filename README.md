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
- `docs/` – templates you fill in-place to capture site requirements and assistant guidance

Use this repository as a starting point for new projects that follow the same deployment pattern.

## Documentation framework (agent-friendly)

This template ships with a lightweight documentation layer to describe what you are building before you write code.

1. **Fill the working requirements doc (single source)**: Open `docs/requirements.md` and complete every placeholder with stakeholders. Assistants and contributors should read this first and treat it as the canonical plan.
2. **Reference guidance as needed**: `docs/site-requirements-template.md` is an annotated guide with examples for each section. Use it for inspiration; do not maintain a second copy of requirements there.
3. **Onboard humans + assistants**: Read `docs/assistant-onboarding.md` to learn how to use `AGENTS.md` files and keep assistants aligned with project norms.
4. **Add scoped AGENTS files**: Create `AGENTS.md` files in relevant folders (e.g., repo root, `/src`, `/public`) to set coding conventions, naming rules, or review checklists. The instructions apply to their directory tree.
5. **Link your doc**: Once you fill the requirements file (or create a project-specific copy), add a short note and link here so contributors can find it quickly.

> Tip: Keep documentation in version control, review it like code, and update `last_updated` fields when decisions change.

## Testing templates
- Unit: `npm run test:unit` (Jest) or `npm run test:vitest` (alt). See `tests/unit/`.
- E2E: `npm run test:e2e` (Playwright). Set `E2E_BASE_URL` before running; template spec in `tests/e2e/`.
- Accessibility: `npm run test:a11y` (Pa11y + axe). Set `A11Y_BASE_URL`; config in `tests/a11y/pa11y.config.cjs`.
- CI: `.github/workflows/test.yml` runs unit tests by default and skips E2E/a11y until the base URLs are set as repo variables or secrets.

### When to run each test type
- **Unit (Jest/Vitest):** Run on every change and every PR. Fast feedback for pure functions, utilities, and route handlers without network calls. Add/extend when you modify business logic or shared helpers.
- **E2E (Playwright):** Run on PRs that touch user flows or dependencies those flows rely on (routing, auth, data fetching). Also run before releasing. Requires `E2E_BASE_URL`; skip locally when the target environment is unavailable.
- **Accessibility (Pa11y + axe):** Run when adding/updating UI, content, or design tokens. Gate releases that change templates, components, or typography/color. Requires `A11Y_BASE_URL`; run against a stable environment to avoid flakiness.
