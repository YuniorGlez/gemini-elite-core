# Sharding & Parallelism in CI

## What is Sharding?
Sharding splits your test suite into multiple parts (shards) that run on separate machines in parallel. 

### GitHub Actions Workflow:
```yaml
jobs:
  e2e:
    strategy:
      fail-fast: false
      matrix:
        shard: [1, 2, 3, 4]
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run Tests
        run: bun x playwright test --shard=${{ matrix.shard }}/4
```

---

## Parallelism vs. Workers
- **Workers**: Local parallelism on a single machine. Usually equal to the number of CPU cores.
- **Sharding**: Global parallelism across multiple machines.

---

## Blob Reports (Merging Results)
When you shard, each machine produces its own test report. Use "Blob" reports to merge them into a single HTML report at the end.

1. Each shard runs: `playwright test --reporter=blob`.
2. Final job runs: `playwright merge-reports ./all-blobs`.

---

## CI Cache Integration
To speed up CI, cache the browsers:
```yaml
- name: Cache Playwright Browsers
  uses: actions/cache@v4
  with:
    path: ~/.cache/ms-playwright
    key: ${{ runner.os }}-playwright-${{ env.PLAYWRIGHT_VERSION }}
```
