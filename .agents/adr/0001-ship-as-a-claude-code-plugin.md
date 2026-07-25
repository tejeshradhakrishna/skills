# 0001 — Ship as a Claude Code plugin, organised by theme

- Status: accepted
- Date: 2026

## Context

`forge-decisions` and `relay-context` are portable Agent Skills that already run on ChatGPT, Codex, and
Claude. I needed a distribution approach that gives Claude Code users a clean managed install, keeps working
for Codex and other Agent-Skills harnesses, still serves the chat surfaces that install from an uploaded
package, and organises the skills in a way that won't need reshuffling as the set grows.

## Decision

1. **Ship a native Claude Code plugin.** The repo is its own one-plugin marketplace
   (`.claude-plugin/marketplace.json` + `.claude-plugin/plugin.json`). The plugin's `skills` array is the
   authoritative list of what's shipped, and the two version numbers (`plugin.json`, `package.json`) move
   together on release so Claude can tell when an update is available.

2. **Organise skills by theme, starting with `general/`.** Rather than sorting by maturity, I sort by
   subject: `general/` holds general-purpose skills today, and domain folders (e.g. `coding/`) can join it
   later. Every promoted folder follows the same consistency rules, so adding one doesn't disturb this
   decision.

3. **Support ZIP upload for the chat surfaces.** `scripts/package-skills.sh` builds one standalone ZIP per
   skill for platforms that install from an uploaded package, and for GitHub Releases — which keeps the
   cross-platform claim real rather than aspirational.

## Consequences

- Adding, renaming, or removing a promoted skill means updating four places together (top-level README,
  folder README, `plugin.json`, docs page); `scripts/validate-skills.sh` guards the mechanical parts in CI.
- A native Codex plugin is deferred for now: the Codex plugin format takes a single skill path rather than a
  curated set, and skills.sh already installs these into Codex today. Worth revisiting if Codex gains
  multi-skill plugin support.
- On the chat surfaces the install is a manual ZIP upload rather than a one-command flow — that's just where
  those platforms are right now.
