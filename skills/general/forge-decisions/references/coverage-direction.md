# Direction and Experience Coverage

Activate only the items capable of changing the objective, scope, workflow, ownership, or success test.

## Direction

- Problem, desired outcome, beneficiaries, and decision owner
- Measurable success, leading indicators, failure definition, and time horizon
- Scope, non-goals, imposed constraints, commitments, and opportunity cost
- Reversibility, stop conditions, and why this should exist instead of doing nothing
- Decision rights: who recommends, approves, executes, operates, and can block

## Experience and workflow

- Actors, roles, permissions, incentives, and accessibility needs
- Primary journey, alternate paths, handoffs, inputs, and outputs
- Approvals, escalation, cancellation, retry, reversal, and recovery
- Invalid input, partial completion, duplicate action, and delayed action
- Explainability, localization, support, and operational ownership

## Probes

Use the smallest concrete scenario that can falsify the current direction:

- Trace a normal trigger through a verified outcome.
- Give an actor incomplete, stale, or malicious input.
- Change permission, policy, or ownership mid-flow.
- Cancel or reverse after partial completion.
- Assume the plan failed; identify the earliest avoidable cause.
- Remove a key approver or owner.
- Ask which constraint would make the rejected direction win.

Stop downstream questioning when success cannot be measured, authority is duplicated or absent, a workflow assumes an unresolved actor or prerequisite, or a mitigation depends on an unowned action.
