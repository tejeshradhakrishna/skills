#!/usr/bin/env bash
#
# Validate the shipped skill set. No external dependencies (pure bash + coreutils),
# so it runs anywhere, including CI on a plain runner.
#
# Checks:
#   1. package.json and .claude-plugin/plugin.json declare the same version.
#   2. Every path in plugin.json's "skills" array:
#        - exists as a directory
#        - contains SKILL.md with `name:` and `description:` frontmatter
#        - has a `name:` that matches the folder name
#        - contains agents/openai.yaml
#        - is linked from the top-level README.md
#
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"

fail=0
err() { echo "  ✗ $1" >&2; fail=1; }
ok()  { echo "  ✓ $1"; }

extract_version() {
  # $1 = json file. Prints the top-level "version" value.
  grep -m1 -E '"version"[[:space:]]*:' "$1" | sed -E 's/.*"version"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/'
}

frontmatter_field() {
  # $1 = SKILL.md path, $2 = field name. Prints the value from the YAML frontmatter.
  awk -v field="$2" '
    NR==1 && $0!="---" { exit }
    NR==1 { infm=1; next }
    infm && $0=="---" { exit }
    infm {
      if ($0 ~ "^" field ":") {
        sub("^" field ":[[:space:]]*", "")
        print
        exit
      }
    }
  ' "$1"
}

echo "Checking version sync..."
pkg_ver="$(extract_version package.json)"
plugin_ver="$(extract_version .claude-plugin/plugin.json)"
if [ -n "$pkg_ver" ] && [ "$pkg_ver" = "$plugin_ver" ]; then
  ok "package.json and plugin.json both at $pkg_ver"
else
  err "version mismatch: package.json=$pkg_ver plugin.json=$plugin_ver"
fi

echo "Checking promoted skills (from plugin.json)..."
# Pull each "./skills/..." entry out of the plugin manifest's skills array.
skill_paths="$(grep -oE '"\./skills/[^"]+"' .claude-plugin/plugin.json | tr -d '"' || true)"

if [ -z "$skill_paths" ]; then
  err "plugin.json declares no skills"
fi

while IFS= read -r rel; do
  [ -z "$rel" ] && continue
  dir="${rel#./}"
  name="$(basename "$dir")"
  echo "- $name"

  [ -d "$dir" ] || { err "$dir does not exist"; continue; }

  skill_md="$dir/SKILL.md"
  if [ -f "$skill_md" ]; then
    fm_name="$(frontmatter_field "$skill_md" name)"
    fm_desc="$(frontmatter_field "$skill_md" description)"
    [ -n "$fm_name" ] || err "$skill_md missing 'name:' frontmatter"
    [ -n "$fm_desc" ] || err "$skill_md missing 'description:' frontmatter"
    if [ -n "$fm_name" ] && [ "$fm_name" != "$name" ]; then
      err "$skill_md name '$fm_name' does not match folder '$name'"
    fi
    [ -n "$fm_name" ] && [ "$fm_name" = "$name" ] && ok "SKILL.md frontmatter valid"
  else
    err "$skill_md missing"
  fi

  if [ -f "$dir/agents/openai.yaml" ]; then
    ok "agents/openai.yaml present"
  else
    err "$dir/agents/openai.yaml missing"
  fi

  if grep -q "$dir/SKILL.md" README.md; then
    ok "linked from README.md"
  else
    err "$name is not linked from README.md"
  fi
done <<< "$skill_paths"

echo
if [ "$fail" -eq 0 ]; then
  echo "All checks passed."
else
  echo "Validation FAILED." >&2
  exit 1
fi
