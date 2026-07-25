Notes for whoever maintains this repo (me, or an agent working on it). `AGENTS.md` points here too, so
Claude and Codex both land on these rules.

## How the repo is arranged

Skills sit in **thematic** folders under `skills/`. Right now there's one, `general/`, for skills that
aren't tied to a particular domain. As the collection grows I expect domain folders to join it (something
like `coding/`). Any folder whose skills ship to users is a **promoted** folder.

A single skill is one directory, named after the command that invokes it (kebab-case). At minimum it holds a
`SKILL.md` and an `agents/openai.yaml`; the ones here also carry a `references/` folder and an
`assets/icon.svg`.

## Keeping a promoted skill consistent

When a skill lives in a promoted folder, four things describe it, and they have to agree:

1. an entry in the top-level [README.md](./README.md), its name linked to the `SKILL.md`;
2. an entry in that folder's own README (e.g. [skills/general/README.md](./skills/general/README.md));
3. a path in the `skills` array of [.claude-plugin/plugin.json](./.claude-plugin/plugin.json) — that array
   is exactly what the Claude Code plugin ships;
4. a page at `docs/<folder>/<skill-name>.md`, written the way [.agents/writing-docs.md](./.agents/writing-docs.md)
   lays out.

Whenever a skill is added, renamed, removed, or changes behaviour, update all four. `scripts/validate-skills.sh`
checks the mechanical parts (README link, manifest entry, frontmatter, version sync) and runs in CI, but it
can't check that the docs page still reads correctly — that part is on you. If a non-promoted folder ever
exists (say `in-progress/` or `deprecated/`), its skills stay out of all four places above.

## Who can invoke a skill

Every `SKILL.md` is one of two kinds:

- **Explicit-only** — the human types the command; the model never fires it by itself. This needs
  `disable-model-invocation: true` in the `SKILL.md` frontmatter *and* `policy.allow_implicit_invocation: false`
  in `agents/openai.yaml`.
- **Agent-reachable** — the model may also choose it when the task fits. Leave both of those out and write a
  description rich enough for the model to recognise the moment.

The full contract is in [.agents/invocation.md](./.agents/invocation.md). Both shipped skills are
explicit-only via their `agents/openai.yaml`. Their `SKILL.md` frontmatter is deliberately just `name` +
`description` — the `disable-model-invocation` line is **intentionally omitted** so the files install and
behave identically on OpenAI and Anthropic platforms. That's settled; don't add it, and treat the skill
folders as frozen source.

## Shipping and versions

This repo doubles as its own one-plugin marketplace for Claude Code —
[.claude-plugin/marketplace.json](./.claude-plugin/marketplace.json) advertises the lone `tejesh-skills`
plugin. Two version numbers matter: the one in `plugin.json` and the one in `package.json`. Bump them
together, because Claude reads the plugin's version to know when to offer an update. After editing either
manifest, run `claude plugin validate . --strict`.

Releases run on changesets — record a change with `npx changeset`, and
[.github/workflows/release.yml](./.github/workflows/release.yml) opens the version PR and tags on merge.
Nothing gets compiled; there's no build.

The same skills also run on ChatGPT, Codex, and the Claude chat surfaces — see
[COMPATIBILITY.md](./COMPATIBILITY.md). `scripts/package-skills.sh` builds the ZIPs those surfaces install
from.

## Working locally

`scripts/link-skills.sh` symlinks the skills into `~/.claude/skills` and `~/.agents/skills` so they're live
while you edit. Because the links point at this checkout, pulling new commits updates them in place; run the
script again after adding, removing, or renaming a skill.

## What is and isn't editable

The directories under `skills/general/` (the `SKILL.md`, `agents/openai.yaml`, `references/`, and `assets/`
of each skill) are authored source and shouldn't change without the author's say-so. Everything wrapped
around them — this file, the READMEs, docs, manifests, scripts, banners — is fair game.
