# Composition Contract

Use this contract when the user wants only one Forge capability or when a larger workflow needs a bounded decision-forging phase. It preserves Forge's rigor without forcing the full artifact set.

## Track interface

| Track | Input | Required behavior | Output |
| --- | --- | --- | --- |
| `interview` | Focus, known facts, constraints, desired depth | Resolve the decision graph one question at a time | Confirmed decision records and next safe action |
| `domain` | Context, existing language, code or artifacts | Sharpen terms, boundaries, invariants, and scenarios | Updated or rendered context glossary and map |
| `adr` | Candidate decision, alternatives, constraints, evidence | Resolve the choice and apply the ADR qualification gate | Compact ADR or an explicit reason to skip it |
| `audit` | Existing plan or decision artifacts | Inspect coverage, evidence, contradictions, and artifact consistency | Prioritized gap report; one decision question if needed |
| `full` | Plan, design, architecture, or proposal | Combine all relevant tracks adaptively | Decision-complete brief and justified supporting artifacts |

## Inputs

Accept these controls when supplied:

```yaml
focus: <decision or plan>
track: full | interview | domain | adr | audit
depth: rapid | standard | exhaustive
delivery: inline | file | both
known_facts:
  - <claim and source>
constraints:
  - <constraint>
existing_decisions:
  - <decision and status>
desired_artifacts:
  - <artifact>
```

Do not require this syntax; infer controls from natural language.

## Guarantees

Every track must:

- Inspect available evidence before asking.
- Ask no more than one decision question per turn.
- Recommend one answer.
- Keep facts, decisions, assumptions, and unknowns distinct.
- Record dependencies, consequences, and revisit conditions.
- Avoid implementation until separately requested.
- Return complete inline content when file delivery is unavailable.

Tracks may share the evidence ledger, decision graph, canonical language, and artifact IDs. Do not duplicate conflicting state between tracks.

## Composition rules

- Start with the narrowest track that satisfies the request.
- Promote to `full` only when the user asks or when omitted branches would create a material blind spot; explain the reason.
- Activate `domain` inside another track when terminology or boundaries block a decision.
- Activate `adr` only after a candidate passes the qualification gate.
- Use `audit` before reopening an existing plan; preserve still-valid decisions.
- Return control after the scoped track reaches its stop condition. Do not continue into implementation.

## Track handoff

When moving between tracks, pass:

- Objective and depth
- Verified evidence and conflicts
- Resolved, deferred, and active decision nodes
- Canonical terms and affected contexts
- Artifact paths and latest update state
- Current highest-priority uncertainty

This handoff may remain private inside one Forge run. Render it only when the user asks or another session must continue.

## Minimal outputs

### Resolved decision

```markdown
**Decision ID:** <ID>
**Selection:** <confirmed choice>
**Rationale:** <decisive reason>
**Evidence:** <exact source or evidence class>
**Consequences:** <material effects>
**Revisit when:** <condition or never specified>
```

### Audit gap

```markdown
**Gap:** <missing, weak, or contradictory element>
**Impact:** <what it can invalidate>
**Evidence:** <exact reference>
**Next decision:** <highest-leverage question>
**Recommendation:** <specific answer>
```

Use these records as building blocks; do not force them into user-facing output when the full artifact template is more appropriate.
