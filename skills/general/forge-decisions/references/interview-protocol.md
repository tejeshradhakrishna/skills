# Interview Protocol

## Depth modes

| Mode | Coverage | Question style |
| --- | --- | --- |
| Rapid | Critical path and highest risks | Short; stop when the immediate decision is actionable |
| Standard | All material branches | Default balance of rigor and speed |
| Exhaustive | Full relevant graph, edge cases, rollout, and failure modes | Deep; use only when requested or stakes demand it |

Depth controls breadth, not question count per turn. Always ask one question at a time.

## Node priority

Choose the next decision in this order:

1. A prerequisite blocking several downstream decisions
2. A hard-to-reverse or high-cost choice
3. A safety, security, legal, privacy, or reliability risk
4. A contradiction between user intent and evidence
5. A high-uncertainty assumption
6. The next decision on the critical path

Skip a branch when its answer cannot materially change the plan.

## One-question contract

Use this compact shape:

```markdown
**Decision:** <one precise question>

**Recommendation:** <one specific answer>

**Why:** <the decisive trade-off in one to three sentences>
```

Add at most two alternatives only when the distinction is necessary for an informed choice. Do not hide the recommendation behind a neutral list.

## Process the answer

After each response:

1. Extract the selected decision and rationale.
2. Check it against prior decisions, constraints, terminology, and observable evidence.
3. If ambiguous, ask one clarifying question about the same node.
4. If contradictory, explain the conflict and ask which source is authoritative.
5. Mark the node resolved only when the answer is actionable.
6. Record downstream consequences and newly opened branches.
7. Update relevant artifacts.

Do not repeatedly restate the full session state. Provide a checkpoint only when the user asks, the topic changes, or the interview becomes long enough that orientation is useful.

## Decision ledger

Track privately:

| Field | Meaning |
| --- | --- |
| ID | Stable short label |
| Question | Decision being resolved |
| Status | Unexamined, active, resolved, deferred, contradicted |
| Selection | User's confirmed choice |
| Rationale | Why it was chosen |
| Evidence | Exact supporting artifact or observation |
| Depends on | Prerequisite nodes |
| Unlocks | Downstream nodes |
| Revisit condition | Trigger for a deferred or reversible choice |

Do not expose the ledger unless it improves the user's decision or they request it.
