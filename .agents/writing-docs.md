# How I write a docs page

Every promoted skill gets one page under `docs/<folder>/<skill-name>.md`. This page is not the skill and not
a paraphrase of its `SKILL.md`. `SKILL.md` is written for the agent that runs the skill; the docs page is
written for a person deciding whether this skill is the right tool right now.

## The shape I use

In order:

1. **Banner** — the skill's image from `banners/`, as the first line (`![… banner](../../banners/<file>)`).
2. **Title** — `# <skill-name> — <Display Name>`.
3. **Tagline** — one italic line; reuse the skill's banner tagline.
4. **Add it** — a short fenced block with the real install command
   (`npx skills add tejeshradhakrishna/skills --skill=<name>`) and an update line.
5. **Source** — `[Source](https://github.com/tejeshradhakrishna/skills/tree/main/skills/<folder>/<name>)`
   (absolute, because the page may be read outside the repo).
6. **The gist** — a short paragraph: what the skill produces and why I'd bother.
7. **Reach for it when** — a few concrete situations, and a line on when *not* to.
8. **How it behaves** — the mechanics worth knowing before you run it, including any controls
   (focus / depth / delivery) and the honesty guarantees.
9. **Signs it worked** — observable outcomes that tell you it did its job.
10. **Pairs with** — how it relates to the other skills, linked with relative links inside `docs/`.

## Conventions I keep

- Absolute URLs for Source and any GitHub link; relative links between docs pages and to `banners/`.
- First person, matching the rest of the repo — these are skills I built and use.
- Promise only what the `SKILL.md` actually delivers (verified state, redaction, inline fallbacks). Don't
  oversell.

## Before I call it done

- The page exists at `docs/<folder>/<name>.md` and follows the shape above.
- The skill is also in the top-level README, its folder README, and `plugin.json` (see [CLAUDE.md](../CLAUDE.md)).
- `bash scripts/validate-skills.sh` passes.
