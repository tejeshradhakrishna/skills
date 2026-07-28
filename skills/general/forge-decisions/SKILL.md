---
name: forge-decisions
description: Forge a plan into a decision-complete direction through a user-selected interview mode, evidence-led one-question interviews, domain modeling, adversarial testing, ADRs, and an approval-gated plan file. Use only for an explicit decision-forging, plan stress-test, decision audit, domain-modeling, or ADR request.
---

# Decision Forge

Turn uncertainty into a verified, reviewable plan. Resolve the highest-value decision first, sharpen language, test consequential choices, and make no implementation change before plan approval.

## Choose the interview mode

If the user did not already name a mode, display this menu and wait:

```markdown
Choose how deeply Decision Forge should examine the task:

1. **Quick** — Ask only high-level questions and critical blockers needed to create a workable plan.
2. **Standard — Recommended** — Cover high-level direction and the low-level decisions needed to make the plan execution-ready.
3. **Comprehensive** — Activate the full power of Decision Forge with exhaustive analysis, scenarios, risks, edge cases, operations, and documentation.
```

Accept a number, mode name, or clear equivalent; require no other configuration. Modes control relevance and depth, never question count. Impose no question limit: Quick saves tokens by pruning nonessential branches, while every mode continues until its quality threshold is met. Permit switching modes without discarding valid decisions.

## Route and load progressively

Infer **Focus** and the narrowest sufficient **Track** (`full`, `interview`, `domain`, `adr`, or `audit`). Default **Delivery** to `file`; use a user-visible Markdown artifact or complete inline fallback when files are unavailable.

After mode selection, read [the decision engine](references/interview-protocol.md) once. Load no other reference until its branch activates:

- [Direction and experience](references/coverage-direction.md): objective, value, scope, actors, workflow, governance
- [System and data](references/coverage-system.md): boundaries, architecture, data, integration, migration
- [Assurance and delivery](references/coverage-assurance.md): security, privacy, reliability, operations, validation, rollout
- [AI and economics](references/coverage-ai-economics.md): probabilistic automation, incentives, cost, vendor exposure
- [Domain modeling](references/domain-modeling-protocol.md): language, identity, ownership, lifecycle, invariants, contexts
- [ADR protocol](references/adr-protocol.md): only after a durable architectural candidate emerges
- [Artifact and approval system](references/artifact-templates.md): only for checkpoints, audit delivery, final plan production, or post-approval execution
- [Composition contract](references/composition-contract.md): only when another workflow requests a bounded track

Never preload all references. Activate one relevant branch at a time, do not reload unchanged references, and stop loading when more guidance cannot affect the selected mode's plan quality.

## Guarantees

- Run only after an explicit request.
- Ask exactly one decision question per turn; give one specific recommendation and its decisive trade-off; then wait.
- Retrieve observable facts from accessible evidence; ask only for decisions, intent, authority, or inaccessible facts.
- Keep verified evidence, user statements, constraints, inferences, decisions, conflicts, and unknowns distinct.
- Never fabricate evidence, agreement, owners, dates, writes, approvals, tests, or completion.
- Remain read-only with respect to implementation while the plan is draft or under revision.
- Treat approval as applying only to the current plan version and scope.
- Never let an approval choice bypass platform permissions, protected actions, destructive-action safeguards, or required external authorization.
- Redact secrets and irrelevant sensitive information.
- Work without another skill, vendor, integration, or writable filesystem.

## Forge

1. Inspect the smallest authoritative evidence set that establishes the premise.
2. Build the private evidence ledger, compact decision graph, and small active window.
3. Activate only coverage needed by the selected mode's highest-value unresolved node.
4. Ask that decision; skip discoverable facts and choices unable to change the plan.
5. Record only the answer's state delta, test consequences and contradictions, apply proportionate scenarios or adversarial probes, and re-rank.
6. Continue until the selected mode's stop condition is satisfied.

Interrupt downstream work when evidence conflicts, terminology is ambiguous, ownership or authority is unclear, or a decision violates a constraint.

Keep state compact. Do not restate settled context or the full ledger. Update confirmed domain language immediately; batch other artifacts at meaningful checkpoints or final delivery. Use `FORGE-STATE.md` only for long or cross-session work.

## Produce and gate the plan

Read the artifact and approval system. Create or update reviewable `DECISION-PLAN.md`, preserve project conventions, or use its complete visible fallback. Mark it `Draft`, assign or increment its version, summarize it, and present the defined approval choices.

Do not implement while the user revises or rejects the plan. A material plan change creates a new version and requires fresh approval. After approval, execute only according to the selected approval mode and the approved scope.
