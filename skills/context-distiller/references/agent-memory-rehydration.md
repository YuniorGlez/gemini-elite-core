# Agent Memory Rehydration (2026)

Memory rehydration is the process of restoring an agent's past context and mission facts after a session reset.

## 1. The Rehydration Blueprint

Every subproject should have a `.gemini/` or `.agents/` folder containing rehydration artifacts:
-   `GEMINI.md`: Current mission context and project-specific rules.
-   `MEMORY.json`: A list of past bugs, decisions, and patterns.

## 2. Inheritance Hierarchy

Agents should load context in this order:
1.  **Global Rules**: (e.g., this `context-distiller` skill).
2.  **Project Master**: `docs/AGENTS.md` (General standards).
3.  **Subproject Local**: `.gemini/GEMINI.md` (Local mission).

## 3. Persistent Memory Sync

Use a local vector DB or a shared Markdown file to sync "learned facts."
-   *Fact*: "The user prefers CSS Modules over Tailwind for the billing module."
-   *Sync*: Add this fact to the `MEMORY.json` after the session ends.

## 4. Avoiding Context Pollution

Rehydration should be selective.
-   **Rule**: Don't load 1,000 resolved bugs. Load only the top 10 most recent or relevant facts.

## 5. Automated Rehydration Script

A shell script that bundles the registry, symbols, and active mission into a single prompt block.

```bash
# Example
cat docs/AGENTS.md .gemini/GEMINI.md PROJECT_SYMBOLS.json > .gemini/full_rehydration.txt
```

---
*Updated: January 22, 2026 - 21:35*
