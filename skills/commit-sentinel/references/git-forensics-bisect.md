# Git Forensics: Mastering `git bisect` (2026)

`git bisect` is the most powerful tool for finding the exact commit that introduced a regression. In 2026, we use it with automated test runners for ultra-fast recovery.

## 1. The Bisect Workflow

If a bug exists in `HEAD` but worked in version `v1.5.0`:

```bash
git bisect start
git bisect bad HEAD
git bisect good v1.5.0
```

Git will now checkout a commit halfway between the two. You test it, and tell Git if it's "good" or "bad."

## 2. Automated Bisecting (The Elite Way)

Don't test manually. Use `git bisect run`.

```bash
# Automatically find the commit that broke the tests
git bisect run bun test
```

If the test script exits with `0`, the commit is "good." If it exits with `1-124`, it's "bad."

## 3. Handling Unbuildable Commits

If a commit is broken and cannot be tested (e.g., syntax error), skip it:

```bash
git bisect skip
```

## 4. Visualizing the Search

Use `git bisect visualize` (or `gitk` / `git log`) to see the remaining range of suspect commits.

## 5. Cleaning Up

Once the culprit is found, reset your branch:

```bash
git bisect reset
```

## 2026 Best Practice: Atomic Bisecting

To make bisecting effective, commits must be **Atomic**. If a commit contains 50 unrelated changes, finding the culprit hash won't tell you *which* change caused the bug.

---
*Updated: January 22, 2026 - 17:45*
