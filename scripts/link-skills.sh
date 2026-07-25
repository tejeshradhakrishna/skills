#!/usr/bin/env bash
#
# For working on the skills locally. Points ~/.claude/skills and ~/.agents/skills
# at the skills in this checkout via symlinks, so edits show up immediately and a
# fresh pull carries straight through. Run it again whenever you add, rename, or
# remove a skill.
#
# This is a maintainer convenience, not an install path — end users should follow
# the README (Claude plugin, skills.sh, or ZIP upload).
#
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"

DESTS=("$HOME/.claude/skills" "$HOME/.agents/skills")

# Every skill folder is the directory containing a SKILL.md. Skip deprecated/ and
# in-progress/ buckets if they ever exist; only link shippable skills.
while IFS= read -r skill_md; do
  src_dir="$(cd "$(dirname "$skill_md")" && pwd)"
  skill_name="$(basename "$src_dir")"

  for dest_root in "${DESTS[@]}"; do
    # Guard: refuse to operate if the destination root is itself a symlink into
    # this repo (avoids creating self-referential loops).
    if [ -L "$dest_root" ]; then
      resolved="$(readlink "$dest_root")"
      case "$resolved" in
        "$REPO"*) echo "error: $dest_root is a symlink into this repo; aborting." >&2; exit 1 ;;
      esac
    fi

    mkdir -p "$dest_root"
    target="$dest_root/$skill_name"

    # Remove a real directory collision (but never a live symlink we're refreshing).
    if [ -d "$target" ] && [ ! -L "$target" ]; then
      rm -rf "$target"
    fi

    ln -sfn "$src_dir" "$target"
    echo "linked $skill_name -> $target"
  done
done < <(find skills \
  -path '*/deprecated/*' -prune -o \
  -path '*/in-progress/*' -prune -o \
  -name SKILL.md -print)
