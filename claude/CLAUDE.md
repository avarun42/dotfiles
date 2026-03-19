# Graphite

**Always use Graphite (`gt`) for branching, committing, and submitting PRs.** If a `gt` command outputs a "Welcome to Graphite" setup message, the repo isn't initialized — fall back to `git` instead.

- `gt submit` runs non-interactively by default in this environment, which means:
  - PR metadata comes from the commit message set during `gt create -m` — the first line becomes the PR title, the rest becomes the description. Write it carefully.
  - PRs are created as drafts unless you pass `--publish`. Always pass `--publish`.

# Style

- When a change is clearly an improvement, make it directly instead of discussing whether it's worth doing. Still ask when there's genuine ambiguity or risk.

# Shell

- Use `rg` instead of `grep` and `fd` instead of `find` in shell commands.

# Git email

Before pushing to a repo under `avarun42`, verify `git config user.email` is `5677408+avarun42@users.noreply.github.com`. If it's not, set it (`git config user.email ...`) before committing/pushing. Work repos use the work email set as machine default in `~/.gitconfig.local`.

# Git history rewriting

When rewriting commits (e.g. changing author email), signatures become invalid and rebasing to re-sign clobbers committer dates. The correct order is:

1. `git filter-repo --mailmap` to rewrite author/email
2. `git filter-repo --commit-callback 'commit.committer_date = commit.author_date'` to fix committer dates
3. Re-sign with: `git rebase --root --exec 'GIT_COMMITTER_DATE="$(git log -1 --format=%ai)" git commit --amend --no-edit -S'`

Key: use `%ai` (author date), NOT `%ci` (committer date) — the rebase overwrites committer dates before `--exec` runs. Also: `filter-repo` removes the origin remote and strips signatures.
