# Relay Context Output Contract

Use this contract for every continuity brief. Omit irrelevant optional sections instead of filling them with noise.

## Contents

- [Depth modes](#depth-modes)
- [Output schema](#output-schema)
- [Mode adjustments](#mode-adjustments)
- [Quality gate](#quality-gate)

## Depth modes

| Mode | Target length | Use |
| --- | ---: | --- |
| Compact | 350–600 words | Fast transfer with only essential state and next actions |
| Standard | 700–1,200 words | Default balance of context, evidence, and actionability |
| Deep | 1,200–2,500 words | Complex work with several decisions, artifacts, risks, or technical details |

Treat the targets as guidance. Correctness and continuity readiness take priority over word count.

## Output schema

```markdown
# Relay Context: <short focus>

- Generated: <absolute date and time with timezone when known>
- Depth: <compact | standard | deep>
- Intended next step: <one sentence>

## Executive summary
<What matters now, why, and the current outcome in 2–5 bullets.>

## Objective and success criteria
<Goal, scope boundaries, and definition of done.>

## Verified current state
| Area | Status | Evidence |
| --- | --- | --- |
| ... | Complete / In progress / Blocked / Not started | Exact artifact, result, or observation |

## Decisions
| Decision | Rationale | Consequence | Owner/date |
| --- | --- | --- | --- |
| ... | ... | ... | ... |

## Work completed
<Verified outcomes only.>

## Work in progress
<Current activity, partial state, and safe resumption point.>

## Next actions
| Priority | Action | Owner | Dependency or stop condition |
| ---: | --- | --- | --- |
| 1 | ... | ... | ... |

## Blockers and risks
<Blocker or risk, impact, evidence, and mitigation when known.>

## Open questions
<Questions that materially affect the next decision or action.>

## Artifacts and references
<Exact paths, URLs, issue IDs, document titles, or message references.>

## Technical resume state
<Include only when relevant: directory, branch, dirty changes, commands, tests, environment, deployment.>

## Assumptions and uncertainties
<Clearly separated from verified facts.>

## Continuation prompt
> Continue <objective/focus>. First verify <critical state>. Then <highest-priority actions>. Respect <constraints and stop conditions>. Use <artifacts> as the authoritative references. Do not repeat <completed work>.
```

## Mode adjustments

### Compact

- Keep Executive summary, Verified current state, Next actions, Blockers and risks, Artifacts and references, and Continuation prompt.
- Merge or omit other sections when they add no continuation value.
- Include at most five next actions.

### Standard

- Use the full schema but omit empty optional sections.
- Include enough rationale to prevent the next agent from reopening settled decisions.
- Include at most eight next actions.

### Deep

- Use the full schema.
- Add subsections for independent workstreams when needed.
- Capture failed approaches and why they failed.
- Preserve validation evidence and environment constraints in detail.

## Quality gate

Before delivery, verify all of the following:

- A new agent can identify the goal, current state, and first safe action.
- Verified facts are separated from assumptions and unknowns.
- Completed and incomplete work cannot be confused.
- Decisions include rationale when available.
- Paths, URLs, commands, dates, owners, and results are exact.
- Referenced artifacts exist or are explicitly marked unverified.
- No secret or unnecessary sensitive data is present.
- The continuation prompt names the focus, constraints, evidence, and next actions.
- The brief contains no transcript-like repetition or contradictory state.
- Delivery works on the current surface, with inline fallback available.

Do not print this checklist or a score unless the user asks for an audit.
