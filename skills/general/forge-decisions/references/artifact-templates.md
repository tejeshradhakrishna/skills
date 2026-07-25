# Artifact Templates

Create artifacts lazily and preserve existing project conventions when they differ.

## Contents

- [Decision brief](#decision-brief)
- [Glossary](#glossary)
- [Context map](#context-map)
- [ADR](#adr)
- [Artifact quality gate](#artifact-quality-gate)

## Decision brief

Default filename: `DECISION-BRIEF.md`, or a user-specified/user-visible artifact name.

```markdown
# <Plan or design>

## Outcome
<Goal and measurable success>

## Scope
<In scope, non-goals, constraints>

## Confirmed decisions
| Decision | Selection | Rationale | Consequence |
| --- | --- | --- | --- |

## Rejected alternatives
| Alternative | Why rejected | Revisit condition |
| --- | --- | --- |

## Deferred decisions
| Decision | Reason | Owner | Revisit condition |
| --- | --- | --- | --- |

## Domain model
<Boundaries, ownership, invariants, states, events, and key relationships>

## Key scenarios
<Happy path, edge cases, and failure behavior>

## Risks and validation
| Risk or assumption | Impact | Mitigation or evidence |
| --- | --- | --- |

## Next action
<First safe action after shared understanding>
```

## Glossary

Default filename: `CONTEXT.md`.

```markdown
# <Context name>

<One or two sentences describing the context and why it exists.>

## Language

**<Canonical term>**:
<One- or two-sentence definition of what it is>
_Avoid_: <ambiguous or rejected synonyms>
```

Include only domain-specific concepts. Keep implementation details in the decision brief or ADRs.

## Context map

Create `CONTEXT-MAP.md` only when multiple bounded contexts exist.

```markdown
# Context Map

## Contexts
- [<Context>](<relative-path-to-CONTEXT.md>) — <responsibility>

## Relationships
- **<Context A> → <Context B>**: <contract, event, or dependency>
```

## ADR

Store technical ADRs in `docs/adr/` with the next sequential `NNNN-slug.md` filename.

```markdown
# <Short decision title>

<One to three sentences covering the context, selected decision, and why.>
```

Add Status, Considered Options, or Consequences only when they add durable value.

Create an ADR only when all three are true:

1. The decision is hard to reverse.
2. The choice would be surprising without context.
3. The result reflects a genuine trade-off.

## Artifact quality gate

Before delivery, verify:

- Confirmed, rejected, and deferred decisions cannot be confused.
- Every material decision has rationale or is marked unknown.
- The glossary, decision brief, and ADRs use the same canonical language.
- Paths, owners, dates, evidence, and statuses are exact.
- No artifact claims an unperformed write, test, approval, or implementation.
- No credential or unnecessary sensitive information is present.
