# Assurance and Delivery Coverage

Activate whenever security, privacy, safety, legal exposure, reliability, operations, validation, or rollout could materially alter the plan. Do not wait for the user to name a plausible high-impact risk.

## Quality and protection

- Acceptance criteria and the evidence required to claim success
- Security, privacy, abuse, safety, compliance, and threat boundaries
- Performance, capacity, availability, durability, and cost ceilings
- Degraded behavior, fail-open versus fail-closed policy, and blast radius
- Accessibility, human review, auditability, and harmful failure ownership

## Operations and delivery

- Observability, alerting, support, recovery, incident response, and disaster recovery
- Testing strategy, release gates, approval authority, and independent validation
- Sequence, dependencies, owners, staffing, budget, and maintenance burden
- Feature control, staged rollout, migration, rollback, deprecation, and compatibility
- Kill criteria, stop conditions, exceptions, and review cadence

## Probes

- Assume a dependency times out during a partial commit.
- Remove telemetry during degraded operation.
- Exercise retry, rollback, recovery, and disaster operation.
- Introduce malicious input, compromised integration, insider misuse, or data leakage.
- Ask what evidence would prove the mitigation works.
- Ask who acts at 03:00 when the named owner is unavailable.
- Reverse a key constraint and test whether the decision still holds.

Interrupt when a plan claims safety or readiness without testable evidence, a risk has no disposition, recovery depends on an unverified mechanism, rollout has no stop condition, or an artifact marks unresolved work complete.
