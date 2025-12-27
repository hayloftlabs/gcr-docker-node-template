---
title: Assistant Onboarding Guide
status: draft
audience: "Developers and AI coding assistants collaborating on this repo"
---

Use this guide to teach a coding assistant how to help when turning the template into a real site. Pair it with `site-requirements-template.md` and any project-specific AGENTS files you create.

## How to use AGENTS.md in this repo
- Place an `AGENTS.md` file in any folder where you want to specify conventions. The file governs its directory and all nested paths unless a deeper `AGENTS.md` overrides it.
- Typical placements: `/` for repo-wide norms, `/docs` for documentation style (see `docs/AGENTS.md`), `/public` for content guidelines, and `/src` when app code grows.
- Keep instructions concise and action-oriented (e.g., “Prefer Fastify plugins over in-file utilities”).
- When editing files, assistants must check for **all** applicable `AGENTS.md` files from the file’s directory up to repo root.

## Documentation workflow (human + assistant)
1. **Kickoff**: Copy `docs/site-requirements-template.md` to a project-specific doc (e.g., `docs/projects/<project-name>/requirements.md`). Fill in placeholders with stakeholders.
2. **Source of truth**: Link the project doc from the main `README.md` so new contributors can find it quickly.
3. **Assistant prompt packs**: Add supporting context files (e.g., `docs/prompts/<topic>.md`) that summarize decisions. Reference them from relevant `AGENTS.md` files.
4. **Change control**: Treat documentation edits like code—review diffs, keep decision logs, and update dates/owners.
5. **Launch**: Once requirements stabilize, extract a short implementation brief into tickets or checklists for build tasks.

## Starter template patterns
- **Requirements blueprint**: `site-requirements-template.md` (vision, scope, UX, tech, operations).
- **Runbook seeds**: Create `/docs/runbooks/<area>.md` for deploy, monitoring, and on-call once the service matures.
- **Content inventory**: Add `/docs/content-inventory.md` that lists pages, owners, and freshness dates.
- **Prompts for assistants**: Add `/docs/prompts/README.md` to describe available prompt files and how to use them.

## Tips for effective assistant collaboration
- Provide concrete examples and accepted terminology (e.g., “call them ‘members’ not ‘users’”).
- Set guardrails on libraries, coding style, and testing expectations inside `AGENTS.md`.
- Ask assistants to summarize the current requirement doc before coding to ensure shared understanding.
- When unsure, assistants should surface clarifying questions as comments rather than making silent assumptions.
- Map user stories in `docs/requirements.md` to tests: unit specs for logic, Playwright for journeys, Pa11y for accessibility. Use `E2E_BASE_URL` / `A11Y_BASE_URL` to decide when to run.
