# ADR Protocol

Use an Architecture Decision Record only when durable rationale would otherwise be lost. Optimize for signal, not ceremony.

## Qualify

Create an ADR only when all three are true:

1. **Hard to reverse:** changing later has meaningful technical, migration, organizational, contractual, or financial cost.
2. **Surprising without context:** a future reader could mistake the choice for an error or reopen it without the rationale.
3. **Genuine trade-off:** credible alternatives existed and the selection accepts a real downside.

If any condition is missing, keep the decision in `DECISION-PLAN.md`.

Likely candidates include:

- architectural shape, integration, or consistency pattern
- lock-in involving data formats, platforms, identity, models, or vendors
- boundary, ownership, authorization, or source-of-truth placement
- deliberate deviation from an expected approach
- invisible compliance, residency, contractual, hardware, licensing, or organizational constraints
- a credible rejection likely to be proposed again
- irreversible recovery, encryption, audit, or fail-open/fail-closed posture
- AI authority, tool permissions, human approval, containment, evaluation, or fallback architecture

Skip reversible configuration, temporary experiments, routine libraries, requirements, obvious defaults, choices without credible alternatives, domain definitions, ordinary product decisions, and choices justified only by existing code.

## Resolve before writing

Verify that the decision node is resolved; context and forces are evidenced; at least one credible alternative is understood; selection and decisive rationale are explicit; downsides are acknowledged; canonical language is used; and no existing ADR already records or supersedes it. Continue the one-question interview until these conditions hold.

## Place and write

Follow project conventions. Otherwise:

- Use `docs/adr/NNNN-slug.md`.
- Inspect the target directory, increment the highest number, and never invent a number.
- Keep system-wide decisions at repository level.
- Keep context-specific decisions near the context only when a local convention exists.

Use a short outcome-oriented title and compact default:

```markdown
# <Short decision title>

<Context, selected decision, decisive rationale, and accepted downside in one to three sentences.>

## Status
accepted

## Considered options
- **<Option>** — <why it lost or when it would win>

## Consequences
- <non-obvious benefit, cost, risk, migration burden, or constraint>

## Evidence
- <exact artifact, measurement, policy, or decision ID>
```

Omit optional sections that preserve no future value. Include evidence when a benchmark, policy, contract, threat model, or similar source controls. Link a stable decision ID when available and reference authoritative material instead of copying it.

## Preserve history

Use `proposed`, `accepted`, `deprecated`, or `superseded by ADR-NNNN` only when lifecycle matters. When replacing a decision:

1. Preserve the previous ADR.
2. Create a new ADR only when the replacement qualifies.
3. Link both directions and mark the previous record superseded.
4. Record the changed evidence, constraint, or assumption.
5. Update linked decision and domain artifacts.

## Gate

Reapply the three qualification conditions before delivery. Verify that the title names the decision; selection, rationale, and accepted downside are unmistakable; evidence and identifiers are exact; canonical language agrees; placement, numbering, and supersession are correct; and the record does not duplicate the plan. If it fails, remove the ADR and keep the decision in the plan.
