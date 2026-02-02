#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

brew bundle --file="$DOTFILES/Brewfile.colima"

echo "Done. Colima installed. Start with: colima start"
