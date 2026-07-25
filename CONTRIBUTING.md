# Contributing

Thanks for looking. This is a small, personal collection, so the bar for a change is simple: it has to keep
the skills honest, portable, and sharp.

## A few ground rules

- **The shipped skills are frozen source.** What's inside each folder under `skills/general/` —
  `SKILL.md`, `agents/openai.yaml`, `references/`, `assets/` — is authored work. Don't touch it in a
  scaffolding change. A change to how a skill *behaves* is its own separate, deliberate proposal.
- **Portability isn't optional.** Every skill has to run unmodified on ChatGPT, Codex, and Claude. No
  host-OS assumptions, no reliance on a temp directory, no output that breaks when there's no filesystem to
  write to. [COMPATIBILITY.md](./COMPATIBILITY.md) has the specifics.
- **Honesty is the whole point.** These skills don't invent work, tests, approvals, owners, dates, or
  results, and they redact secrets. Any edit has to keep that true.

## Adding or changing a skill

Layout and invocation rules live in [CLAUDE.md](./CLAUDE.md) and [.agents/invocation.md](./.agents/invocation.md).
A skill folder looks like:

```
skills/<folder>/<skill-name>/
├── SKILL.md            # frontmatter (name, description) + the workflow
├── agents/openai.yaml  # OpenAI/Codex interface metadata + invocation policy
├── references/         # protocols/templates the SKILL.md links to (optional)
└── assets/icon.svg     # display icon (optional but nice)
```

If the skill ships to users, keep its four descriptions in step — top-level [README](./README.md), its
folder README, the `skills` array in [.claude-plugin/plugin.json](./.claude-plugin/plugin.json), and a docs
page under `docs/<folder>/` written per [.agents/writing-docs.md](./.agents/writing-docs.md). Bump
`plugin.json` and `package.json` versions together.

## Before opening a PR

```bash
npm install                      # first time only
bash scripts/validate-skills.sh  # structure, metadata, promoted-set + version sync
bash scripts/list-skills.sh      # eyeball the inventory
bash scripts/package-skills.sh   # confirm the upload ZIPs still build
claude plugin validate . --strict   # if you have the Claude CLI
```

Record the change so it lands in the changelog and version bump:

```bash
npx changeset
```

## Filing an issue

Tell me the platform and surface you hit it on (ChatGPT / Codex / Claude), which skill, and the exact prompt
or steps to reproduce.

Contributions are accepted under the repository's [MIT License](./LICENSE).
