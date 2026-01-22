# MCP Troubleshooting and Debugging Guide

Debugging MCP interactions can be challenging as the error often lives between the LLM, the Host, and the Server.

## 1. Local Debugging with MCP Inspector

Use the **MCP Inspector** tool to test your server without an LLM.

```bash
npx @modelcontextprotocol/inspector <your-server-command>
```

-   Verify `list_tools` returns the expected schema.
-   Check `resources/list` for correct URIs.
-   Execute tool calls with manual JSON inputs.

## 2. Common Errors

### "Method not found"
-   **Cause**: Your server doesn't implement the requested JSON-RPC method (e.g., `prompts/list`).
-   **Fix**: Update your SDK and ensure all required handlers are registered.

### "Tool call timed out"
-   **Cause**: The operation took longer than the host environment's timeout (usually 30-60s).
-   **Fix**: Implement **Progress Notifications** or optimize the backend logic.

### "LLM hallucinated arguments"
-   **Cause**: The tool description is vague.
-   **Fix**: Add "Example Usage" and strict "Constraints" to the tool's `description` field.

## 3. Host Logs

Check the logs of your host environment:
-   **Claude Desktop**: `~/Library/Logs/Claude/mcp.log`
-   **Gemini CLI**: Look for `mcp_error.log` in the project root.

## 4. Environment Injection Issues

If your tools fail due to missing API keys:
-   Check your `.mcp.json` or `config.yaml`.
-   Ensure keys are passed through the `env` object in the configuration.

## 5. SSE vs Stdio

-   **Stdio**: Fast, best for local scripts. Fails if the server writes junk to `stdout`. Use `stderr` for logging.
-   **SSE**: Better for remote tools. Requires proper CORS and HTTP headers.

---
*Updated: January 22, 2026 - 17:30*
