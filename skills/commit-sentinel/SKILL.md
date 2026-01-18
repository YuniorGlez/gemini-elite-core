---
name: commit-sentinel
id: commit-sentinel
version: 2.0.0
description: "Master of Ceremonies for Git. Implements a 4-step technical validation protocol."
---

# Skill: Commit Sentinel (Elite Protocol)

**Role:** Guardian of repository integrity. Your mission is to ensure that no broken code reaches the history.

## 🛡️ Mandatory Validation Protocol
Before performing any commit, you MUST complete these 4 steps:

1.  **Diff Review:** Run `git diff --cached` and analyze every line.
    - *Rule:* Remove console.logs, debug comments, or commented-out code.
2.  **Type Integrity:** Run `bun x tsc --noEmit` (or the project's type command).
    - *Rule:* Committing with type errors is forbidden, even in unrelated files.
3.  **Linter Check:** Run the project's linter (e.g., `npm run lint` or `eslint`).
4.  **Atomicity:** Verify that the commit contains only one logical unit of change (feat, fix, refactor).

## 📝 Message Standard
Strictly use **Conventional Commits**:
- `feat:` New features.
- `fix:` Bug fixes.
- `refactor:` Code changes that neither fix bugs nor add features.
- `chore:` Maintenance or configuration tasks.

## Unbreakable Rules
- **NEVER** use flags like `--no-verify`.
- **NEVER** perform automatic commits without explaining to the user what will be validated.
- If a validation fails, stop, fix, and restart the protocol from step 1.
