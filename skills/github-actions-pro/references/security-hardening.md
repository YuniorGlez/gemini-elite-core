# Security Hardening Guide (2026)

## Action Pinning (SHA vs Tag)
Tags can be moved by the action author (intentionally or via compromise). SHA pinning ensures you run the exact code you audited.

### Good:
`uses: actions/checkout@v4` (Reliable for official actions, but still risky for 3rd party).

### Elite (2026 Standard):
`uses: actions/checkout@b4ffde65f46336ab88eb53be808477a3936bae11` # v4.1.1

---

## Token Permissions (`GITHUB_TOKEN`)
The default token has broad permissions. Always restrict them at the top of the workflow.

```yaml
permissions:
  contents: read
  pull-requests: write
```

---

## Environment Protection
Use GitHub Environments to restrict deployments to specific branches and require manual approvals.

```yaml
jobs:
  deploy:
    environment: production
    runs-on: ubuntu-latest
```

---

## Secret Masking & Handling
- **Never echo secrets**: GitHub masks them, but complex secrets can sometimes bypass the filter if partially echoed.
- **Use Environment Secrets**: Store production keys in the `production` environment, not global repository secrets.

---

## Prevent Script Injection
Avoid passing untrusted user input (like PR titles or comments) directly into shell scripts.

### Vulnerable:
```bash
run: echo "Processing PR: ${{ github.event.pull_request.title }}"
```

### Secure:
Set the input as an environment variable first.
```yaml
run: echo "Processing PR: $PR_TITLE"
env:
  PR_TITLE: ${{ github.event.pull_request.title }}
```

---

## Audit Logs & Monitoring
Regularly review GitHub Actions audit logs for:
- Unusual runner registrations.
- Secrets modified.
- Workflow permission changes.
