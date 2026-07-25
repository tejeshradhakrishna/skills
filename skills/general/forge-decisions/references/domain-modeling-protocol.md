# Domain Modeling Protocol

Activate this protocol when language, identity, ownership, lifecycle, invariants, or bounded contexts affect the plan. Treat domain modeling as an active discipline: challenge the model, test it with scenarios, reconcile it with evidence, and capture terms as they crystallize.

## Contents

- [Locate the domain context](#locate-the-domain-context)
- [Run the modeling loop](#run-the-modeling-loop)
- [Sharpen canonical language](#sharpen-canonical-language)
- [Model structure and behavior](#model-structure-and-behavior)
- [Probe with scenarios](#probe-with-scenarios)
- [Reconcile with code and artifacts](#reconcile-with-code-and-artifacts)
- [Write CONTEXT.md](#write-contextmd)
- [Handle multiple contexts](#handle-multiple-contexts)
- [Domain quality gate](#domain-quality-gate)

## Locate the domain context

Inspect before writing:

1. Read an existing root `CONTEXT.md` if present.
2. If `CONTEXT-MAP.md` exists, identify the relevant bounded context and read its `CONTEXT.md`.
3. Inspect related code, schemas, tests, workflows, events, APIs, and prior ADRs.
4. Record conflicts between declared language and implemented behavior.
5. Create files lazily only after the first term, boundary, or relationship is resolved.

Default to one root context. Introduce multiple bounded contexts only when distinct language, ownership, models, or change cadence make the separation real.

## Run the modeling loop

For every material concept:

1. Identify vague, overloaded, synonymous, or contested language.
2. Ask one decision question that resolves the concept.
3. Recommend one canonical term and explain why it is less ambiguous.
4. Define what the concept **is** in one or two sentences.
5. Identify avoided synonyms and nearby concepts it must not be confused with.
6. Establish identity, ownership, boundaries, invariants, lifecycle, and relationships when relevant.
7. Test the definition with concrete scenarios.
8. Compare it with code and authoritative artifacts.
9. Update the glossary immediately after confirmation.

Do not batch semantic decisions until the end; stale terminology contaminates downstream questions.

## Sharpen canonical language

Be opinionated:

- Choose one term for one concept.
- Separate concepts that have different identity, lifecycle, ownership, or rules.
- List rejected synonyms under `_Avoid_`.
- Define the concept, not its implementation or behavior checklist.
- Include only domain-specific language; exclude general programming terms.
- Use singular nouns for concepts and past-tense verbs for events when project conventions do not dictate otherwise.
- Name states as conditions, commands as intent, and events as facts that occurred.

Challenge conflicts immediately:

> The glossary defines “Customer” as the organization that purchases, but this workflow uses “customer” for an individual user. Are these one concept or two?

Do not preserve ambiguous language merely because it already exists in code.

## Model structure and behavior

Probe only the dimensions relevant to the concept:

- **Identity:** What makes two instances the same over time?
- **Value:** Is equality based entirely on attributes?
- **Ownership:** Which actor or context can create, change, or retire it?
- **Boundary:** What must change consistently with it?
- **Invariant:** What must always be true?
- **Lifecycle:** Which states, transitions, and terminal conditions exist?
- **Event:** What fact should other contexts observe?
- **Relationship:** What cardinality, optionality, direction, and temporal constraint applies?
- **Authority:** Which source resolves disagreement?
- **Policy:** Which rule chooses an outcome based on facts?
- **Permission:** Who may perform which transition, and when?

Keep implementation choices out of `CONTEXT.md`; capture them in the decision brief or a qualifying ADR.

## Probe with scenarios

Use named concepts in short, concrete stories:

- Normal creation, use, and completion
- Invalid or incomplete input
- Duplicate or concurrent action
- Partial cancellation or reversal
- Ownership or permission change mid-lifecycle
- Conflicting events or sources of truth
- Boundary crossing between contexts
- Retry after failure or delayed delivery
- Historical correction after downstream consumption
- Deletion, retention expiry, or legal hold

For each story, ask:

- Which concept owns the decision?
- Which invariant applies?
- What state changes?
- What event records the fact?
- Which other context may react without taking ownership?
- What would make the current language misleading?

A definition is not stable until it survives the scenarios that matter.

## Reconcile with code and artifacts

Compare user intent, glossary, code, schemas, tests, APIs, events, and ADRs.

Classify each mismatch:

- **Terminology drift:** Different words for the same concept
- **Model drift:** Same word, different structure or lifecycle
- **Behavior drift:** Code violates a confirmed invariant or transition
- **Boundary drift:** Responsibility lives in the wrong context
- **Documentation lag:** Behavior is correct but the glossary or ADR is stale

Surface the exact evidence and ask which source represents the intended model. Do not silently rewrite intent to match legacy code or claim code is wrong without evidence.

## Write CONTEXT.md

Use this compact format:

```markdown
# <Context Name>

<One or two sentences describing what the context is and why it exists.>

## Language

**<Canonical term>**:
<One or two sentences defining what it is.>
_Avoid_: <ambiguous, overloaded, or rejected synonyms>
```

Optional additions are allowed only when they prevent real ambiguity:

```markdown
_Not_: <nearby concept this must not be confused with>
_Example_: <one concrete domain example>
```

Group terms under subheadings only when natural clusters emerge. Keep the glossary concise, opinionated, and free of implementation details.

## Handle multiple contexts

When multiple bounded contexts genuinely exist, create a root `CONTEXT-MAP.md`:

```markdown
# Context Map

## Contexts

- [<Context>](<relative-path-to-CONTEXT.md>) — <responsibility>

## Relationships

- **<Context A> → <Context B>**: <published contract, event, or dependency>
```

For every relationship, resolve:

- Direction and ownership
- Published language or contract
- Synchronization or consistency expectation
- Translation or anti-corruption responsibility
- Failure and versioning behavior

Place context-specific ADRs near that context when project conventions support it. Keep system-wide ADRs at the repository-level ADR location.

## Domain quality gate

Before declaring the model stable, verify:

- Each material concept has one canonical term.
- Avoided synonyms expose real ambiguity rather than stylistic preference.
- Definitions say what concepts are and remain implementation-free.
- Identity, ownership, boundaries, and sources of truth are unambiguous.
- Invariants and lifecycle rules survive relevant scenarios.
- Context relationships name direction, contract, and responsibility.
- Code and artifacts either agree or have an explicit drift decision.
- The decision brief and ADRs use the same canonical language.

Do not print this checklist unless the user asks for a domain-model audit.
