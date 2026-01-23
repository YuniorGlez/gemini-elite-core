# Context Distillation Patterns

## The Challenge of Token Bloat
Passing the entire project context to every subagent is expensive and leads to "Lost in the Middle" syndrome where the agent ignores crucial information.

---

## Distillation Techniques

### 1. Symbol Indexing
Instead of passing file contents, pass a list of available functions, classes, and types (interfaces). The subagent can then request specific file contents only when needed.

### 2. Fact Extraction
Use a "Context Distiller" agent to extract only the facts relevant to the sub-task.

**Example**:
- *Original*: "Fix the bug in the login flow." (Project has 100 files).
- *Distilled*: "Login flow uses `auth-expert` via `src/lib/auth.ts`. The error is in `validateSession`. Relevant interfaces: `Session`, `User`."

### 3. Summary Chain-of-Thought
Before delegating, the parent should write a concise summary of "What we know" and "What we need to find out."

---

## Recursive Context Reduction
As delegation depth increases, the context must become narrower.
- **Level 0 (User)**: Full problem statement.
- **Level 1 (Supervisor)**: Architectural plan + key files.
- **Level 2 (Worker)**: Single function logic + local types.
- **Level 3 (Executor)**: Specific tool parameters.
