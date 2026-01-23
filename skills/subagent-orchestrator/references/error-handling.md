# Error Handling in Multi-Agent Systems

## Common Failure Modes
1. **Objective Drift**: Subagent forgets the original goal.
2. **Tool Failure**: MCP server is offline or returns an error.
3. **Context Overflow**: Subagent runs out of tokens.
4. **Infinite Loops**: Agents delegating back and forth indefinitely.

---

## Recovery Strategies

### 1. The "Reset & Re-prompt" Pattern
If a subagent's output is nonsensical or fails validation, the parent should reset the subagent's context and re-issue the command with more specific constraints.

### 2. Circuit Breakers
If an agent fails a specific tool call 3 times, the "Circuit Breaker" trips, and the task is escalated to the parent or user.

### 3. Graceful Degradation
If a complex subagent (e.g., `ai-pro`) fails, the system should fall back to a simpler, more deterministic agent or provide a placeholder.

---

## Logging & Traceability
Every agent interaction MUST be logged for debugging.

### Trace Log Schema:
- `timestamp`: ISO-8601
- `agent_id`: The subagent's ID.
- `parent_id`: The delegating agent's ID.
- `action`: "DELEGATE", "TOOL_CALL", "RESPONSE", "ERROR".
- `metadata`: Token counts, duration, and tool results.
