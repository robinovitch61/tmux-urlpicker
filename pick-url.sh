#!/usr/bin/env bash
set -euo pipefail

file="${1:?usage: pick-url.sh <file>}"

urls=$(grep -oE 'https?://[^][[:space:]"'"'"'<>{}|\\^`]+' "$file" \
  | tac \
  | awk '!seen[$0]++') || true

if [ -z "$urls" ]; then
  tmux display-message "No URLs found"
  exit 0
fi

url=$(echo "$urls" | fzf --no-sort --prompt="Open URL: ")

if [ -n "$url" ]; then
  open "$url"
fi
