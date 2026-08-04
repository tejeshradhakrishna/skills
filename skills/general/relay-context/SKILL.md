---
name: relay-context
description: Immediately create a verified, privacy-safe continuity brief so another session, agent, or AI platform can resume the active work. Use only for an explicit handoff, continuation brief, or session transfer request.
---

# Relay Context

Create a compact, portable handoff for a zero-history agent.

## Execute

- Start immediately—no modes or setup questions. Infer focus from the request and active work. Treat free text as focus; a path is a destination only when explicitly identified.
- Snapshot only; do not continue or broaden the work.
- Always include mission and outcome; state with source or uncertainty (`Complete`, `In progress`, `Blocked`, or `Not started`); resume point, next safe action, and stop condition; material constraints or blockers; artifact references instead of copies; known relevant skills; and a standalone continuation prompt.
- Mark uncertainty. Never invent work, evidence, decisions, approvals, owners, dates, paths, or citations. Redact secrets and unnecessary personal information; use portable Markdown.

## Route components

Never preload references. Read matching components; when unsure, load the component.

- [verification.md](references/verification.md): checkable material claims, conflicts, stale evidence, inaccessible artifacts, or relay updates.
- [decisions.md](references/decisions.md): decisions, constraints, blockers, rejected approaches, risks, dependencies, or open questions.
- [technical-state.md](references/technical-state.md): code, files, tests, integrations, environment, access, or working-tree state.
- [delivery.md](references/delivery.md): explicit destinations, existing relays, source-controlled workspaces, or cross-platform transfer.

## Deliver

Use concise sections and omit irrelevant chronology. Return the complete brief inline by default. Create a file only when the user explicitly requests one; honor an explicit destination and never commit unless requested.

Apply a cold-start test: the next agent must know the goal, true state, next action, constraints, and stop condition. Return only the brief or link and material verification limitations.
