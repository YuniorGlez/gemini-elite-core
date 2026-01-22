# Professional MCP Server Development (2026)

Building robust MCP servers requires a shift from "API-first" to "Agent-first" thinking. This guide covers the engineering standards for high-performance servers.

## 1. Tool Design: Outcomes Over Operations

Do not simply mirror your REST API. Agents struggle with excessive orchestration.

-   **Bad**: `get_user_id`, `get_user_email`, `update_user_field`.
-   **Good**: `sync_user_profile` (handles identification and multi-field updates in one call).

## 2. Argument Flattening & Type Safety

Use flat schemas with strict types to reduce model hallucination.

```typescript
// Tool Declaration (Zod-based)
{
  name: "send_slack_alert",
  description: "Sends a critical alert to a channel.",
  inputSchema: z.object({
    channelId: z.string().describe("Target channel UUID"),
    message: z.string().min(10).describe("Alert content (min 10 chars)"),
    severity: z.enum(["low", "high", "critical"])
  })
}
```

## 3. Pagination & Resource Management

Never return 1,000 records in a single tool call. It will blow out the LLM's context and cost a fortune.

-   **Standard Limit**: 20-50 records per call.
-   **Metadata**: Always include `has_more` and `next_cursor`.
-   **Resource URIs**: For large files, return an `mcp://` URI that the agent can read partially using `resources/read`.

## 4. Helpful Error Strings

Agents can self-correct if you give them a path forward.

-   **Bad**: `Error: 400 Bad Request`.
-   **Good**: `Error: 'startDate' must be before 'endDate'. Please adjust your parameters and try again.`

## 5. Development Stack (2026)

-   **Runtime**: Bun (fastest startup, native TS support).
-   **Transport**: Standardize on **Stdio** for local tools and **SSE (Server-Sent Events)** for remote/cloud tools.
-   **Validation**: Use **Zod** or **Valibot** for runtime schema enforcement.

---
*Updated: January 22, 2026 - 17:30*
