# OIDC Configuration Deep Dive (2026 Standards)

## Why OIDC?
OIDC (OpenID Connect) allows GitHub Actions to assume an IAM role in your cloud provider without storing long-lived credentials. This eliminates the risk of secret leakage from GitHub.

---

## AWS Configuration
1. **Identity Provider**: Add `token.actions.githubusercontent.com` as an OIDC provider in AWS IAM.
2. **Trust Policy**: Create a role with a trust policy that restricts access to your specific repository.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::1234567890:oidc-provider/token.actions.githubusercontent.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
        },
        "StringLike": {
          "token.actions.githubusercontent.com:sub": "repo:my-org/my-repo:*"
        }
      }
    }
  ]
}
```

---

## Google Cloud (GCP) Configuration
1. **Workload Identity Pool**: Create a pool for GitHub Actions.
2. **Provider**: Create an OIDC provider within the pool.
3. **IAM Policy**: Grant the service account permissions to be assumed by the pool identity.

```bash
gcloud iam service-accounts add-iam-policy-binding "my-sa@my-project.iam.gserviceaccount.com" 
    --project="my-project" 
    --role="roles/iam.workloadIdentityUser" 
    --member="principalSet://iam.googleapis.com/projects/my-project-number/locations/global/workloadIdentityPools/my-pool/attribute.repository/my-org/my-repo"
```

---

## Azure Configuration
1. **App Registration**: Create an app in Microsoft Entra ID.
2. **Federated Credentials**: Add a credential of type "GitHub Actions" and scope it to your repo/branch.

---

## Troubleshooting
- **Subject Mismatch**: Ensure the `sub` claim in your trust policy exactly matches what GitHub sends (e.g., `repo:org/repo:ref:refs/heads/main`).
- **Audience (aud)**: For AWS, the audience must be `sts.amazonaws.com`. For others, it's usually the client ID or a specific URL.
