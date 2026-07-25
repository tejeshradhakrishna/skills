# Out of scope: a custom installer CLI

## What I'm not building

A bespoke command-line installer for these skills — my own `npx <tool> install …`.

## Why

Installation is already covered by three existing mechanisms, and none of them warrant a hand-rolled CLI:

- **Claude Code** — the native plugin marketplace (`.claude-plugin/`) handles install and updates.
- **Codex and other Agent-Skills harnesses** — the third-party [skills.sh](https://skills.sh) installer
  (`npx skills add tejeshradhakrishna/skills`) already copies skills into a project.
- **ChatGPT and Claude chat surfaces** — install from an uploaded ZIP, which `scripts/package-skills.sh`
  produces.

Building and maintaining our own installer would duplicate skills.sh, add a release surface to keep secure
and current, and give users one more tool to trust — for no capability they don't already have.

## Revisit if

- skills.sh stops supporting a platform we care about, or
- a target platform adds a programmatic install API that no existing tool covers.
