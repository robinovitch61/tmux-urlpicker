# tmux-urlpicker

Quickly open any URL visible in your tmux pane. Uses `fzf` for selection — URLs are shown most-recent-first, and a single Enter opens the selected URL in your browser.

When the pane is zoomed, a borderless popup is used so zoom state is preserved.

### Dependencies

- [fzf](https://github.com/junegunn/fzf) - `brew install fzf`
- tmux 3.2+ (for popup support when zoomed)

### Key bindings

- `prefix + u` - list URLs from the current pane and open the selected one

### Installation with [TPM](https://github.com/tmux-plugins/tpm)

Add to `.tmux.conf`:

```tmux
set -g @plugin 'lrobinovitch/tmux-urlpicker'
```

Then `prefix + I` to install.

### Manual Installation

Clone the repo:

```sh
git clone https://github.com/lrobinovitch/tmux-urlpicker ~/clone/path
```

Add to `.tmux.conf`:

```tmux
run-shell ~/clone/path/urlview.tmux
```

Reload:

```sh
tmux source-file ~/.tmux.conf
```

### Configuration

Change the key binding (default `u`):

```tmux
set -g @urlview-key 'x'
```

### License

[MIT](LICENSE.md)
