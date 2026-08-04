# tejesh-skills

## 0.3.0

### Minor Changes

- [`1c64223`](https://github.com/tejeshradhakrishna/skills/commit/1c64223a39af3436ccc8aaa1e0ab743226ec8ff3) Thanks [@tejeshradhakrishna](https://github.com/tejeshradhakrishna)! - **forge-decisions** — add a user-selected interview mode (Quick, Standard, Comprehensive) chosen up front.
  Modes tune relevance and coverage rather than a question count: Quick prunes nonessential branches to cut
  token use while still resolving critical and irreversible decisions, Standard reaches an execution-ready
  plan, and Comprehensive activates the full decision graph. Modes can be switched mid-interview without
  losing settled decisions. Docs and READMEs updated to match.

- [`66791f6`](https://github.com/tejeshradhakrishna/skills/commit/66791f65b2c61e9fc8b5fe54ef4328aba72e4363) Thanks [@tejeshradhakrishna](https://github.com/tejeshradhakrishna)! - **relay-context** — reduce token consumption. The brief now sizes itself to the work automatically,
  retaining only the state that affects safe continuation, and the separate relay template reference was
  folded into the skill. The manual `depth` control (`compact` / `standard` / `deep`) is removed — `focus`
  and `delivery` remain. Docs updated to match.

## 0.1.0

### Minor Changes

- First release. Two explicit-invocation agent skills I built and use:

  - **forge-decisions** (_Resolve every branch_) — a one-question-at-a-time interview that settles a plan's
    open decisions and writes them up as a decision brief, `CONTEXT.md`, and ADRs.
  - **relay-context** (_Carry the work forward_) — a verified, privacy-safe continuity brief for resuming
    work in another session, agent, or platform.

  Both run on ChatGPT (Chat & Work), Codex, and Claude (Chat, Cowork & Code), and install as a Claude Code
  plugin, through the skills.sh installer, or as an uploaded ZIP.
