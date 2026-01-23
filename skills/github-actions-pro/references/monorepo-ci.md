# Monorepo CI Strategies

## Parallelization with Turborepo
In a monorepo, a single workflow can become a bottleneck. Use Turborepo to split tasks across multiple parallel runners.

### Filter-Based Workflows
Run only what is affected by the current PR.

```yaml
steps:
  - name: Build Affected
    run: bun x turbo run build --filter=...[origin/main]
```

---

## Caching Strategy
A robust caching strategy is the difference between a 2-minute and 20-minute build.

### 1. Global Bun Cache
Cache the `~/.bun/install/cache` directory across all jobs.

### 2. Turborepo Remote Cache
Use Vercel Remote Cache or a custom implementation (e.g., `turbo-cache-server`) to share build artifacts between different workflow runs and different developers' machines.

---

## Matrix-Based Testing for Packages
If you have 50 packages, running `bun test` in one job might take too long. Split them.

```yaml
jobs:
  test:
    strategy:
      matrix:
        package: [app-web, api, ui, utils]
    runs-on: ubuntu-latest
    steps:
      - run: bun x turbo run test --filter=${{ matrix.package }}
```

---

## Artifact Sharing
If you build in one job and deploy in another, use `actions/upload-artifact` and `actions/download-artifact`.

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - run: bun run build
      - uses: actions/upload-artifact@v4
        with:
          name: build-assets
          path: apps/web/.next/

  deploy:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: build-assets
          path: .next/
      - run: verson deploy --prebuilt
```

---

## Handling Environment Variables in Monorepos
Environment variables can be tricky.
- **Global Secrets**: Use for things like `TURBO_TOKEN`.
- **Package Secrets**: Store as environment-specific secrets (e.g., `STRIPE_KEY_STAGING`) and map them carefully in the workflow.
