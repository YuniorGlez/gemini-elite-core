# A2A Communication Protocols (Horizontal Coordination)

## Peer-to-Peer Interaction
Unlike hierarchical delegation, A2A (Agent-to-Agent) focuses on peer collaboration where agents negotiate and share information.

---

## The Request-Response Pattern
Agents communicate using a structured JSON format.

```json
{
  "type": "A2A_REQUEST",
  "from": "frontend-dev",
  "to": "backend-architect",
  "payload": {
    "action": "QUERY_SCHEMA",
    "params": { "table": "users" }
  }
}
```

---

## Negotiation & Conflict Resolution
When two agents have conflicting plans (e.g., `ui-ux-pro` wants a complex animation, but `performance-expert` wants minimal JS), they must negotiate.

### Negotiation Protocol:
1. **Proposal**: Agent A proposes a change.
2. **Critique**: Agent B provides feedback with constraints.
3. **Synthesis**: A third agent (or the parent) resolves the conflict based on project priorities.

---

## Shared Working Memory
To avoid redundant work, agents should share a "Blackboard" or "Working Memory" where they post their findings.

### Blackboard Contents:
- Discovered symbols.
- Architectural decisions.
- Blockers and dependencies.
- Completed sub-tasks.
