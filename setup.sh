#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Install Homebrew
if ! command -v brew &>/dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install everything from Brewfile
brew bundle --file="$DOTFILES/Brewfile"

# Optional modules
if [[ "$1" == "--colima" ]]; then
	"$DOTFILES/setup-colima.sh"
fi

# Symlink helper: backs up existing file, then symlinks
link() {
	local src="$DOTFILES/$1"
	local dst="$2"
	mkdir -p "$(dirname "$dst")"
	if [ -e "$dst" ] && [ ! -L "$dst" ]; then
		mv "$dst" "$dst.backup"
		echo "Backed up $dst → $dst.backup"
	fi
	ln -sf "$src" "$dst"
	echo "Linked $dst → $src"
}

link zshenv "$HOME/.zshenv"
link zprofile "$HOME/.zprofile"
link zshrc "$HOME/.zshrc"
link gitconfig "$HOME/.gitconfig"
link ssh_config "$HOME/.ssh/config"
link ghostty/config "$HOME/.config/ghostty/config"
link claude/CLAUDE.md "$HOME/.claude/CLAUDE.md"

# macOS defaults
defaults write NSGlobalDomain KeyRepeat -int 4
defaults write NSGlobalDomain InitialKeyRepeat -int 15

echo ""
echo "Done. Log out and back in for keyboard settings to take effect."
