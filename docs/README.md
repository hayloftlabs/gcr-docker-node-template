## Documentation starter kit

Use the files in this folder as your **working templates** when you clone the repo. Keep them under version control so decisions stay discoverable.

### Quickstart
1. Open `requirements.md` and treat it as the **single source of truth**. Edit it directly (or duplicate once per project) and keep it current.
2. Walk each section top to bottom with stakeholders. Do not skip placeholders—fill them or mark as “TBD – <owner> by <date>.”
3. If you need more prompts, skim `site-requirements-template.md` (annotated guide) and pull ideas into `requirements.md`—do **not** maintain parallel copies.
4. Add any prompt/context files for assistants under `docs/prompts/` (e.g., `functional.md`, `experience.md`) and reference them from `AGENTS.md` in relevant directories.
5. Link your filled-out `requirements.md` from the root `README.md` so new contributors land in the right spot.

### Testing quickstart (templates)
- Unit: `npm run test:unit` (Jest) or `npm run test:vitest` (alt). Specs live in `tests/unit/`.
- E2E: `npm run test:e2e` (Playwright). Set `E2E_BASE_URL` before running; example spec in `tests/e2e/`.
- Accessibility: `npm run test:a11y` (Pa11y + axe). Set `A11Y_BASE_URL`; config lives in `tests/a11y/pa11y.config.cjs`.

See `AGENTS.md` in this folder for style conventions. Keep headings, bullet lists, and short tables; avoid long prose walls.
