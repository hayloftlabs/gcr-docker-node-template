## Scope
This file governs the `tests/` folder.

## How to work in this folder
- Keep example specs short and self-documenting with Given/When/Then comments.
- Default to skipping end-to-end and accessibility tests when base URLs are unset; leave clear TODOs on how to enable them.
- Prefer shared helpers in `tests/fixtures/` over inlining mock data.
- Align test names with user stories or acceptance criteria from `docs/requirements.md`.
