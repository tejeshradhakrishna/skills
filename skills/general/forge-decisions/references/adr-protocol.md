# ADR Protocol

Use an Architecture Decision Record only for durable decisions whose rationale would otherwise be lost. Optimize for signal, not ceremony.

## Contents

- [Qualification gate](#qualification-gate)
- [What qualifies](#what-qualifies)
- [What does not qualify](#what-does-not-qualify)
- [Resolve before writing](#resolve-before-writing)
- [Placement and numbering](#placement-and-numbering)
- [ADR format](#adr-format)
- [Lifecycle and supersession](#lifecycle-and-supersession)
- [ADR quality gate](#adr-quality-gate)

## Qualification gate

Create an ADR only when all three are true:

1. **Hard to reverse:** changing later has meaningful technical, organizational, migration, contractual, or financial cost.
2. **Surprising without context:** a reasonable future reader could mistake the choice for an error or reopen it without the rationale.
3. **A genuine trade-off:** viable alternatives existed and the decision favored specific outcomes while accepting real downsides.

If any condition is missing, keep the decision in `DECISION-BRIEF.md` and skip the ADR.

## What qualifies

- **Architectural shape:** monolith versus services, event-sourced write model, multi-tenant isolation model, offline-first architecture.
- **Integration pattern:** domain events versus synchronous calls, orchestration versus choreography, consistency and failure semantics between contexts.
- **Lock-in:** database, message bus, identity provider, deployment platform, proprietary model provider, or data format that is expensive to replace.
- **Boundary and ownership:** which context owns customer data, where authorization decisions live, what other contexts may reference but not mutate.
- **Deliberate deviation:** manual SQL instead of an ORM, a custom protocol instead of the dominant standard, duplication chosen to preserve autonomy.
- **Invisible constraint:** compliance, contractual latency, data residency, hardware, licensing, organizational, or partner constraints not obvious from code.
- **Non-obvious rejection:** a credible alternative will predictably be proposed again unless the reason for rejecting it is recorded.
- **Irreversible operational posture:** disaster-recovery model, audit architecture, encryption boundary, fail-open versus fail-closed policy.
- **AI authority and containment:** model autonomy, tool permissions, human approval boundary, provider lock-in, evaluation or fallback architecture.

## What does not qualify

- Routine library or framework selection with low switching cost
- Easily reversible configuration
- Temporary experiments or implementation sequencing
- Restating a requirement, policy, or obvious industry default
- A choice with no credible alternative
- A domain definition that belongs in `CONTEXT.md`
- A product or workflow decision adequately captured in the decision brief
- A decision made only because “that is what the code already does”

Do not create an ADR to make the documentation set look complete.

## Resolve before writing

Before offering an ADR, verify:

- The decision node is resolved rather than assumed.
- The context and forces are evidenced.
- At least one credible alternative is understood.
- The selected option and decisive rationale are explicit.
- Material downsides and consequences are acknowledged.
- The choice uses canonical domain language.
- No existing ADR already records or supersedes it.

Ask through the one-question interview contract until these conditions hold.

## Placement and numbering

Follow existing project conventions. Otherwise:

- Use `docs/adr/NNNN-slug.md`.
- Scan the target ADR directory for the highest number and increment it.
- Store system-wide decisions at the repository level.
- Store context-specific decisions near the bounded context when the project has a context map and local ADR convention.
- Use a short, outcome-oriented slug.

Never invent the next number without inspecting existing ADRs.

## ADR format

Default to a compact record:

```markdown
# <Short decision title>

<One to three sentences stating the context, selected decision, decisive rationale, and accepted downside.>
```

Add only sections that preserve useful information:

```markdown
## Status
accepted

## Considered options
- **<Option>** — <why it lost or when it would win>

## Consequences
- <non-obvious benefit, cost, risk, migration burden, or constraint>

## Evidence
- <exact artifact, measurement, policy, or decision ID>
```

Most ADRs should remain short. Add `Evidence` when the decision depends on a benchmark, policy, contract, threat model, or other source that future readers must verify.

Link the ADR to its decision-register ID when one exists. Reference authoritative artifacts instead of copying large explanations.

## Lifecycle and supersession

Use status only when lifecycle matters:

- `proposed`
- `accepted`
- `deprecated`
- `superseded by ADR-NNNN`

When revisiting:

1. Preserve the old ADR.
2. Create a new ADR when the replacement itself qualifies.
3. Mark the old record as superseded and link both directions.
4. Record which evidence, constraint, or assumption changed.
5. Update the decision brief and affected context artifacts.

Do not silently edit history so the old decision appears never to have existed.

## ADR quality gate

Before delivery, verify:

- All three qualification conditions are satisfied.
- The title names the decision, not the discussion topic.
- The selected option and “why” are unmistakable.
- The accepted downside or consequence is not hidden.
- Alternatives are included only when worth preserving.
- Evidence and identifiers are exact.
- Canonical domain language matches `CONTEXT.md`.
- Placement, numbering, status, and supersession are correct.
- The ADR does not duplicate the decision brief unnecessarily.

If the record fails the qualification gate, remove it and keep the decision in the brief.
