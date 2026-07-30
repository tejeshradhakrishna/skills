# Compatibility

Both skills in this repository — `forge-decisions` and `relay-context` — are built to the portable
[Agent Skills](https://github.com/anthropics/skills) structure and have been built, packaged, and validated
for cross-platform use. This document is the canonical record of where they run and what guarantees make
that possible.

## Platform matrix

| Platform | Status | Install path |
|---|:---:|---|
| ChatGPT Chat | ✅ Confirmed | Upload the per-skill ZIP (custom GPT / skill upload) |
| ChatGPT Work | ✅ Confirmed | Upload the per-skill ZIP (custom GPT / skill upload) |
| Codex | ✅ Confirmed | `npx skills add tejeshradhakrishna/skills` |
| Claude Chat | ✅ Confirmed | Upload the per-skill ZIP |
| Claude Cowork | ✅ Confirmed | Upload the per-skill ZIP |
| Claude Code | ✅ Confirmed¹ | Plugin marketplace, or `npx skills add …` |

¹ Claude Code support is subject to Anthropic's current Skills/beta availability and the user having Skills
enabled.

Both extracted ZIP packages passed all compatibility checks.

## Why they're portable

- **Dual metadata.** Each skill satisfies both vendors' requirements at once: Anthropic reads the
  `SKILL.md` YAML frontmatter (`name`, `description`); OpenAI reads `agents/openai.yaml`
  (`interface.display_name`, `interface.short_description`, `interface.default_prompt`, and the
  `policy.allow_implicit_invocation` flag). Neither is derived from the other, so no platform is a
  second-class citizen.
- **No platform-specific workflow dependencies.** The instructions never assume a particular product's
  tools, a specific operating system, or an OS temporary directory. Behaviour is described in terms of
  capabilities ("a writable project filesystem", "a user-visible artifact surface"), not brand names.
- **Inline + file-based fallbacks.** When a writable filesystem or artifact surface is available, the
  skills produce durable files; when it isn't (e.g. a chat-only surface), they return the complete result
  inline instead. They never claim a draft was written when it wasn't.
- **Evidence integrity, everywhere.** Both skills refuse to fabricate work, tests, approvals, owners,
  dates, or results, and both redact secrets and credentials — the same discipline regardless of host.
- **Vendor-neutral output.** Deliverables are portable Markdown that stays usable even if optional links or
  integrations are unavailable on the target platform.

## Packaging for upload-based platforms

ChatGPT (Chat & Work) and Claude (Chat & Cowork) install a skill from an uploaded ZIP. Ready-made packages
live in the repo — [`skills/general/forge-decisions.zip`](./skills/general/forge-decisions.zip) and
[`skills/general/relay-context.zip`](./skills/general/relay-context.zip) — so most users can download one and
upload it directly, no build step required.

To produce a versioned build from source instead:

```bash
npm install        # first time only, to fetch dev tooling
npm run package    # or: bash scripts/package-skills.sh
```

This writes one self-contained archive per skill to `dist/`:

```
dist/forge-decisions-v0.2.0.zip
dist/relay-context-v0.2.0.zip
```

Each archive contains the complete portable skill folder — `SKILL.md`, `agents/openai.yaml`, everything
under `references/`, and `assets/icon.svg` — and nothing else. Upload the archive through the platform's
custom-skill / custom-GPT interface.

## Verifying compatibility yourself

```bash
bash scripts/validate-skills.sh   # structural + metadata checks for every shipped skill
bash scripts/package-skills.sh    # produce the upload ZIPs, then unzip one to inspect it
```
