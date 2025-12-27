---
title: Site Requirements Blueprint (Guide)
status: reference
owner: "Template maintainers"
last_updated: "<YYYY-MM-DD>"
---

> Purpose: annotated guide with examples for filling `docs/requirements.md`. Copy ideas **into** `requirements.md`; keep that file as the only live requirements document.

## 1. Vision & Purpose
- **Outcome (example):** “Reduce onboarding time from 10 → 3 minutes for new tenants.”
- **Narrative prompt:** Write a before/after story (“Today… After launch, users can… without…”).
- **KPIs:** Choose 3–5 with target + owner + review cadence (weekly/monthly).

## 2. Audiences & Users
- **Segments:** Role, need, motivation + top entry path (ad/email/search).
- **User stories:** List 5–10. For each, add acceptance notes (“Given/When/Then”).
- **Accessibility:** WCAG target, locales, assistive tech to test with (e.g., NVDA, VoiceOver).

## 3. Scope & Must-Haves
- **Core features / pages:** P0/P1/P2. Tie P0 to KPIs and top user stories.
- **Integrations:** Identity, analytics, payments, CMS, APIs. Note sandbox/test data.
- **Content inputs:** Copy sources, brand assets, legal reviews + owners/dates.
- **Non-goals:** Be blunt about what v1 will not include to avoid churn.

## 4. Experience & Aesthetics
- **Brand adjectives:** Force-rank top 3 (e.g., trustworthy, playful, minimal).
- **Design direction:** Layout patterns, motion guidelines, component references + links.
- **Tone & voice:** Editing principles, glossary, 3–5 “do/don’t” examples.
- **Localization:** Languages, regions, date/number formats. Call out RTL/LTR.

## 5. Technical Foundations
- **Architecture:** Hosting, repo layout, environments, CDN. Note existing assets to reuse.
- **Performance budget:** Targets + measurement plan (tool, threshold, owner).
- **Security & privacy:** Auth patterns, PII handling, data residency, secrets policy, threat notes.
- **Constraints:** Platform limits, legacy deps, uptime/SLO targets, top risks + mitigations.

## 6. Deliverables & Milestones
- **Definition of done:** Specific checklist for v1 (features, performance, accessibility).
- **Milestones:** Dates + owner for discovery/design/build/launch + required approvals.
- **Acceptance tests:** Manual scripts or automated checks mapped to user stories. Note the command per layer (e.g., `npm run test:unit`, `npm run test:e2e`, `npm run test:a11y`) and the environments they require.

## 7. Ways of Working
- **Communication cadence:** Standups, async updates, office hours. Note time zones.
- **Decision log:** Table of date / decision / owner / rationale. Keep current.
- **Risks & mitigations:** Rank by probability/impact with owners.
- **Approvals:** Who signs off design, copy, release (with alternates).

## 8. Artifacts & References
- **Links:** Wireframes, figma, docs, tickets. Keep one “source of truth” link per area.
- **Content inventory:** List of source docs, owners, freshness + review cadence.
- **Runbook hooks:** What should be mirrored into onboarding/runbooks + where it lives.

## 9. After Launch
- **Metrics monitoring:** Dashboards + alert thresholds + who responds.
- **Support model:** On-call, escalation path, schedules/SLAs.
- **Iteration backlog:** Next bets tied to KPIs and learnings.
