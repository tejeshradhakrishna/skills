# Domain Modeling Protocol

Activate when language, identity, ownership, lifecycle, invariants, or bounded contexts affect a decision. Challenge the model, test it with scenarios, reconcile it with evidence, and capture terms as they become authoritative.

## Locate the context

Read an existing `CONTEXT-MAP.md` and only the relevant `CONTEXT.md`; otherwise use one root context. Inspect related code, schemas, tests, workflows, events, APIs, and ADRs selectively. Record terminology, model, behavior, boundary, or documentation drift. Create files only after a term, boundary, or relationship is resolved.

Introduce multiple bounded contexts only when language, ownership, model, or change cadence truly differs.

## Model one concept at a time

1. Identify vague, overloaded, synonymous, or contested language.
2. Ask one decision question and recommend one canonical term.
3. Define what the concept **is** in one or two sentences.
4. Name avoided synonyms and nearby concepts it is not.
5. Probe only relevant dimensions:
   - identity or value equality
   - owner and source of truth
   - consistency boundary and invariant
   - lifecycle, states, transitions, and terminal conditions
   - commands, events, policies, permissions, and relationships
   - cardinality, direction, optionality, and temporal constraints
6. Test the definition with concrete scenarios.
7. Compare it with authoritative artifacts and implemented behavior.
8. Update canonical language immediately after confirmation.

Choose one term per concept and separate concepts with different identity, ownership, lifecycle, or rules. Prefer singular nouns for concepts, intent-bearing verbs for commands, and past-tense facts for events when conventions do not control. Do not preserve ambiguity merely because it exists in code.

Keep implementation choices out of `CONTEXT.md`; record them in the decision plan or a qualifying ADR.

## Test with scenarios

Use named concepts in the smallest story that exposes ambiguity:

- normal creation through completion
- invalid, duplicate, concurrent, or delayed action
- partial cancellation, retry, reversal, or correction
- permission or ownership change mid-lifecycle
- conflicting events or sources of truth
- boundary crossing and downstream reaction
- deletion, retention expiry, or legal hold

Ask which concept owns the decision, which invariant applies, what changes state, what event records the fact, and whether another context may react without taking ownership. A definition is stable only after surviving the scenarios that matter.

When evidence disagrees, show the exact mismatch and ask which source represents the intended model. Never silently rewrite intent to match legacy code or claim implementation drift without evidence.

## Write compact domain artifacts

Use:

```markdown
# <Context Name>

<Purpose in one or two sentences.>

## Language

**<Canonical term>**:
<What it is in one or two sentences.>
_Avoid_: <rejected synonyms>
_Not_: <nearby concept, only if needed>
```

Group terms only when it aids navigation. Exclude generic programming language and implementation details.

For real multiple contexts, maintain:

```markdown
# Context Map

## Contexts
- [<Context>](<path>) — <responsibility>

## Relationships
- **<A> → <B>**: <published contract, event, or dependency>
```

Resolve relationship direction, ownership, published language, consistency expectation, translation responsibility, failure behavior, and versioning. Place local ADRs near a context only when project conventions support it.

## Gate

Before declaring stability, verify that canonical terms, identity, ownership, boundaries, invariants, lifecycle, sources of truth, and context relationships are unambiguous; relevant scenarios pass; code and artifacts agree or record an explicit drift decision; and every plan or ADR uses the same language. Do not print the gate unless requested.
