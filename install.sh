#!/bin/bash
# Bootstrap a Mac from this repo. Idempotent; safe to re-run on a fresh Mac or one with the old config.
set -euo pipefail
cd "$(dirname "$0")"

command -v brew >/dev/null || { echo "Homebrew missing: https://brew.sh" >&2; exit 1; }

brew bundle install --file=Brewfile     # install everything in the Brewfile
# brew bundle cleanup --force            # uncomment to also remove anything NOT in the Brewfile

# --- Leftovers from the packer era (pre lazy.nvim). Must go before stow: packer_compiled.lua
# lives in a real ~/.config/nvim/plugin dir that stops stow from folding the package into one link,
# and treesitter's query symlinks point into the packer dir.
rm -rf ~/.local/share/nvim/site/pack/packer
rm -f  ~/.config/nvim/plugin/packer_compiled.lua
rmdir  ~/.config/nvim/plugin 2>/dev/null || true

# Symlink configs. One package per tool; add new ones here.
stow -R ghostty hidutil nvim tmux

# --- Neovim: plugins at the commits in lazy-lock.json, treesitter parsers+queries, Mason tools.
# All headless so the first interactive launch is already complete.
nvim --headless "+Lazy! restore" +qa
nvim --headless "+lua require('nvim-treesitter').install(require('dov.treesitter_langs'), {force=true}):wait(600000)" +qa
nvim --headless "+MasonToolsInstallSync" +qa

# LaunchAgents live inside stow packages; (re)load the ones we own.
launchctl bootstrap "gui/$(id -u)" ~/Library/LaunchAgents/cc.domiziano.keymap.plist 2>/dev/null || true
~/.config/hidutil/keymap.sh apply
