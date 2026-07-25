# Interview Protocol

Use this protocol for every Forge track that asks the user to decide.

## Contents

- [Depth modes](#depth-modes)
- [Evidence ledger](#evidence-ledger)
- [Decision graph](#decision-graph)
- [One-question contract](#one-question-contract)
- [Process an answer](#process-an-answer)
- [Checkpoints and resumption](#checkpoints-and-resumption)
- [Interview quality gate](#interview-quality-gate)

## Depth modes

| Mode | Coverage | Stop condition |
| --- | --- | --- |
| `rapid` | Critical path, irreversible choices, and highest risks | The immediate direction is safe and actionable |
| `standard` | Every material activated branch | All consequential nodes have a disposition |
| `exhaustive` | Full relevant graph, counterfactuals, edge cases, operations, and rollout | No relevant branch can materially change the direction without new evidence |

Depth controls breadth, not the one-question rule. Do not turn rapid mode into shallow guessing or exhaustive mode into indiscriminate questioning.

## Evidence ledger

Build this privately before the first question and update it throughout:

| Field | Meaning |
| --- | --- |
| ID | Stable short label |
| Claim | Atomic factual statement |
| Class | `verified`, `user-stated`, `inferred`, `unknown`, or `conflicted` |
| Source | Exact path, URL, tool result, conversation statement, or artifact |
| Authority | Why this source should or should not control |
| Freshness | Date, version, or `unknown` |
| Confidence | `high`, `medium`, or `low` with a short reason |
| Affects | Decision nodes influenced by the claim |

### Evidence rules

- Use `verified` only for directly observed evidence.
- Use `user-stated` for the user's factual assertion until independently verified.
- Use `inferred` only when the reasoning link is explicit.
- Use `conflicted` when credible sources disagree.
- Do not collapse confidence into truth; a confident inference is still an inference.
- Prefer the source closest to the behavior: current code or telemetry for implemented behavior, approved policy for required behavior, and the user for intent or decision rights.
- Do not silently resolve a consequential conflict by source hierarchy. Explain the conflict and ask which source is authoritative.

## Decision graph

Track each node privately:

| Field | Meaning |
| --- | --- |
| ID | Stable short label |
| Question | Decision to resolve |
| Status | `unexamined`, `active`, `resolved`, `deferred`, `rejected`, `contradicted`, or `superseded` |
| Selection | Confirmed answer |
| Rationale | Why it was selected |
| Evidence | Ledger IDs or exact references |
| Confidence | Confidence in the premise and decision |
| Depends on | Prerequisite nodes |
| Unlocks | Downstream nodes |
| Consequences | Material downstream effects |
| Revisit condition | Trigger for reconsideration |
| Artifact impact | Files or sections requiring an update |

### Node priority

Choose the next node in this order:

1. A prerequisite that blocks several downstream decisions
2. A hard-to-reverse, high-cost, or lock-in choice
3. A safety, security, legal, privacy, reliability, or existential risk
4. A contradiction between intent and evidence
5. A boundary, ownership, identity, or source-of-truth ambiguity
6. A high-uncertainty assumption with high impact
7. A time-sensitive choice on the critical path
8. The next material decision needed for convergence

Use dependency centrality, irreversibility, impact, uncertainty, and urgency as tie-breakers. Skip any node whose answer cannot change the plan.

## One-question contract

Ask exactly one question:

```markdown
**Decision:** <one precise choice the user can resolve>

**Recommendation:** <one specific answer>

**Why:** <the decisive trade-off in one to three sentences>
```

Add these only when they materially improve the choice:

```markdown
**Evidence:** <one or two exact supporting observations>
**Reversibility:** <easy, moderate, or hard; why>
```

Rules:

- Ask for a decision, not a discoverable fact.
- Make the options mutually intelligible and actionable.
- Recommend one answer; do not hide behind a neutral list.
- Add at most two alternatives when comparison is necessary.
- State a recommendation's material downside, not only its benefit.
- Avoid compound questions joined by “and,” nested subquestions, or surveys.
- If the premise is conflicted, the one question must resolve the authority or premise first.

## Process an answer

After each user response:

1. Extract the selected decision and stated rationale.
2. Test it against prior decisions, constraints, evidence, terminology, and activated coverage.
3. If ambiguous, ask one clarifying question on the same node.
4. If contradictory, show the exact conflict and ask which statement or source controls.
5. If the user rejects the recommendation, record their selection without arguing unless it creates a material inconsistency or unacknowledged risk.
6. If deferred, require a reason and a concrete revisit condition when possible.
7. Mark the node resolved only when the answer is actionable.
8. Record consequences, newly opened branches, and artifact impacts.
9. Update affected artifacts before moving downstream.
10. Re-rank the graph.

Never silently convert “maybe,” “probably,” or “we can decide later” into a resolved decision.

## Checkpoints and resumption

Provide a compact checkpoint when the user asks, the focus changes, the session becomes long, or a handoff is likely:

- Objective and active track
- Verified constraints
- Resolved, deferred, and contradicted nodes
- Current active node
- Next three likely branches
- Updated artifacts
- Evidence or assumptions limiting confidence

When resuming, re-read the latest artifacts and observable workspace state. Reverify material facts, preserve valid decisions, mark stale evidence, and continue from the highest-priority unresolved node instead of restarting.

Use `FORGE-STATE.md` only for long-running work that needs durable resumption. It is operational state, not an authoritative design document.

## Interview quality gate

Before moving to the next node, verify:

- Exactly one decision was asked.
- A clear recommendation was given.
- Observable facts were not delegated to the user.
- The premise is supported or explicitly uncertain.
- The answer has an actionable disposition.
- Dependencies and consequences were recorded.
- Terminology remains canonical.
- Artifacts reflect the latest confirmed decision.

Do not print this checklist unless the user requests an audit.
