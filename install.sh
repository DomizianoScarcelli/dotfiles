#!/bin/bash
# Bootstrap a Mac from this repo. Idempotent; safe to re-run.
set -euo pipefail
cd "$(dirname "$0")"

command -v brew >/dev/null || { echo "Homebrew missing: https://brew.sh" >&2; exit 1; }

brew bundle install --file=Brewfile     # install everything in the Brewfile
# brew bundle cleanup --force            # uncomment to also remove anything NOT in the Brewfile

# Symlink configs. One package per tool; add new ones here.
stow -R atuin ghostty hidutil nvim p10k tmux zshrc

# LaunchAgents live inside stow packages; (re)load the ones we own.
launchctl bootstrap "gui/$(id -u)" ~/Library/LaunchAgents/cc.domiziano.keymap.plist 2>/dev/null || true
~/.config/hidutil/keymap.sh apply
