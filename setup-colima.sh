#!/bin/bash
set -e

DOTFILES="$HOME/code/dotfiles"

brew bundle --file="$DOTFILES/Brewfile.colima"

echo "Done. Colima installed. Start with: colima start"
