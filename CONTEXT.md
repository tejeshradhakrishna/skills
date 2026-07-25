# Context

The words this repo uses, defined once so the README, docs, manifests, and skills all mean the same thing by
them. (Fittingly, this is the kind of shared-language file `forge-decisions` produces.)

## Terms

**Skill** — a self-contained agent workflow: one folder, named for its command, holding a `SKILL.md`, an
`agents/openai.yaml`, and any `references/` and `assets/`. The folder *is* the skill; the command is only how
you invoke it. Not the same as a "plugin" (which bundles skills).

**Folder** — a thematic grouping directly under `skills/`. There's one today, `general/`; domain folders like
`coding/` may follow. (Called a "bucket" in some skill ecosystems; here it's just a folder.)

**Promoted** — describes a skill that ships to users. A promoted skill shows up in the top-level README, its
folder README, the plugin manifest, and `docs/`. A non-promoted skill shows up in none of them. Distinct from
"released", which refers to a versioned publish.

**Explicit-only** — a skill the human must invoke by name; it never fires on its own. Set by
`policy.allow_implicit_invocation: false`. Both current skills are explicit-only.

**Agent-reachable** — a skill the model may also choose for itself when the task fits. None ship yet.

**Portable** — runs unchanged on ChatGPT, Codex, and Claude, because it satisfies both vendors' metadata and
assumes nothing platform-specific (see `COMPATIBILITY.md`). Stronger than "cross-platform-ish"; weaker than
"universal", which would overclaim.

**Decision brief** — the artifact `forge-decisions` writes: confirmed, deferred, and rejected decisions with
their rationale. It records *why*, which is what separates it from a spec (which describes *what to build*).

**Continuity brief** — the artifact `relay-context` writes: the verified state of a piece of work, ready for
another agent to resume. It's verified state, not a recap — so it isn't a transcript or a summary.

## How they connect

- A **folder** groups **skills**; a **promoted** skill lives in a promoted folder.
- Each **skill** is either **explicit-only** or **agent-reachable** — never both, never neither.
- A **skill** is **portable** when it meets the guarantees in `COMPATIBILITY.md`.
- The **plugin** (`tejesh-skills`) ships precisely the set of **promoted** skills.

## Known fuzzy edges

- "Skill" gets used loosely across the ecosystem for both the folder and its command. Here, the folder is the
  skill.
- "Install" covers three different mechanisms (Claude plugin, skills.sh copy, ZIP upload). When it matters,
  name the mechanism — `COMPATIBILITY.md` spells them out.
