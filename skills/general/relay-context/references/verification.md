# Verification

Use a bounded, non-mutating evidence pass. Inspect only what can materially change the handoff.

For implementation status, prefer current observable state, authoritative artifacts, recorded prior actions, then unsupported statements. Observed state can correct status claims; it cannot override the user's intent, approved requirements, or decisions.

Grade claims where ambiguity matters:

- **Verified** — directly observed or reproduced.
- **Stated** — asserted by the user or conversation.
- **Inferred** — strongly supported but not directly observed.
- **Assumed** — necessary working premise without evidence.
- **Unknown** — unavailable, conflicting, or unresolved.

Use split grades when one sentence contains differently supported claims. Record conflicts explicitly instead of silently choosing a side.

Safe checks may inspect files, status, history, diffs, logs, and existing results. Run a test or build only when it is clearly cheap, non-destructive, and cannot create meaningful side effects; otherwise report it as not rerun. Never mutate project state while producing the snapshot.

If verification cannot resolve a material claim, preserve both the claim and the conflict, mark the result `Unknown`, and give the next agent the smallest verification action.
