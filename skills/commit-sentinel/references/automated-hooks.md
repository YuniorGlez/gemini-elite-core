# Automated Validation with Git Hooks (2026)

Don't rely on human memory. Use hooks to enforce the **Elite Protocol**.

## 1. The Pre-Commit Hook

Run types and linting automatically.

```bash
# .git/hooks/pre-commit
#!/bin/sh
bun x tsc --noEmit
if [ $? -ne 0 ]; then
  echo "Type check failed. Commit aborted."
  exit 1
fi
```

## 2. Commit-Msg Hook (Commitlint)

Enforce Conventional Commits.

```bash
# .git/hooks/commit-msg
npx --no -- commitlint --edit "$1"
```

## 3. Pre-Push Hook

Run the full test suite before code leaves your machine.

```bash
# .git/hooks/pre-push
bun test
```

## 4. Hook Management with Lefthook or Husky

Use a dedicated manager for cross-team consistency.

```yaml
# lefthook.yml
pre-commit:
  commands:
    types:
      run: bun x tsc --noEmit
    lint:
      run: bun run lint
```

## 5. Bypassing Hooks (The "Forbidden" Rule)

-   **Rule**: Never use `--no-verify`.
-   **Exception**: Only for `chore: release` or emergency hotfixes where CI is already running a total audit.

---
*Updated: January 22, 2026 - 17:45*
