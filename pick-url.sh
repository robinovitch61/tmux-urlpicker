#!/usr/bin/env bash
set -euo pipefail

file="${1:?usage: pick-url.sh <file>}"

url=$(grep -oE 'https?://[^][[:space:]"'"'"'<>{}|\\^`]+' "$file" \
  | tac \
  | awk '!seen[$0]++' \
  | fzf --no-sort --prompt="Open URL: ")

if [ -n "$url" ]; then
  open "$url"
fi
