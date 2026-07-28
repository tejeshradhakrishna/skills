# System and Data Coverage

Activate only for boundaries, data, integration, architecture, migration, or durable technology choices. Activate the domain-modeling protocol when language or ownership blocks resolution.

## Domain and boundaries

- Canonical terms, identity, ownership, invariants, lifecycle, and authority
- Bounded contexts, responsibilities, published contracts, and change cadence
- Policies, permissions, state transitions, events, and temporal rules

## Data and integration

- Data owner, classification, consent, retention, deletion, residency, and lineage
- Source of truth, identity resolution, deduplication, reconciliation, and auditability
- Contracts, schemas, versioning, consistency, synchronization, timeout, and fallback
- External dependencies, compatibility, import/export, migration, and exit strategy

## Architecture

- Boundary placement, coupling, consistency model, and failure containment
- Build-versus-buy, lock-in, portability, maintenance burden, and reversibility
- Capacity, latency, cost, and organizational constraints that shape the design

## Probes

- Duplicate, reorder, delay, or concurrently apply the same action.
- Fail one dependency after another component has committed.
- Present two credible sources of truth with conflicting values.
- Change a schema or contract while consumers run older versions.
- Place an edge case exactly between two owners.
- Test migration, rollback, historical correction, and downstream replay.
- Increase volume, latency, or organizational scale by 10×.

Interrupt when one term names multiple concepts, ownership or authority is unclear, a downstream choice assumes an unresolved boundary, or intended language conflicts with code or artifacts.
