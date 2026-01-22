# Security and Authentication in MCP (2026)

MCP servers often touch sensitive company data. Zero-trust security is mandatory for 2026 production environments.

## 1. OAuth 2.0 Integration

MCP servers should not handle user passwords. Use OAuth with PKCE.

1.  **Handshake**: Client (Agent) requests access.
2.  **Consent**: Host environment opens a browser for user consent.
3.  **Token**: Server receives an encrypted access token.
4.  **Enforcement**: Every tool call must verify the token before execution.

## 2. Capability-Based Security

Define granular scopes for your tools.

-   `read:docs`: Agent can see documents but not edit.
-   `write:code`: Agent can suggest changes to code.
-   `admin:users`: Agent can manage permissions (requires manual approval).

## 3. The "Human-in-the-Loop" (HITL) Gate

For high-risk operations (e.g., `delete_database`, `execute_shell`), the MCP server should return a `confirmation_required` flag.

```typescript
// MCP Result Structure for HITL
{
  is_done: false,
  status: "awaiting_approval",
  message: "I need to delete 50 files. Is this correct?",
  metadata: { risk: "high" }
}
```

## 4. Secret Management

-   **Never** log API keys or access tokens.
-   Use an MCP-native secret manager (like `mcp-server-secrets`) to inject environment variables securely.
-   Rotate server-to-server tokens every 24 hours.

## 5. Audit Trails

Log every MCP interaction:
-   Timestamp.
-   Agent ID.
-   Tool Name.
-   Arguments (masking sensitive fields).
-   Outcome.

---
*Updated: January 22, 2026 - 17:30*
