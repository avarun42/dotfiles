# History
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Initialize completions
autoload -Uz compinit
compinit

export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE="/var/run/docker.sock"

export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

eval "$(mise activate zsh)"

SKIM_CTRL_T_COMMAND="fd --type f --hidden --exclude .git"
SKIM_ALT_C_COMMAND="fd --type d --hidden --exclude .git"
eval "$(sk --shell zsh --shell-bindings)"

alias cat='bat'
alias ls='eza'

# Chrome with uBlock Origin (Manifest V2 extensions enabled)
alias chrome='open -b com.google.Chrome --args --disable-features=ExtensionManifestV2Unsupported,ExtensionManifestV2Disabled'

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
