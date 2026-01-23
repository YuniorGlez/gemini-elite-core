# 🤖 Skill: subagent-orchestrator (v1.0.0)

## Executive Summary
Senior Multi-Agent Systems (MAS) Architect for 2026. Specialized in Model Context Protocol (MCP) orchestration, Agent-to-Agent (A2A) communication, and recursive delegation frameworks. Expert in managing complex task handoffs, shared memory state, and parallel subagent execution for high-autonomy engineering missions.

---

## 📋 The Conductor's Protocol

1.  **Orchestration Pattern Selection**: Determine the best pattern for the task (Hierarchical, Sequential, Parallel, or Handoff).
2.  **Context Boundary Definition**: Define exactly what memory and tools each subagent needs to minimize token bloat.
3.  **Sequential Activation**:
    `activate_skill(name="subagent-orchestrator")` → `activate_skill(name="conductor-pro")` → `activate_skill(name="mcp-expert")`.
4.  **Verification**: Implement a "Supervisor Check" step where the parent agent validates the subagent's output before final delivery.

---

## 🛠️ Mandatory Protocols (2026 Standards)

### 1. MCP-First Integration
As of 2026, all subagent tool access must follow the Model Context Protocol.
- **Rule**: Never build custom tool adapters. Use MCP servers for databases, APIs, and local resources.
- **Protocol**: Use the `sampling` feature for bidirectional communication between the agent and the MCP server.

### 2. Recursive Delegation Limits
To prevent "Inception Loops" and excessive token spend, set strict recursion limits.
- **Rule**: Maximum delegation depth is 3.
- **Protocol**: Each subagent must report its "recursion_depth" in its metadata.

### 3. Shared State & Memory Management
Subagents must have access to a consistent state without duplicating the entire context window.
- **Rule**: Use "Context Distillation" to pass only relevant symbols and facts.
- **Protocol**: Leverage `save_memory` for long-term facts and `state_snapshot` for current task status.

### 4. Handoff & Error Recovery
Multi-agent workflows are prone to "Handoff Drift" where the original objective is lost.
- **Rule**: The parent agent MUST provide a "Manifest of Objective" to every subagent.
- **Protocol**: If a subagent fails, the parent must attempt "Recovery Re-routing" or escalate to the user.

---

## 🚀 Show, Don't Just Tell (Implementation Patterns)

### Hierarchical Orchestration Pattern
```typescript
interface DelegationManifest {
  objective: string;
  constraints: string[];
  max_tokens: number;
  available_tools: string[];
}

// Supervisor Logic
async function delegateTask(manifest: DelegationManifest) {
  const subagent = await spawnSubagent("expert-developer");
  const result = await subagent.execute(manifest);
  
  if (validateOutput(result)) {
    return result;
  } else {
    return handleSubagentError(result);
  }
}
```

### Sequential Pipeline (Chain of Experts)
`architect-pro` → `code-architect` → `codeReviewer` → `auditor-pro`.

---

## 🛡️ The Do Not List (Anti-Patterns)

1.  **DO NOT** delegate without a clear objective. "Fix this" is not a manifest.
2.  **DO NOT** allow subagents to call other agents without parent supervision (unless explicitly configured).
3.  **DO NOT** pass the entire codebase to a subagent. Use `codebase_investigator` results.
4.  **DO NOT** ignore subagent logs. Silent failures in MAS are extremely difficult to debug.
5.  **DO NOT** use generic agents for specialized tasks. Always select the most appropriate skill first.

---

## 📂 Progressive Disclosure (Deep Dives)

- **[MCP Orchestration Deep Dive](./references/mcp-orchestration.md)**: Using MCP for tool and resource management.
- **[A2A Communication Protocols](./references/a2a-protocols.md)**: Horizontal coordination between peer agents.
- **[Error Handling in MAS](./references/error-handling.md)**: Retries, timeouts, and fallback strategies.
- **[Context Distillation Patterns](./references/context-distillation.md)**: Passing minimal, high-value context.

---

## 🛠️ Specialized Tools & Scripts

- `scripts/monitor-delegation.ts`: Real-time visualization of the agent delegation tree.
- `scripts/validate-handoff.py`: Analyzes handoff logs for objective drift.

---

## 🎓 Learning Resources
- [Anthropic MCP Documentation](https://modelcontextprotocol.io/)
- [Multi-Agent Systems Design Patterns](https://example.com/mas-patterns)
- [Agentic Workflow Optimization 2026](https://example.com/agent-flows)

---
*Updated: January 23, 2026 - 19:15*
