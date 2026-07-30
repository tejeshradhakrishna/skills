# Delivery and Updates

Recognize free text as the next-session focus, an explicitly identified path as the destination, and a request to update as an instruction to revise the prior relay. A path mentioned only as a project artifact is not a destination.

Choose delivery in this order:

1. Explicit destination.
2. A user-visible output location outside source control.
3. The OS temporary directory when the available writable location is a source tree.
4. The complete brief inline.

Use `relay-context-YYYYMMDD-HHMM.md` when naming a new file. Obtain timestamps from the environment; omit rather than guess. Never commit the relay unless explicitly requested.

When updating, preserve still-valid decisions, replace stale current state, remove duplication, and identify the prior brief as superseded without erasing it unless overwrite was requested. Current observable state outranks the old brief for implementation status; user intent remains authoritative.

Make cross-platform handoffs self-sufficient. The continuation prompt must carry the objective, first action, constraints, completed work to avoid repeating, and material unverified assumptions even if linked artifacts cannot be opened.
