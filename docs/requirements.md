---
title: "<Project Name> – Requirements"
status: "draft | in-review | approved"
owner: "<person or team>"
last_updated: "<YYYY-MM-DD>"
---

> Purpose: working, fill-in-place requirements for this site. Complete every placeholder or mark as “TBD – <owner> by <date>.” This is the single source of truth—keep it current. For extra prompts/examples, see `site-requirements-template.md` and pull content into this file (do not maintain both).

## 1. Vision & Purpose
- **Outcome (1–2 sentences):** <what changes for users/business?>
- **Narrative (story of success):** <short paragraph describing the ideal user journey>
- **KPIs / success criteria:** <metrics and targets>

## 2. Users & Stories
- **Audience segments:** <roles/personas + needs>
- **Top user stories (with acceptance notes):**
  - As a <role>, I want <capability>, so that <value>. _Acceptance: …_
  - As a <role>, I want <capability>, so that <value>. _Acceptance: …_
- **Accessibility goals:** <WCAG target, known AT/locale considerations>

## 3. Scope & Priorities
- **Must-have features/pages (P0/P1/P2):**
  - P0: <critical pages/flows>
  - P1: <important but deferable>
  - P2: <nice-to-haves>
- **Non-goals:** <explicitly out of scope>
- **Integrations:** <identity, analytics, CMS, payments, APIs>
- **Content inputs:** <copy sources, brand assets, legal/comms reviewers>

## 4. Experience & Aesthetics
- **Brand adjectives:** <e.g., trustworthy, playful, minimal>
- **Visual direction:** <layout patterns, component libraries, motion rules>
- **Tone & voice:** <writing rules, glossary>
- **Localization:** <languages, formats>

## 5. Technical Foundations
- **Architecture:** <hosting, repo layout, environments>
- **Performance budget:** <LCP/CLS/INP targets, bundle size>
- **Security & privacy:** <auth, PII handling, data residency, threat notes>
- **Constraints:** <legacy deps, platform limits, SLOs/Uptime>

## 6. Delivery Plan
- **Milestones:** <date + owner for discovery/design/build/launch>
- **Definition of done:** <what makes v1 shippable>
- **Acceptance tests:** <manual scripts + automated test mapping. Note command per layer: `npm run test:unit` (Jest), `npm run test:e2e` (Playwright, needs `E2E_BASE_URL`), `npm run test:a11y` (Pa11y, needs `A11Y_BASE_URL`).>

## 7. Ways of Working
- **Communication cadence:** <standups/async rhythm>
- **Decision log (table):**
  - Date | Decision | Owner | Rationale
- **Risks & mitigations:** <rank probability/impact>
- **Approvals:** <who signs off design, copy, release>

## 8. Artifacts & References
- **Links:** <figma, tickets, dashboards>
- **Content inventory:** <pages/assets + owners + freshness dates>
- **Runbook hooks:** <what should be mirrored into /docs/runbooks>

## 9. After Launch
- **Monitoring:** <dashboards, alert thresholds>
- **Support model:** <on-call, escalation path>
- **Iteration backlog:** <next bets to test>
