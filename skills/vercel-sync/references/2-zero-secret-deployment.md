# Reference: Zero-Secret Deployment (OIDC)

## Introduction
The 2026 security standard for Squaads projects is "Zero Long-Lived Secrets." We use OpenID Connect (OIDC) to federate identity between GitHub Actions and Vercel.

## 🛡️ How it Works
1.  **Identity Provider:** GitHub acts as the OIDC provider.
2.  **Trust Relationship:** You configure Vercel to trust the GitHub organization/repository.
3.  **Temporary Token:** During the build, GitHub requests a short-lived token from Vercel based on the workflow's identity.

---

## 🛠️ Implementation Steps

### 1. Vercel Project Configuration
In the Vercel Dashboard (or via CLI), enable "Git Provider Federation" and add the GitHub repository ID.

### 2. GitHub Workflow Update
```yaml
name: Deploy to Vercel
on: [push]

jobs:
  deploy:
    runs-on: ubuntu-latest
    permissions:
      id-token: write # Mandatory for OIDC
      contents: read
    steps:
      - uses: actions/checkout@v5
      
      - name: Authenticate with Vercel
        uses: vercel/actions/auth@v1
        id: vercel-auth
        with:
          oidc-role: 'SQUAAD_DEPLOYER_ROLE'
      
      - name: Build and Deploy
        run: |
          bun x vercel deploy --prebuilt --token=${{ steps.vercel-auth.outputs.token }}
```

---

## 💎 Benefits
- **No `VERCEL_TOKEN` to rotate:** Tokens expire automatically.
- **Auditable:** Every deployment is tied to a specific GitHub Run ID.
- **Scoped:** The token only has permissions for the specific project and environment (Preview vs Production).

---

## 🧪 Verification
Run `bun x vercel audit` to see the history of OIDC-based deployments and verify that no manual tokens are being used in the pipeline.
