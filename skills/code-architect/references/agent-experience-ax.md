# Agent Experience (AX): Designing for Machine Users (2026)

In 2026, AI agents are your primary users. Designing for AX ensures your system is discoverable, readable, and actionable by AI.

## 1. Machine-Readable Documentation

AI doesn't like "Wall of Text."

-   **Structure**: Use strict Markdown with H2/H3 hierarchies.
-   **Frontmatter**: Include metadata (title, version, updated date) for indexing.
-   **Symbols**: Explicitly list all functions and their type signatures.

## 2. Actionable Metadata

Every API response should tell the agent what it *can* do next.

```json
{
  "status": "success",
  "data": { "id": "job_123" },
  "next_actions": [
    { "action": "check_status", "method": "GET", "url": "/api/job/123/status" }
  ]
}
```

## 3. High-Fidelity Feedback

When an agent fails, don't just return an error code. Return a **Correction Path**.

-   **Bad**: `500 Internal Server Error`.
-   **Good**: `Error: 'priority' must be between 1-5. Your input was 10. Please retry with a valid priority.`

## 4. Deterministic State Transitions

Agents work best with clear, finite state machines.

-   **Explicit States**: `DRAFT` -> `REVIEW` -> `PUBLISHED`.
-   **Validation**: Every transition is checked against a rigid schema (Zod).

## 5. AX-First Tooling

Build custom MCP servers for your internal tools. This allows external agents (like Gemini CLI) to plug into your system natively.

---
*Updated: January 22, 2026 - 19:15*
