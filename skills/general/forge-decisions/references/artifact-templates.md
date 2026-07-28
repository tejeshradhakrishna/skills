# Artifact and Approval System

Load only at a checkpoint, audit delivery, final plan production, or approved implementation. Preserve project conventions and one authoritative location for each fact.

## Contents

- [Select lazily](#select-lazily)
- [Decision plan](#decision-plan)
- [Resumable state](#resumable-state)
- [Delivery](#delivery)
- [Approval gate](#approval-gate)
- [Final gate](#final-gate)

## Select lazily

| Artifact | Create only when |
| --- | --- |
| `DECISION-PLAN.md` | Every completed Forge run; use the project's established plan filename when one exists |
| `DECISION-REGISTER.md` | Many decisions or workstreams make an embedded register hard to review |
| `CONTEXT.md` | A domain term, rule, or boundary is resolved |
| `CONTEXT-MAP.md` | Multiple real bounded contexts exist |
| ADR | The ADR protocol's three conditions pass |
| `FORGE-STATE.md` | Long or cross-session work needs reliable resumption |

Do not create empty ceremony. Reference authoritative artifacts rather than copying them.

## Decision plan

Create or update `DECISION-PLAN.md` by default. Use the user's established filename when present. Preserve user-written content and project conventions.

```markdown
# <Plan or design>

**Status:** Draft
**Plan version:** <positive integer>
**Mode:** Quick | Standard | Comprehensive
**Scope:** <short scope boundary>

## Outcome
<Problem, beneficiaries, desired outcome, and measurable success>

## Scope and constraints
**In:** <included>
**Out:** <non-goals>
**Constraints:** <imposed limits>
**Decision owner:** <owner or unknown>

## Evidence
| ID | Claim | Class | Source | Confidence |
| --- | --- | --- | --- | --- |

## Decisions
| ID | Status | Selection | Rationale | Consequence | Evidence |
| --- | --- | --- | --- | --- | --- |

## Rejected alternatives
| Alternative | Why rejected | When it could win |
| --- | --- | --- |

## Deferred or contradicted
| ID | Status | Reason or conflict | Owner | Revisit condition |
| --- | --- | --- | --- | --- |

## Domain and scenarios
<Canonical concepts, boundaries, invariants, sources of truth, and scenarios; link domain artifacts>

## Architecture and integrations
<Boundaries, contracts, consistency, dependencies, and ADR links>

## Implementation plan
1. **<Step and intended outcome>**
   - Changes: <files, components, systems, or behavior>
   - Depends on: <prior step, evidence, approval, or none>
   - Verify: <specific check and expected result>
   - Stop if: <condition requiring revision or reapproval>

## Risks and validation
| Risk or claim | Impact | Evidence | Mitigation or test | Owner or gate |
| --- | --- | --- | --- | --- |

## Rollout and operations
<Sequence, observability, degraded behavior, rollback, support, and stop conditions>

## Completion criteria
- <observable condition proving the task is achieved>

## Residual uncertainty
<Most important assumption, unknown, or external dependency>
```

Omit irrelevant sections, never required substance. Quick may use only status metadata, Outcome, Scope and constraints, Decisions, Implementation plan, Risks and validation, Completion criteria, and Residual uncertainty. Standard adds all execution-driving detail. Comprehensive retains every relevant section and links supporting domain or ADR artifacts.

Use stable, meaningful IDs such as `D-IDENTITY-01`. Keep the decision register inside the plan unless separation improves independent review. A split register uses:

```markdown
| ID | Decision | Status | Selection | Depends on | Evidence | Revisit condition | Artifact |
| --- | --- | --- | --- | --- | --- | --- | --- |
```

## Resumable state

Keep `FORGE-STATE.md` compact and refresh it instead of appending:

```markdown
# Forge State: <focus>
- Mode/track: <values>
- Plan version: <number and status>
- Updated: <absolute time when known>
- Active node: <ID and question>

## Verified constraints
- <constraint and source>

## Node deltas
| ID | Status | Selection or blocker |
| --- | --- | --- |

## Canonical language
- <term>: <definition>

## Artifact state
- <path>: <latest verified update>

## Resume
<Highest-value next node and required evidence>
```

State is operational, not authoritative design. Remove or archive it when no longer needed, following user and project conventions.

Use the domain and ADR protocols for their artifacts. A decision keeps one ID across the graph, plan, register, ADR, validation, and state. Propagate status changes. Rejected or deferred choices must never appear confirmed elsewhere.

## Delivery

Default to `file`. Create or update the plan at the final checkpoint, then return its path plus a concise summary. Do not duplicate the full file inline.

If a writable filesystem is unavailable, create a downloadable or user-visible Markdown artifact when the platform supports one. Otherwise render the complete plan inline under its intended filename. Never claim an unperformed write.

## Approval gate

After the user reviews the Draft plan, present exactly:

```markdown
The plan is ready for review: `<path>` (version <N>).

1. **Approve and implement automatically** — Execute the approved plan end-to-end, pausing only for a blocker, material scope change, or required platform authorization.
2. **Approve with manual approval for edits** — Present each material edit batch for approval before applying it.
3. **Reject — revise the plan** — Make no implementation changes; continue refining the proposal.
```

Accept a number or unambiguous equivalent. Never infer approval from silence, praise, a request for explanation, or ambiguous wording. Approval applies only to the displayed plan version and scope.

For **automatic implementation**:

1. Mark the current version `Approved`.
2. Execute only its approved steps and scope.
3. Pause before any material deviation, newly discovered scope, unresolved blocker, destructive or protected action, or external authorization requirement.
4. Verify each stage and report failures honestly.

For **manual approval for edits**:

1. Mark the current version `Approved`.
2. Before each material batch, show the intended steps, affected files or systems, expected effect, meaningful risk, and verification.
3. Wait for explicit approval, apply only that batch, verify it, and report the result before proposing the next batch.

Do not reduce manual review to line-by-line noise. Batch related edits when they share one purpose and risk boundary.

For **revision**:

1. Keep the plan `Draft` and implementation read-only.
2. Record the feedback, reopen affected decisions, and ask one high-value question per turn when a decision is still needed.
3. Update the same plan, increment its version after any material change, summarize the delta, and present the gate again.

A material change to outcome, scope, architecture, dependencies, risks, rollout, completion criteria, or implementation steps invalidates prior approval. Re-read externally edited plans before execution. Never inherit approval across versions or scopes.

Platform permissions, safety policy, protected-action confirmation, destructive-action safeguards, and external authorization always take precedence over either approval mode.

After successful implementation, mark the approved version `Completed` and attach exact validation evidence. Use `Implementing`, `Blocked`, or `Superseded` when accurate. Never claim completion from edits alone.

## Final gate

Before presenting the Draft plan, verify:

- mode stop condition is satisfied without a question-count shortcut
- plan status, version, scope, implementation steps, validation, and completion criteria are explicit
- material claims have exact sources or explicit evidence classes
- every activated node has a disposition and blocking conflicts are resolved
- rationale, consequences, dependencies, deferrals, and revisit triggers are preserved
- canonical language, boundaries, invariants, scenarios, decisions, and ADRs agree
- relevant safety, privacy, reliability, operations, rollout, rollback, and validation have dispositions
- no credential, approval, owner, date, write, test, certainty, or completion is fabricated
- a fresh reviewer can identify the objective, settled direction, trade-offs, proposed edits, and residual uncertainty

Do not print the gate or a score unless requested.
