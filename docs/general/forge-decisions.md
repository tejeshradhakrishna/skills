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

I built `forge-decisions` for the moment a plan looks finished but still has soft spots. First it asks how
deep to go — a **Quick** pass over the critical calls, a **Standard** sweep to execution-ready, or a
**Comprehensive** teardown — so the interview only spends effort where the stakes warrant it. Then it runs a
disciplined interview — one question per turn, each with a recommended answer and the trade-off that decides
it — and works through the plan's decisions in dependency order, hardest and most irreversible first. Run it
on a whole plan, or point it at a single track: just resolve the open decisions, sharpen a domain's language,
or settle one architectural choice. When it's done, the plan isn't just agreed; it's documented: a decision
brief, a `CONTEXT.md` glossary where the work has its own vocabulary, and ADRs for the choices that would
puzzle someone later. It's a way to stop building the wrong thing before a single line is written.

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
and it redacts anything sensitive it runs across. When the work has its own vocabulary, it sharpens that
language into a glossary; and it writes an ADR only for a choice that's genuinely hard to reverse, not for
routine ones.

Up front it offers a **mode** — **Quick** (just the high-level direction and the critical blockers needed
for a workable plan), **Standard** (that plus the low-level decisions that make the plan execution-ready), or
**Comprehensive** (the full treatment: scenarios, risks, edge cases, operations, and documentation). The mode
governs what's *relevant*, never a question quota — so Quick saves tokens by pruning the branches that can't
change a workable plan, while every mode keeps going until its own bar is met, and you can switch modes
mid-interview without losing settled decisions. Three more optional controls in your request steer the rest:
**focus** (which plan), **track** (`full`, `interview`, `domain`, `adr`, or `audit`), and **delivery**
(`inline`, `file`, or `both`).

## Signs it worked

- Every decision that matters ends up either resolved or consciously deferred with a reason and a trigger to
  revisit it.
- You walk away with a decision brief — plus `CONTEXT.md` and ADRs where they're warranted — that all line
  up with each other. The artifacts scale to the work: a split-out register, a `CONTEXT-MAP.md`, or a
  resumable `FORGE-STATE.md` appear only when the effort actually calls for them.
- The questions earned their place: each one actually moved the plan, none were idle preferences.

## Pairs with

Run it at the start of a piece of work, before implementation. When the direction it forges needs to survive
a handoff, follow it with [relay-context](./relay-context.md): settle the decisions, then carry the verified
state forward to whoever picks the work up next.
