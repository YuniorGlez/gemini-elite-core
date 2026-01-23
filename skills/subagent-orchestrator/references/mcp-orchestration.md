# MCP Orchestration Deep Dive

## The MCP Architecture
MCP (Model Context Protocol) provides a standardized way for agents to connect to "Servers" that host tools, resources, and prompts.

### 1. Resources
Resources are readable data sources like files, database schemas, or API documentation. Subagents should use `list_resources` to discover what's available before reading.

### 2. Tools
Tools are executable functions. MCP standardizes the JSON-Schema for tool arguments, ensuring strict typing and validation.

### 3. Prompts
Servers can provide "Prompt Templates" that guide the agent on how to use specific tools effectively.

---

## Orchestrating Multiple Servers
An orchestrator may need to connect to multiple MCP servers simultaneously (e.g., one for Postgres, one for GitHub, one for local files).

### Pattern: Unified Toolset
The parent agent acts as a "Gateway," exposing a unified set of tools to the subagent. The parent is responsible for routing the subagent's tool calls to the correct MCP server.

---

## Bidirectional Communication (Sampling)
In 2026, MCP servers can "Sample" the model. This means a server (like a code analysis tool) can ask the agent to "Explain this code" or "Write a fix" as part of its execution.

### Protocol Flow:
1. Agent calls Tool `A` on Server `X`.
2. Tool `A` starts executing.
3. Tool `A` sends a `sampling/createMessage` request back to the Agent.
4. Agent generates a response.
5. Tool `A` receives the response and finishes execution.
