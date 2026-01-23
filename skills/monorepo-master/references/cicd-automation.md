# CI/CD with Hardened Runners in 2026 Monorepos

## Zero-Trust Security (OIDC)
Never store long-lived secrets (e.g., AWS keys, Vercel tokens) in GitHub Secrets. Use OpenID Connect (OIDC) to grant short-lived permissions to your runners.

### GitHub Actions OIDC Config:
```yaml
permissions:
  id-token: write
  contents: read
```

---

## Bun-Optimized Workflows
Bun's native cache and install speed significantly reduce CI costs.

### Example Workflow:
```yaml
name: CI
on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0 # Important for Turbo's git filters

      - uses: oven-sh/setup-bun@v2
        with:
          bun-version: latest

      - name: Install dependencies
        run: bun install --frozen-lockfile

      - name: Turbo Build
        run: bun x turbo run build --filter=...[origin/main]
        env:
          TURBO_TOKEN: ${{ secrets.TURBO_TOKEN }}
          TURBO_TEAM: ${{ secrets.TURBO_TEAM }}
```

---

## Change-Aware Testing
Only run tests for what actually changed. This is the superpower of Turborepo in CI.

### Filter Strategies:
1. **Affected Packages**: `turbo run test --filter=...[origin/main]` (Runs tests for changed packages and their dependents).
2. **Direct Changes**: `turbo run test --filter=[origin/main]` (Runs tests only for the changed packages).

---

## Hardened Runners
For enterprise-grade monorepos, use self-hosted "Hardened" runners that:
1. Are ephemeral (destroyed after each job).
2. Have no persistent storage.
3. Are restricted by network policies.

---

## Automated Versioning (Changesets)
In a monorepo, managing versions of multiple packages is complex. Use `changesets` to automate this.

1. Developer runs `bun x changeset` to document a change.
2. PR is merged.
3. CI detects changes and creates a "Version Packages" PR.
4. Merging the Version PR triggers a release.
