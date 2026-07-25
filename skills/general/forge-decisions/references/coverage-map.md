# Decision Coverage Map

Use this map selectively. Activate a branch only when its answers can change the direction, risk, architecture, or delivery.

## Contents

- [Activation rules](#activation-rules)
- [Coverage branches](#coverage-branches)
- [Scenario probes](#scenario-probes)
- [Adversarial techniques](#adversarial-techniques)
- [Contradiction triggers](#contradiction-triggers)

## Activation rules

- Start with the objective, constraints, and decision rights.
- Activate prerequisites before downstream implementation choices.
- Activate safety, security, privacy, legal, reliability, and irreversible-cost branches whenever plausible; do not wait for the user to name them.
- Activate domain modeling when language, boundaries, identity, ownership, lifecycle, or rules affect the plan.
- Activate AI-specific coverage only for systems that use models, agents, autonomous actions, or probabilistic outputs.
- Skip branches that cannot materially change the outcome.

Record every activated branch as `covered`, `not applicable`, `deferred`, or `blocked by unknown`.

## Coverage branches

### Direction and value

- Problem, desired outcome, beneficiaries, and decision owner
- Measurable success, leading indicators, and failure definition
- Scope, non-goals, constraints, and time horizon
- Existing commitments, opportunity cost, and reversibility
- Why this direction should exist instead of doing nothing

### Domain and language

- Canonical terms, avoided synonyms, and contested meanings
- Entities, identities, value concepts, and ownership
- Boundaries, bounded contexts, and responsibilities
- Invariants, policies, permissions, and business rules
- States, transitions, events, lifecycle, and temporal rules
- Relationships, cardinality, source of truth, and data authority

### Experience and workflow

- Actors, roles, permissions, incentives, and decision rights
- Primary journey, alternate paths, and handoffs
- Inputs, outputs, approvals, escalation, and cancellation
- Invalid input, partial completion, retry, reversal, and recovery
- Accessibility, localization, explainability, and human factors
- Support and operational ownership

### Data and integration

- Data ownership, classification, consent, retention, deletion, and residency
- Contracts, schemas, versioning, consistency, and synchronization
- Identity resolution, deduplication, lineage, and auditability
- External systems, dependency failure, timeout, and fallback behavior
- Import, export, migration, compatibility, and exit strategy
- Source-of-truth conflicts and reconciliation

### Quality, safety, and operations

- Acceptance criteria and required validation evidence
- Security, privacy, abuse, safety, compliance, and threat model
- Performance, capacity, availability, durability, and cost ceilings
- Observability, alerting, support, recovery, and incident response
- Degraded behavior, fail-open versus fail-closed, and blast radius
- Rollout, feature control, rollback, deprecation, and disaster recovery

### Delivery and governance

- Sequence, milestones, critical path, dependencies, and owners
- Build-versus-buy, lock-in, and irreversible technology choices
- Testing strategy, release gates, and approval authority
- Budget, staffing, maintenance burden, and opportunity cost
- Risks, assumptions, kill criteria, and stop conditions
- Change control, exception handling, and decision review cadence

### Economics and incentives

- Who pays, who benefits, who bears risk, and who can block
- Unit economics, cost growth, pricing, and resource constraints
- Incentives that could produce misuse, gaming, or perverse outcomes
- Switching cost, vendor leverage, and long-term operational burden

### AI and automation

Activate only when relevant:

- Model or agent authority, tool permissions, and human override
- Accuracy, calibration, uncertainty, and abstention behavior
- Evaluation datasets, adversarial tests, drift, and monitoring
- Prompt injection, data exfiltration, unsafe actions, and containment
- Provenance, explainability, audit trail, and user disclosure
- Model/provider portability, fallback, latency, and cost
- Failure ownership when probabilistic behavior causes harm

## Scenario probes

Use concrete stories rather than abstract questions:

- Normal success from trigger to verified outcome
- Invalid, incomplete, stale, or malicious input
- Duplicate, concurrent, reordered, or delayed action
- Dependency timeout, partial failure, and recovery
- Permission or policy change mid-flow
- Cancellation, reversal, retry, and compensation
- Conflicting sources of truth
- Migration, upgrade, rollback, and backward compatibility
- High-volume, degraded, offline, and disaster operation
- Insider misuse, external abuse, or compromised integration
- User misunderstanding, accessibility need, or support escalation
- Six months later: ownership changed and original rationale is missing

For domain-heavy work, express probes using canonical terms and verify that every noun and transition has an unambiguous meaning.

## Adversarial techniques

Apply selectively:

- **Premortem:** Assume the plan failed; identify the earliest avoidable cause.
- **Counterfactual:** Ask what would need to be true for the rejected option to win.
- **Constraint inversion:** Remove or reverse one constraint and test whether the decision still holds.
- **Reversibility test:** Estimate the practical cost and evidence required to undo the choice.
- **Boundary attack:** Put an edge case exactly between two owners or contexts.
- **Incentive attack:** Identify how a rational actor could game the system.
- **Scale jump:** Test at 10× volume, cost, latency, or organizational complexity.
- **Authority loss:** Remove a dependency, approver, vendor, or subject-matter expert.
- **Evidence challenge:** Identify which decision would change if the weakest assumption is false.

Do not perform every technique on every node. Use them where impact, uncertainty, or irreversibility justifies the attention.

## Contradiction triggers

Stop downstream questioning and resolve when:

- One term names multiple concepts or several terms name the same concept.
- A decision violates a stated constraint, invariant, policy, or prior decision.
- Code, telemetry, documentation, and user intent disagree materially.
- Success criteria cannot be measured or attributed.
- Ownership, authority, or source of truth is duplicated or absent.
- A downstream choice assumes an unresolved prerequisite.
- A proposed ADR is obvious, routine, or easily reversible.
- A mitigation depends on an unowned action or unverifiable evidence.
- An artifact marks a decision complete while its graph node is deferred or contradicted.
