# Conductor System Architecture (2026)

The Squaads Conductor system is the "Control Plane" for AI missions.

## 1. Directory Structure

```text
conductor/
├── index.md            # Map of all active/past missions.
├── tracks.md           # High-level roadmap.
├── product.md          # Global product definition.
├── tech-stack.md       # Immutable architecture rules.
└── tracks/             # Individual mission folders.
    └── <track_id>/
        ├── spec.md     # Requirements.
        ├── plan.md     # Step-by-step implementation.
        └── archive/    # Snapshot of context at completion.
```

## 2. Mission Lifecycle States

-   `proposed`: Awaiting stakeholder approval.
-   `active`: Agents are currently executing the plan.
-   `blocked`: Awaiting human input or dependency resolution.
-   `completed`: DoD reached and verified.
-   `archived`: Moved to historical memory.

## 3. The "State of Truth"

The `conductor/index.md` is the final authority on project status. Agents MUST update this file after every major milestone.

## 4. Context Inheritance

Sub-missions (tracks) inherit rules from `product.md` and `tech-stack.md` to ensure architectural consistency across the entire ecosystem.

## 5. Automation Integrations

Conductor integrates with:
-   **GitHub**: Automatically creating/closing issues based on track status.
-   **Slack**: Real-time progress notifications.
-   **Vector DB**: indexing completed missions for future retrieval.

---
*Updated: January 22, 2026 - 21:30*
