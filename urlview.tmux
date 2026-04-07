#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

readonly key="$(get_tmux_option "@urlview-key" "u")"
readonly picker="$CURRENT_DIR/pick-url.sh"

if ! type fzf >/dev/null 2>&1; then
  tmux display-message "tmux-urlpicker: fzf not found on PATH"
else
  tmux bind-key "$key" capture-pane -J \\\; \
    save-buffer "${TMPDIR:-/tmp}/tmux-buffer" \\\; \
    delete-buffer \\\; \
    if-shell -F "#{window_zoomed_flag}" \
      "display-popup -B -E \"$picker '${TMPDIR:-/tmp}/tmux-buffer'\"" \
      "split-window -l 10 \"$picker '${TMPDIR:-/tmp}/tmux-buffer'\""
fi
