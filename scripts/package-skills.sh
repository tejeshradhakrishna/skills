#!/usr/bin/env bash
#
# Build one distributable ZIP per shipped skill, for platforms that install a skill
# from an uploaded package (ChatGPT Chat/Work, Claude Chat/Cowork) and for GitHub
# Releases. Requires `zip`.
#
# Output: dist/<skill-name>-v<version>.zip, each a self-contained portable skill
# (SKILL.md, agents/openai.yaml, references/, assets/), excluding OS junk.
#
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"

command -v zip >/dev/null 2>&1 || { echo "error: 'zip' is required but not installed." >&2; exit 1; }

version="$(grep -m1 -E '"version"[[:space:]]*:' .claude-plugin/plugin.json | sed -E 's/.*"version"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')"
[ -n "$version" ] || { echo "error: could not read version from plugin.json" >&2; exit 1; }

dist="$REPO/dist"
mkdir -p "$dist"

skill_paths="$(grep -oE '"\./skills/[^"]+"' .claude-plugin/plugin.json | tr -d '"' || true)"
[ -n "$skill_paths" ] || { echo "error: plugin.json declares no skills" >&2; exit 1; }

while IFS= read -r rel; do
  [ -z "$rel" ] && continue
  dir="${rel#./}"
  name="$(basename "$dir")"
  parent="$(dirname "$dir")"
  out="$dist/${name}-v${version}.zip"

  [ -d "$dir" ] || { echo "error: $dir does not exist" >&2; exit 1; }

  rm -f "$out"
  # Zip the skill folder (kept as a top-level dir inside the archive), excluding OS junk.
  ( cd "$parent" && zip -r -q -X "$out" "$name" -x '*.DS_Store' )
  echo "packaged $name -> dist/$(basename "$out")"
done <<< "$skill_paths"

echo
echo "Done. Upload a ZIP from dist/ via the target platform's custom-skill / custom-GPT interface."
