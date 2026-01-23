# Turborepo Task Orchestration Deep Dive

## Advanced Pipeline Configurations
Turborepo 2.5+ introduces more granular control over task execution.

### Task Dependencies (`dependsOn`)
- `^build`: Means "run the build task for all upstream dependencies first".
- `build`: Means "run the build task for the current package".

```json
{
  "tasks": {
    "build": {
      "dependsOn": ["^build"],
      "outputs": [".next/**", "dist/**", "build/**"]
    }
  }
}
```

### Global Hashes
Turborepo calculates a hash for each task to determine if it can be cached.
Factors included in the hash:
- File contents in the package.
- Global dependencies (e.g., `.env`, `tsconfig.json`).
- Environment variables listed in `turbo.json`.
- The task command itself.

---

## Remote Caching (2026 Standards)
Remote caching allows developers to share build artifacts across the team and CI.

### Security & Integrity:
- **Signed Artifacts**: Ensure your remote cache provider supports signing to prevent malicious code injection via the cache.
- **Cache Scoping**: Scope caches by branch or environment (e.g., `main` vs. `feature-x`) if using sensitive environment variables in builds.

---

## Filtering Tasks
The `--filter` flag is essential for productivity in large monorepos.

### Common Filters:
- `bun x turbo run build --filter=@repo/web`: Build only the web app.
- `bun x turbo run test --filter=...[origin/main]`: Run tests only for packages changed since `main`.
- `bun x turbo run lint --filter=@repo/ui...`: Lint the UI package and everything that depends on it.

---

## Troubleshooting Cache Misses
If you're getting unexpected cache misses, use the `--summarize` flag:
`bun x turbo run build --summarize`

This generates a `.turbo/runs/` folder with detailed logs on why the hash changed.
Common culprits:
- Absolute paths in `package.json` scripts.
- Non-deterministic build outputs (e.g., timestamps in files).
- Missing environment variables in the `globalDependencies` or task `env` array.
