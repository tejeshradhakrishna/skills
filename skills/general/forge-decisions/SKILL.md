---
name: forge-decisions
description: Run a rigorous one-question-at-a-time interview that resolves a plan's decision graph and produces verified design documents. Use only for an explicit plan stress-test or decision-forging request.
---

# Decision Forge

Turn an uncertain plan, design, or proposal into a decision-complete and documented direction. Be relentless about unresolved dependencies, but economical with the user's attention.

Before the first question, read:

- [references/interview-protocol.md](references/interview-protocol.md)
- [references/coverage-map.md](references/coverage-map.md)
- [references/artifact-templates.md](references/artifact-templates.md)

## Preserve these guarantees

- Run only after an explicit user request.
- Ask exactly one decision question per turn and wait for the answer.
- Give a specific recommended answer with every question.
- Look up observable facts in available conversations, files, code, tools, and artifacts instead of asking the user.
- Keep verified facts, imposed constraints, user decisions, assumptions, and unknowns distinct.
- Do not implement the plan while forging its decisions.
- Never fabricate evidence, agreement, file writes, owners, dates, or test results.
- Redact credentials, secrets, and irrelevant sensitive information.

## Interpret the request

Extract these optional controls:

1. **Focus**: the plan, design, proposal, or decision to forge.
2. **Depth**: `rapid`, `standard`, or `exhaustive`.
3. **Delivery**: `inline`, `file`, or `both`.

Default to `standard` depth. Infer the focus from the active conversation or artifacts when it is clear. Ask one scoping question only when the target itself is ambiguous.

## Establish evidence before interviewing

Inspect accessible context first:

- Existing plans, specifications, decision records, glossaries, tickets, and notes
- Relevant code, configuration, schemas, tests, and current workspace state
- Explicit constraints, prior decisions, failed approaches, and acceptance criteria

Build a private evidence ledger. Mark each item as verified, user-stated, inferred, or unknown. Surface contradictions that affect decisions; do not burden the user with irrelevant discoveries.

## Build and traverse the decision graph

Create a private graph of material decisions:

- Model dependencies between decisions.
- Prioritize prerequisites before downstream choices.
- Prefer high-impact, hard-to-reverse, high-risk, or highly uncertain nodes.
- Activate only relevant branches from the coverage map.
- Track each node as `unexamined`, `active`, `resolved`, `deferred`, or `contradicted`.

Do not present the entire graph unless the user asks. Use it to ensure coverage and prevent circular questioning.

For every active node, follow the one-question contract in `interview-protocol.md`:

1. Ask one precise question.
2. Recommend one answer.
3. Explain the decisive trade-off briefly.
4. Wait for the user's answer.
5. Resolve ambiguity or contradiction before moving downstream.
6. Record the confirmed decision, rationale, consequence, and dependencies.
7. Add newly discovered branches to the graph.

Do not ask low-value preference questions that do not change the plan.

## Sharpen the domain model

As terms and relationships emerge:

- Challenge vague, overloaded, or conflicting language immediately.
- Establish canonical terms, concise definitions, and avoided synonyms.
- Probe boundaries, ownership, invariants, states, transitions, events, identities, and relationships when relevant.
- Test the model with concrete happy-path, edge-case, and failure scenarios.
- Compare user statements with accessible code and artifacts; surface disagreements.
- Keep the glossary free of implementation details.

## Maintain durable artifacts

Update documentation after each confirmed decision rather than batching everything at the end:

- Maintain a decision brief using `artifact-templates.md`.
- Maintain `CONTEXT.md` and `CONTEXT-MAP.md` only when the work has domain-specific language or multiple bounded contexts.
- Create an ADR only when the decision is hard to reverse, surprising without context, and based on a real trade-off.
- Preserve existing conventions and unrelated content.
- Reference authoritative artifacts instead of duplicating them.

When a writable project filesystem is unavailable, create user-visible Markdown artifacts when supported. Otherwise render proposed files inline under headings containing their intended filenames. Never depend on an operating-system temporary directory, and never claim a draft was written.

If artifact delivery fails, retain the complete content inline and state the failed delivery step in one sentence.

## Drive to convergence

Continue until:

- Every material decision node is resolved or explicitly deferred with a reason and revisit condition.
- No unresolved contradiction blocks downstream work.
- Goals, non-goals, constraints, actors, and success criteria are clear.
- Relevant domain terms and boundaries are stable.
- Major risks, failure modes, rollout concerns, and validation expectations have owners or dispositions.
- The decision brief, glossary, and ADRs agree with one another.

Then ask the user to confirm that shared understanding has been reached. If the user identifies a gap, add it to the decision graph and continue.

## Finish

After confirmation:

1. Summarize the resolved direction and decisive trade-offs.
2. List confirmed, deferred, and rejected decisions.
3. Link or render the artifacts created or updated.
4. State the first safe next action.
5. Identify any assumption that still limits confidence.

Do not start implementation unless the user separately requests it.
