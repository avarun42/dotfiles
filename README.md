# dotfiles

macOS dev environment config. Managed with symlinks — edit the files here, changes take effect immediately.

## Setup

```bash
git clone https://github.com/avarun42/dotfiles
cd dotfiles
./setup.sh
```

This installs Homebrew (if needed), all packages from the `Brewfile`, symlinks config files into place, and sets keyboard repeat rate. Existing files are backed up to `*.backup` before symlinking.

Log out and back in after running for keyboard settings to take effect.

### Optional modules

Pass flags to install additional tooling:

```bash
./setup.sh --colima
```

| Flag | What it installs |
|---|---|
| `--colima` | Colima, Docker CLI, Buildx, Compose |

Each module can also be run standalone (e.g. `setup-colima.sh`) to add it to an existing machine later.

## What's included

| File | Target | What it does |
|---|---|---|
| `zshenv` | `~/.zshenv` | PATH for uv, telemetry opt-out |
| `zprofile` | `~/.zprofile` | Homebrew, mise shims (non-interactive) |
| `zshrc` | `~/.zshrc` | History, completions, mise, skim + fd, aliases |
| `gitconfig` | `~/.gitconfig` | 1Password commit signing, rebase on pull, rerere |
| `ssh_config` | `~/.ssh/config` | 1Password SSH agent |
| `ghostty/config` | `~/.config/ghostty/config` | Catppuccin theme, Lilex font, bar cursor |
| `claude/CLAUDE.md` | `~/.claude/CLAUDE.md` | Claude Code preferences |

## Post-setup

Create `~/.ssh/allowed_signers` for git signature verification:

```
your-email ssh-ed25519 AAAA...
```

## Machine-specific overrides

Every config file sources a `.local` counterpart if it exists:

- `~/.zshenv.local`, `~/.zprofile.local`, `~/.zshrc.local` — extra shell config
- `~/.gitconfig.local` — e.g. override email for work: `[user] email = you@work.com`
- `~/.ssh/config.local` — extra SSH hosts

These files are not tracked in this repo.
