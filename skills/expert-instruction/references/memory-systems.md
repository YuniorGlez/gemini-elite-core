# Agentic Memory Systems (2026)

True intelligence requires persistent experience. In 2026, memory is structured as a tiered system.

## 1. Short-Term Memory (Context Window)

-   **Focus**: Current session history and immediate task details.
-   **Limit**: Varies by model (200k - 2M tokens).
-   **Management**: Handled by "Context Engineering" to keep relevant bits at the top.

## 2. Mid-Term Memory (Working Context)

-   **Focus**: Active project files, recently visited documentation, and in-flight feature specs.
-   **Implementation**: A persistent "Knowledge Graph" or vector index of the current repository.

## 3. Long-Term Memory (Experience Repository)

-   **Focus**: Historical patterns, past bugs, user preferences, and "hard-won" architectural lessons.
-   **Mechanism**:
    1.  **Extraction**: Summarizing key learnings after each mission.
    2.  **Embedding**: Storing in a Vector Database (e.g., Pinecone, Supabase Vector).
    3.  **Retrieval**: Automatic querying based on current task similarity.

## 4. The "Memory Gate"

Agents must not store sensitive data (keys, PII) in memory.
-   *Rule*: Run a "Secret Scrub" before persisting any memory vector.

## 5. Shared Memory (Hive Mind)

Across a team, agents can share common project knowledge.
-   **Standard**: Use `project.json` or `memory.json` in the project root to store collaborative facts.

---
*Updated: January 22, 2026 - 18:40*
