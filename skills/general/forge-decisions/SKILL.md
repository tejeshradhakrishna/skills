---
name: forge-decisions
description: Forge a plan into a decision-complete direction through one-question interviews, domain modeling, ADRs, and verified artifacts. Use only for an explicit decision-forging or plan stress-test request.
---

# Decision Forge

Turn an uncertain plan, design, architecture, or proposal into a verified, decision-complete direction. Resolve the highest-leverage uncertainty first, make the language precise, and leave durable documentation that another person can trust.

## Load the right protocols

Before the first question, select a track and read only the protocols it needs:

| Track | Use | Required references |
| --- | --- | --- |
| `full` | Stress-test the whole plan and document it | `interview-protocol.md`, `coverage-map.md`, `artifact-templates.md`; add domain and ADR protocols when activated |
| `interview` | Resolve decisions without producing the full document set | `interview-protocol.md`, `coverage-map.md` |
| `domain` | Sharpen ubiquitous language, boundaries, and rules | `interview-protocol.md`, `domain-modeling-protocol.md` |
| `adr` | Resolve and record one architectural decision | `interview-protocol.md`, `adr-protocol.md` |
| `audit` | Find gaps, contradictions, and weak evidence in an existing plan | `interview-protocol.md`, `coverage-map.md`, `artifact-templates.md` |

Read [references/composition-contract.md](references/composition-contract.md) when another workflow needs a scoped Forge track or the user asks for a reusable interview primitive.

## Preserve these guarantees

- Run only after an explicit user request.
- Ask exactly one decision question per turn and wait for its answer.
- Include one specific recommended answer with every decision question.
- Retrieve observable facts from accessible conversations, files, code, tools, and artifacts instead of asking the user.
- Leave genuine choices to the user; never disguise an assumption as a decision.
- Keep verified facts, user statements, imposed constraints, inferences, decisions, and unknowns distinct.
- Do not implement the plan while forging it.
- Never fabricate evidence, agreement, owners, dates, file writes, approvals, or test results.
- Redact credentials, secrets, and irrelevant sensitive information.
- Remain usable without another skill, vendor, filesystem, or integration.

## Interpret the request

Extract four optional controls:

1. **Focus**: the plan, proposal, architecture, domain, or decision.
2. **Track**: `full`, `interview`, `domain`, `adr`, or `audit`.
3. **Depth**: `rapid`, `standard`, or `exhaustive`.
4. **Delivery**: `inline`, `file`, or `both`.

Default to `full`, `standard`, and the safest user-visible delivery supported by the surface. Infer a clear focus from active context. Ask one scoping question only when the target itself is ambiguous.

## Establish the evidence base

Inspect relevant plans, specifications, glossaries, ADRs, tickets, code, configuration, schemas, tests, telemetry, and prior decisions before interviewing.

Build a private evidence ledger using the schema in `interview-protocol.md`. Record:

- Evidence class and exact source
- What it supports or contradicts
- Authority, freshness, and confidence
- Any unresolved conflict

Never treat absence of evidence as evidence of absence. When sources conflict, surface the consequential conflict and ask which source is authoritative.

## Build the decision graph

Create a private graph of material decisions and activate only relevant branches from `coverage-map.md`.

- Model prerequisites, downstream consequences, and cross-branch dependencies.
- Track nodes as `unexamined`, `active`, `resolved`, `deferred`, `rejected`, `contradicted`, or `superseded`.
- Rank nodes by dependency centrality, irreversibility, risk, uncertainty, and time sensitivity.
- Skip questions answerable from evidence and branches that cannot change the direction.
- Add new nodes when an answer reveals a hidden dependency, ambiguity, or failure mode.

Do not expose the full graph unless the user asks or seeing it would materially improve a decision.

## Run the forging loop

For each active node:

1. Verify the factual premise.
2. Ask one precise decision question using the contract in `interview-protocol.md`.
3. Recommend one answer and name the decisive trade-off.
4. Wait for the user.
5. Resolve ambiguity or contradiction on the same node before moving downstream.
6. Record the decision, rationale, consequences, evidence, dependencies, and revisit condition.
7. Update affected artifacts immediately.
8. Re-rank the graph.

Use adversarial probes from `coverage-map.md` when a decision is high-risk, hard to reverse, weakly evidenced, or overly optimistic. Do not ask low-value preference questions.

## Deepen the domain model

Activate [references/domain-modeling-protocol.md](references/domain-modeling-protocol.md) when domain language, ownership, lifecycle, invariants, or bounded contexts affect the plan.

- Challenge vague, overloaded, synonymous, or conflicting terms immediately.
- Establish opinionated canonical language and explicit avoided synonyms.
- Define what a concept is, not how it is implemented.
- Probe identity, ownership, boundaries, invariants, states, transitions, events, relationships, and sources of truth.
- Test the model with concrete normal, edge, failure, concurrency, and reversal scenarios.
- Compare the language with accessible code and artifacts; resolve disagreements.
- Update `CONTEXT.md` or `CONTEXT-MAP.md` as terms crystallize.

## Craft ADRs deliberately

Read [references/adr-protocol.md](references/adr-protocol.md) before proposing or writing an ADR.

Create an ADR only when the decision is hard to reverse, surprising without context, and based on a genuine trade-off. Use its qualification catalog to recognize architectural shape, integration patterns, lock-in, boundaries, deliberate deviations, invisible constraints, and non-obvious rejected alternatives. Skip routine or easily reversible choices.

## Maintain durable artifacts

Use [references/artifact-templates.md](references/artifact-templates.md). Create artifacts lazily and preserve project conventions.

- Maintain `DECISION-BRIEF.md` for the resolved direction, scope, decisions, evidence, scenarios, risks, validation, and next action.
- Maintain a decision register inside the brief; split it into `DECISION-REGISTER.md` only for large or multi-workstream efforts.
- Maintain `CONTEXT.md` and `CONTEXT-MAP.md` only when domain language or multiple contexts justify them.
- Create ADRs only through the ADR protocol.
- Add a compact `FORGE-STATE.md` only when a long-running session needs reliable resumption.

When a writable project filesystem is unavailable, create user-visible Markdown artifacts when supported. Otherwise render complete proposed files inline under their intended filenames. Never depend on an operating-system temporary directory or claim an unperformed write.

## Drive to verified convergence

Before declaring shared understanding, run the quality gates in `artifact-templates.md` and confirm:

- Every material node is resolved or explicitly deferred with an owner or revisit condition when known.
- No unresolved contradiction blocks a downstream decision.
- Goals, non-goals, constraints, actors, success measures, and decision rights are clear.
- Activated coverage branches have a disposition.
- Canonical terms, boundaries, invariants, scenarios, and sources of truth agree.
- Major risks, failure modes, rollout concerns, and validation expectations have evidence, mitigation, ownership, or an explicit unknown.
- Every ADR still qualifies and agrees with the decision brief and domain language.
- No artifact overstates evidence, certainty, completion, or approval.

Then ask the user to confirm shared understanding. If they identify a gap, add it to the graph and continue.

## Finish

After confirmation:

1. Summarize the resolved direction and decisive trade-offs.
2. Separate confirmed, rejected, deferred, contradicted, and superseded decisions.
3. Link or render the artifacts created or updated.
4. State the first safe next action and its owner when known.
5. Name the most important residual risk or assumption.
6. State which track and depth were completed.

Do not start implementation unless the user separately requests it.
