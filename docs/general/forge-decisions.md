![decision-forge banner](../../banners/decision-forge-banner.png)

# forge-decisions — Decision Forge

*Resolve every branch.*

## Add it

```bash
npx skills add tejeshradhakrishna/skills --skill=forge-decisions
```

```bash
npx skills update forge-decisions
```

[Source](https://github.com/tejeshradhakrishna/skills/tree/main/skills/general/forge-decisions)

**Runs on** ChatGPT Chat · ChatGPT Work · Codex · Claude Chat · Claude Cowork · Claude Code. See
[COMPATIBILITY.md](../../COMPATIBILITY.md).

## The gist

I built `forge-decisions` for the moment a plan looks finished but still has soft spots. It runs a
disciplined interview — one question per turn, each with a recommended answer and the trade-off that decides
it — and works through the plan's decisions in dependency order, hardest and most irreversible first. When
it's done, the plan isn't just agreed; it's documented: a decision brief, a `CONTEXT.md` glossary where the
work has its own vocabulary, and ADRs for the choices that would puzzle someone later. It's a way to stop
building the wrong thing before a single line is written.

## Reach for it when

- A plan, design, or proposal is basically there but you can feel the unresolved questions underneath it.
- The same decisions keep resurfacing because they were talked about but never actually settled or recorded.
- You're about to hand a plan to someone else — or to a future you — and want the *why* to survive, not just
  the *what*.

Skip it when the plan is already settled, or when you just want the thing built. This resolves and
documents decisions; it doesn't implement them, and it won't start.

## How it behaves

The interview is strict on purpose: one precise question, one recommendation, the deciding trade-off, then
it waits for you. It digs facts out of the conversation, the files, and the code rather than asking you
things it can check itself, and it keeps verified facts, hard constraints, your decisions, assumptions, and
open unknowns clearly apart. It won't manufacture agreement, file writes, owners, dates, or test results,
and it redacts anything sensitive it runs across.

Three optional dials in your request steer it: **focus** (which plan), **depth** (`rapid`, `standard`, or
`exhaustive`), and **delivery** (`inline`, `file`, or `both`).

## Signs it worked

- Every decision that matters ends up either resolved or consciously deferred with a reason and a trigger to
  revisit it.
- You walk away with a decision brief — plus `CONTEXT.md` and ADRs where they're warranted — that all line
  up with each other.
- The questions earned their place: each one actually moved the plan, none were idle preferences.

## Pairs with

Run it at the start of a piece of work, before implementation. When the direction it forges needs to survive
a handoff, follow it with [relay-context](./relay-context.md): settle the decisions, then carry the verified
state forward to whoever picks the work up next.
