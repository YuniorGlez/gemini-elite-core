# Advanced Workflow Orchestration

## Sequential vs. Parallel Jobs
Use the `needs` keyword to create dependencies between jobs.

```yaml
jobs:
  lint:
    runs-on: ubuntu-latest
    steps: [...]
    
  test:
    needs: lint # Runs only if lint passes
    runs-on: ubuntu-latest
    steps: [...]
    
  deploy:
    needs: [lint, test] # Runs only if both pass
    runs-on: ubuntu-latest
    steps: [...]
```

---

## Conditional Execution
Use `if` at the job or step level to control execution based on context.

```yaml
jobs:
  deploy-production:
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps: [...]
```

---

## Passing Data between Jobs (Outputs)
Jobs run on fresh runners, so data must be explicitly exported.

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    outputs:
      build_id: ${{ steps.gen_id.outputs.id }}
    steps:
      - id: gen_id
        run: echo "id=build-$(date +%s)" >> $GITHUB_OUTPUT

  notify:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - run: echo "Starting build ${{ needs.build.outputs.build_id }}"
```

---

## Matrix Builds
Run multiple jobs with different configurations in parallel.

```yaml
jobs:
  test:
    strategy:
      fail-fast: false # Don't stop other jobs if one fails
      matrix:
        os: [ubuntu-latest, windows-latest, macos-latest]
        node: [20, 22]
    runs-on: ${{ matrix.os }}
    steps:
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node }}
```

---

## Workflow Dispatch
Allow manual triggering of workflows with inputs.

```yaml
on:
  workflow_dispatch:
    inputs:
      logLevel:
        description: 'Log level'
        required: true
        default: 'warning'
        type: choice
        options: [info, warning, error]
```
