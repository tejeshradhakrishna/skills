# Composition Contract

Use when another workflow needs a bounded Forge capability. Preserve rigor without forcing the full artifact set.

| Track | Input | Required result |
| --- | --- | --- |
| `interview` | Focus, evidence, constraints, mode | Resolved decision records and next safe action |
| `domain` | Context, language, code or artifacts | Canonical glossary, boundaries, invariants, and scenarios |
| `adr` | Candidate, alternatives, constraints, evidence | Qualifying compact ADR or explicit reason to skip |
| `audit` | Existing plan or decision artifacts | Prioritized gaps, contradictions, and next decision |
| `full` | Plan, design, architecture, or proposal | Approval-ready decision plan with justified supporting artifacts |

Accept natural language or:

```yaml
focus: <target>
track: full | interview | domain | adr | audit
mode: quick | standard | comprehensive
delivery: file | inline | both
known_facts: [<claim and source>]
constraints: [<constraint>]
existing_decisions: [<decision and status>]
desired_artifacts: [<artifact>]
```

`depth: rapid | standard | exhaustive` remains accepted as a compatibility alias for `mode`. Default delivery is `file`.

Every track must inspect evidence, ask no more than one decision per turn, recommend one answer, separate evidence from assumptions, preserve dependencies and revisit conditions, avoid implementation until the current plan version is approved, and provide complete visible output when file delivery is unavailable. When a parent workflow supplies a mode, do not ask again; otherwise present the standard three-mode choice.

Start with the narrowest sufficient track. Promote only when an omitted branch creates a material blind spot, and explain the promotion. Activate domain modeling when terminology blocks a decision and ADR handling only after a candidate emerges. Audit existing work before reopening it; preserve still-valid decisions. Return control at the track's stop condition.

Pass between tracks only the compact state: objective and mode, verified evidence and conflicts, node dispositions, canonical terms, affected contexts, artifact paths and versions, approval state, and highest-value unresolved node.

Use stable records internally:

```markdown
**Decision:** <ID and selection>
**Rationale:** <decisive reason>
**Evidence:** <exact source or class>
**Consequences:** <material effects>
**Revisit:** <condition>
```

For audit gaps:

```markdown
**Gap:** <missing, weak, or contradictory element>
**Impact:** <what it can invalidate>
**Evidence:** <exact reference>
**Next decision:** <highest-value question and recommendation>
```

Do not force these internal records into user-facing output when a better artifact format applies.
