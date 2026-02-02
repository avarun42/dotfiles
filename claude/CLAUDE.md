# Graphite

**Always use Graphite (`gt`) for branching, committing, and submitting PRs.** If a `gt` command outputs a "Welcome to Graphite" setup message, the repo isn't initialized — fall back to `git` instead.

- `gt submit` runs non-interactively by default in this environment, which means:
  - PR metadata comes from the commit message set during `gt create -m` — the first line becomes the PR title, the rest becomes the description. Write it carefully.
  - PRs are created as drafts unless you pass `--publish`. Always pass `--publish`.

# Style

- When a change is clearly an improvement, make it directly instead of discussing whether it's worth doing. Still ask when there's genuine ambiguity or risk.

# Shell

- Use `rg` instead of `grep` and `fd` instead of `find` in shell commands.
