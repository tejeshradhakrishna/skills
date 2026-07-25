#!/usr/bin/env bash
#
# List every skill in the repo by the path to its SKILL.md, relative to the repo root.
#
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"

find skills -name SKILL.md -not -path '*/node_modules/*' | sed 's|^\./||' | sort
