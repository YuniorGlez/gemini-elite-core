# ReAct: Reasoning and Acting in Unison (2026)

ReAct is the standard for autonomous agents that need to interact with external tools and the real world.

## 1. The Thought-Action-Observation Loop

-   **Thought**: "I need to check the user's balance before approving the refund."
-   **Action**: `get_user_balance(userId: "123")`
-   **Observation**: `{"balance": 50.00}`
-   **Thought**: "The refund is 100.00. I cannot approve this automatically."

## 2. Prompting for ReAct

```text
You operate in a loop: Thought, Action, Observation.

Thought: Describe your reasoning about the task.
Action: Execute one of the allowed tools.
Observation: Read the result of the action.

Continue until you have reached the goal or a terminal error.
```

## 3. Tool Discovery

Agents perform best when they know the full scope of their abilities.
-   **Standard**: Provide a concise, typed list of tools at the beginning of every session.

## 4. Handling Ambiguity

If an action returns an unexpected observation:
-   **Action**: The agent must generate a "Recovery Thought" and attempt an alternative action rather than giving up.

## 5. Metadata for Traceability

Log the entire ReAct loop into the mission history. This allows for:
-   **Audit**: Seeing exactly why an agent took an action.
-   **Learning**: Improving the system prompt based on failed loops.

---
*Updated: January 22, 2026 - 20:55*
