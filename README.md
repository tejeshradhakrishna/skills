# Agent skills by Tejesh Radhakrishna

Two agent skills I built and use myself. They share one conviction: an agent's output is only as good as
the discipline around it — so both hold a hard line on **verified truth** and both **travel unchanged**
across ChatGPT, Codex, and Claude. Rigor you can trust, portability that follows you between tools.

I'm Tejesh Radhakrishna, an Senior AI engineer. I got tired of two recurring failures — agents that confidently
lock in the wrong plan, and hard-won context that evaporates the moment a session ends or I switch tools.
These two skills are my answers. Neither guesses, neither fabricates, and neither is tied to a single
vendor.

## Runs everywhere

| ChatGPT Chat | ChatGPT Work | Codex | Claude Chat | Claude Cowork | Claude Code¹ |
|:---:|:---:|:---:|:---:|:---:|:---:|
| ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

Each skill ships the metadata both ecosystems expect — Anthropic reads `SKILL.md`, OpenAI reads
`agents/openai.yaml` — assumes nothing about the host OS or toolset, and falls back to inline output when a
filesystem isn't there. Full details in [COMPATIBILITY.md](./COMPATIBILITY.md).

¹ On Claude Code, availability tracks Anthropic's current Skills rollout.

## The skills

Both are **explicit-invocation only**: they run when I ask for them by name, never on their own. That's on
purpose — each one is a deliberate, high-stakes move, not something an agent should trigger in the
background.

### decision-forge — *Resolve every branch*

![decision-forge banner](./banners/decision-forge-banner.png)

I reach for **[forge-decisions](./skills/general/forge-decisions/SKILL.md)** when a plan still has soft
spots. It interviews me one sharp question at a time — each with a recommended answer and the trade-off that
settles it — until every material choice in the plan is resolved. What I'm left with isn't a chat log; it's
a decision brief, a shared-language `CONTEXT.md` where the work needs one, and ADRs for the choices that are
genuinely hard to reverse. It never starts building; it makes the plan buildable.

### relay-context — *Carry the work forward*

![relay-context banner](./banners/relay-context-banner.png)

I reach for **[relay-context](./skills/general/relay-context/SKILL.md)** at a boundary — a handoff, a
context reset, or a jump from one platform to another. It distills the *verified* state of the work into a
compact, vendor-neutral brief: the objective, what's actually done versus what only looks done, the
decisions and why, the ranked next steps, the blockers, and a continuation prompt the next agent can paste
straight in. Secrets are stripped; nothing gets claimed as finished unless the evidence says so.

## What they share

The two skills solve different problems, but they're cut from the same cloth. Everything I ship here obeys
these rules:

- **Evidence over assertion.** Neither skill invents work, tests, approvals, owners, dates, or results. If
  it can't be verified, it's labelled an assumption or an unknown — never stated as fact.
- **Privacy by default.** Credentials, tokens, and sensitive data are redacted, replaced with plain markers
  rather than preserved in any form.
- **You invoke, they run.** Explicit-only invocation keeps heavyweight workflows out of the agent's
  autopilot.
- **Portable by construction.** Vendor-neutral Markdown, no host-specific assumptions, inline fallbacks — so
  the same skill behaves the same everywhere.

## Install

Same source everywhere: [`tejeshradhakrishna/skills`](https://github.com/tejeshradhakrishna/skills). Pick
the route for your platform.

**Claude Code** — install the managed plugin and let it update itself:

```
/plugin marketplace add tejeshradhakrishna/skills
/plugin install tejesh-skills@tejeshradhakrishna
```

or from a terminal:

```bash
claude plugin marketplace add tejeshradhakrishna/skills
claude plugin install tejesh-skills@tejeshradhakrishna
```

**Codex and other Agent-Skills harnesses** — pull the files into your project with the
[skills.sh](https://skills.sh) installer:

```bash
npx skills@latest add tejeshradhakrishna/skills
```

Grab or refresh a single skill:

```bash
npx skills add tejeshradhakrishna/skills --skill=forge-decisions
npx skills update relay-context
```

**ChatGPT (Chat & Work) and Claude (Chat & Cowork)** — these take an uploaded package. Download a skill's
ZIP from [Releases](https://github.com/tejeshradhakrishna/skills/releases), or build them yourself:

```bash
npm install
npm run package   # writes dist/forge-decisions-v0.1.0.zip and dist/relay-context-v0.1.0.zip
```

Then add the ZIP through the platform's custom-skill / custom-GPT screen. Each archive is one complete,
standalone skill.

## Using them

Once installed, call a skill by name in whichever agent you're in:

```
/forge-decisions   # pressure-test my plan, one decision at a time, and document the result
/relay-context     # snapshot the verified state so the next session can continue
```

They stay quiet until asked, and they say so plainly whenever something can't be verified.

## Inside the repo

```
skills/general/         the skills themselves (forge-decisions, relay-context)
docs/general/           a "when would I use this" page per skill
banners/                the hero art for each skill
.claude-plugin/         plugin + marketplace manifests for Claude Code
scripts/                tooling: list, link, validate, package
.agents/                my authoring notes + decision records
```

Maintainer conventions are in [CLAUDE.md](./CLAUDE.md); how to propose a change is in
[CONTRIBUTING.md](./CONTRIBUTING.md).

## License

[MIT](./LICENSE) © 2026 Tejesh Radhakrishna.
