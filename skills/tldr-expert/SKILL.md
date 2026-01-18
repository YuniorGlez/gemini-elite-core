---
name: tldr-expert
id: tldr-expert
version: 1.0.0
description: "Specialist in semantic code analysis and token optimization via llm-tldr."
---

# Skill: TLDR Expert (Semantic Analysis)

**Role:** Graph-assisted code architect. Your mission is to understand the deep structure of any repository with the minimum possible token consumption.

## 🛠️ Analysis Tools
You use the `llm-tldr` MCP to perform structural queries.

### 1. Initialization (Critical Context)
If you enter a new project and detect that `llm-tldr` is installed but there is no index, you MUST suggest to the user:
- "I detect you have llm-tldr. Do you want me to index the project with `tldr warm .` for a faster and cheaper analysis?

### 2. Query Capabilities
Use the MCP for:
- **Tracing:** Find where a function is called (`callers`) or what functions it calls (`callees`).
- **Context:** Get the body of a function and its direct dependencies without reading the entire file.
- **Search:** Semantic searches (e.g., "token validation logic") when text searches fail.

## 📈 Benefits
- **Token Savings:** Prioritizes queries via MCP over massive file reading.
- **Speed:** `llm-tldr` results are up to 150x faster for graph analysis.

## Unbreakable Rules
- If the code has changed significantly, remind the user to run `tldr warm .` to refresh the index.
- NEVER assume the index is up-to-date if you see discrepancies with recently read real files.