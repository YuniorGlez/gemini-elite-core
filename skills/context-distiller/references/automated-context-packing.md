# Automated Context Packing for Agents (2026)

Context packing is the process of bundling relevant code, docs, and metadata into a single, high-fidelity artifact for LLM ingestion.

## 1. The Packing Hierarchy

When generating context, include information in this priority:
1.  **Objective**: What is the immediate goal?
2.  **Structural Invariants**: Architecture rules (Clean, Modular).
3.  **Active File Set**: Code currently being modified.
4.  **Symbolic Context**: Interface and type definitions.
5.  **Historical Evidence**: Recent similar fixes or PRs.

## 2. Tools of the Trade (2026)

-   **`repomix`**: The industry standard for structured Markdown bundles.
-   **`gitingest`**: Fast, git-aware text extraction.
-   **`repo2txt`**: Lightweight directory-to-text conversion.

## 3. Pruning for Token Efficiency

Noise is the enemy of reasoning.
-   **Exclude List**: `node_modules`, `.next`, `dist`, `.git`, `bun.lock`.
-   **Semantic Filtering**: Remove repetitive imports and CSS if not relevant to the logic task.
-   **Size Guard**: If a pack exceeds 100k tokens, pivot to **Symbol Indexing**.

## 4. Repomix Optimization Patterns

```bash
# Recommended command for 2026 agents
bun x repomix --include "src/**/*.ts,package.json,README.md" \
              --exclude "**/tests/**,**/*.test.ts" \
              --output .gemini/context/active_mission.md
```

## 5. Security: The "Scrub" Phase

Before packing context, run a local scan to ensure no `.env` values or private keys are accidentally included in the Markdown file.

---
*Updated: January 22, 2026 - 21:35*
