# Advanced Rebasing and History Sculpting (2026)

Rebasing is the process of moving or combining a sequence of commits to a new base commit. It is essential for maintaining a linear, clean history.

## 1. Interactive Rebase (`-i`)

Sculpt your local history before pushing.

```bash
# Rebase the last 5 commits
git rebase -i HEAD~5
```

**Actions:**
- `pick`: Keep the commit.
- `reword`: Change the message.
- `edit`: Stop and modify the code.
- `squash`: Combine into the previous commit.
- `fixup`: Like squash, but discard this commit's message.
- `drop`: Remove the commit entirely.

## 2. Rebase onto Main

Keep your feature branch up-to-date without "Merge Junk."

```bash
git checkout feature-branch
git fetch origin
git rebase origin/main
```

## 3. The "Golden Rule" of Rebasing

**NEVER** rebase commits that have been pushed to a public/shared branch. It rewrites history and breaks other people's work.

## 4. Conflict Resolution during Rebase

1. Git stops at the first conflict.
2. Fix the files.
3. `git add <files>`.
4. `git rebase --continue`.
5. *Never* use `git commit` during a rebase.

## 5. Autosquash (The Pro Flow)

Use `commit --fixup` to mark a change for later squashing.

```bash
# Fix a bug in a specific commit
git commit --fixup <hash>
# Later, run rebase with autosquash
git rebase -i --autosquash origin/main
```

---
*Updated: January 22, 2026 - 17:45*
