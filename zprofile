eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mise activate zsh --shims)"

[[ -f ~/.zprofile.local ]] && source ~/.zprofile.local
