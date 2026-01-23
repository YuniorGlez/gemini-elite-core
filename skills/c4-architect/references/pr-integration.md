# Diagrams in Pull Requests (PRs)

## Why Diagram in PRs?
Including diagrams in PRs helps reviewers understand the *architectural impact* of a change, not just the code diff.

---

## Automated Verification
Use the `c4-architect` skill to check if a PR violates architectural boundaries.

### Workflow:
1. PR is opened.
2. A GitHub Action runs a script to generate a "Proposed L2" diagram.
3. The agent compares the "Proposed L2" with the "Current L2".
4. If a new, unauthorized dependency is added (e.g., UI component directly calling the DB), the agent flags it.

---

## Mermaid Rendering in GitHub
GitHub natively renders Mermaid blocks in:
- PR Descriptions.
- Markdown files.
- PR Comments.

### Tip:
Encourage developers to include a "Visual Impact" section in their PR template:
```markdown
### 🖼️ Visual Impact (C4 Level 3)
```mermaid
C4Component
  ...
```
```

---

## The "Living Architecture" Rule
If a PR changes the relationship between containers, the central `ARCHITECTURE.md` file (L2 diagram) MUST be updated as part of the same PR. This ensures the documentation never goes stale.
