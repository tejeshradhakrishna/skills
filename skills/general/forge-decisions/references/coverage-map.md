# Decision Coverage Map

Use this map selectively. Activate only branches relevant to the user's objective and stakes.

## Direction

- Problem, desired outcome, and measurable success
- Actors, beneficiaries, and decision owner
- Scope, non-goals, constraints, and time horizon
- Existing commitments and reversibility

## Domain

- Canonical terms and avoided synonyms
- Entities, identities, value concepts, and ownership
- Boundaries and bounded contexts
- Invariants and business rules
- States, transitions, events, and lifecycle
- Relationships, cardinality, and source of truth

## Experience and workflow

- Primary journey and alternate paths
- Inputs, outputs, and handoffs
- Permissions, roles, approvals, and escalation
- Edge cases, cancellation, retries, and partial completion
- Accessibility, localization, and human factors when relevant

## Data and integration

- Data ownership, retention, privacy, and sensitivity
- Contracts, schemas, consistency, and synchronization
- External systems, dependency failure, and fallback behavior
- Migration, import, export, and compatibility

## Quality and operations

- Acceptance criteria and validation evidence
- Security, safety, abuse, and compliance
- Performance, capacity, availability, and cost
- Observability, support, recovery, and incident response
- Rollout, feature control, rollback, and deprecation

## Delivery

- Sequence, milestones, dependencies, and ownership
- Build-versus-buy and irreversible technology choices
- Testing strategy and release gates
- Risks, assumptions, and stop conditions

## Scenario probes

Use concrete scenarios rather than abstract prompts:

- Normal success
- Invalid or incomplete input
- Duplicate or concurrent action
- Dependency timeout or partial failure
- Permission change mid-flow
- Cancellation, reversal, or retry
- Data disagreement between sources
- Upgrade, migration, or rollback
- High-volume or degraded operation

## Contradiction triggers

Stop and resolve when:

- Two terms refer to the same concept or one term refers to multiple concepts.
- A decision violates a stated constraint or prior decision.
- Code or artifacts disagree with the user's description.
- Success criteria cannot be tested.
- Ownership is duplicated or absent.
- A downstream choice assumes an unresolved prerequisite.
- A proposed ADR records an obvious or easily reversible choice.
