# Symbol Indexing and Symbolic AI (2026)

When codebases are too large for simple context packing, we use Symbol Indexing to give agents a "Map" of the project.

## 1. What is a Symbol Index?

A lightweight JSON or Markdown file that lists all exports (Classes, Functions, Types) and their file paths.

-   **Purpose**: Allows the agent to "know where to look" without reading 50 files.

## 2. Generating the Map

```typescript
// Example: scripts/map_symbols.ts
import { glob } from "bun";

async function mapProject() {
  const files = glob.scan("src/**/*.ts");
  const symbols = [];
  for (const file of files) {
    const content = await Bun.file(file).text();
    // Regex to find export signatures
    const matches = content.matchAll(/export (const|function|class|interface) (\w+)/g);
    for (const m of matches) {
      symbols.push({ name: m[2], type: m[1], path: file });
    }
  }
  await Bun.write("PROJECT_SYMBOLS.json", JSON.stringify(symbols));
}
```

## 3. Symbolic RAG (Retrieval-Augmented Generation)

In 2026, we don't just use Vector Search; we use **Symbolic RAG**.
-   **Step 1**: Agent identifies the symbols it needs based on the index.
-   **Step 2**: Agent reads *only* those specific files.

## 4. Maintenance of the Index

The index MUST be updated:
-   On every new mission start.
-   After major refactors.
-   Automatically via a `post-commit` hook.

## 5. Metadata for Symbols

Enhance the index with:
-   `complexity_score`: (Cyclomatic complexity).
-   `usage_count`: How many times a symbol is imported.
-   `last_modified`: Date of last significant change.

---
*Updated: January 22, 2026 - 21:35*
