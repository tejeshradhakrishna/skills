# Who can invoke a skill

Every skill in this repo answers one question up front: can the model start it, or only the human?

## Explicit-only

The human types the command; the model never launches it on its own. This is for the heavy, deliberate
workflows — the ones where firing automatically would be a mistake. Mark it in two places, and keep them
agreeing:

- `SKILL.md` frontmatter: `disable-model-invocation: true`
- `agents/openai.yaml`: `policy.allow_implicit_invocation: false`

The `description` can be a plain, human-readable summary — the model isn't choosing this skill, so it needs
no trigger language.

> **In this repo.** `forge-decisions` and `relay-context` are both explicit-only, enforced through
> `allow_implicit_invocation: false` in their `agents/openai.yaml`. Their `SKILL.md` frontmatter stays just
> `name` + `description`, and the `disable-model-invocation` line is left out on purpose: the same files are
> meant to install and behave identically on OpenAI and Anthropic platforms, and omitting the flag keeps
> that consistent. Settled decision — don't add it.

## Agent-reachable

The model may pick this skill when the task fits, and the human can still call it directly. Use it for
reusable discipline that other skills or the agent should be free to compose.

- Omit `disable-model-invocation` from `SKILL.md`.
- Omit `policy.allow_implicit_invocation: false` from `agents/openai.yaml`.
- Make the `description` specific enough that the model knows exactly when to reach for it.

## Composing them

An explicit-only skill is allowed to call agent-reachable skills, but it must not hand off to another
explicit-only skill. When one skill depends on another, name it in prose — "then run `/relay-context`" —
rather than pointing at files inside the other skill's folder.
