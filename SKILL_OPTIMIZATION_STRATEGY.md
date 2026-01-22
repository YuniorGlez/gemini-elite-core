# SKILL_OPTIMIZATION_STRATEGY.md: Strategy for High-Performance Skills

## Core Philosophy
A skill is not just a reminder; it is an **active expansion of the LLM's knowledge base**. It must solve the "recency bias" and the "hallucination gap" by providing concrete, up-to-date documentation and implementation patterns that the model might not have in its training data (especially for versions like Next.js 16, React 19, or Tailwind 4).

## Mandatory Rules (The "Gold Standard")

### 1. Substantial Content Depth
- **Minimum Length**: Any skill covering a library or framework MUST have at least **400 lines** of content (including examples).
- **Recency**: Must explicitly mention versions (e.g., "Optimized for Next.js 16.1.1 and React 19.2").

### 2. Example-First Documentation
- **Show, Don't Just Tell**: For every "best practice," provide a corresponding code block.
- **Complexity Progression**: Include:
    - **Quick Start**: The most basic "hello world."
    - **Standard Pattern**: The most common production use case.
    - **Advanced/Edge Case**: How to handle complex state, performance bottlenecks, or security.

### 3. The "Do Not" List (Anti-Patterns)
- Every skill must have a **"The Do Not List"** or **"Common Mistakes"** section.
- Explicitly list deprecated patterns and why they should be avoided.

### 4. Progressive Disclosure (Structure)
- **SKILL.md**: The "Orchestrator." High-level patterns, core rules, and table of contents.
- **`references/` Directory**: Detailed deep-dives (e.g., `references/caching.md`, `references/auth-flows.md`). If a section in `SKILL.md` exceeds 100 lines, move it to a reference file.
- **`scripts/` Directory**: Automations for repetitive tasks related to the skill (e.g., `scripts/validate-schema.py`).
- **`templates/` or `assets/`**: Boilerplate files that the agent can copy and modify.

### 6. Mandatory Timestamp
- Every skill MUST end with a "Last Updated" line including the specific date and time.
- **Format**: `*Updated: [Month] [Day], [Year] - [HH:MM]*`
- **Example**: `*Updated: January 22, 2026 - 14:30*`

## Mandatory Workflow for Refactoring

### Step 1: Comparative Analysis (The "Vibe Check")
Before refactoring a local skill, MUST use the `chrome-devtools` or `browser-use` MCP to search the reference repository (`mgd34msu/goodvibes-plugin`) for a corresponding skill in their `skills/` directory.
- **Objective**: Identify missed patterns, architectural diagrams, or "Common Pitfalls" that we can adapt.
- **Rule**: Do not copy-paste. Use it as a benchmark for quality and structure.

### Step 2: Real-Time 2026 Research
Since LLM training data is static, MUST perform a web search (Google/Browser) for the latest documentation of the library/framework as of **January 2026**.
- **Objective**: Capture breaking changes, new experimental flags, and stabilized features (e.g., Next.js 16.2+, React 19.3).
- **Rule**: No skill is updated without a fresh search.

### Step 3: Refactor & Resource Expansion
- Update `SKILL.md` to meet the 400+ line standard.
- Create `references/` files for deep dives.
- Add/Update `scripts/` or `templates/` as needed.

### Step 4: Verification & Approval
Once the improvement is complete:
1.  **Update Registry**: Add or update the entry in `SKILLS_REGISTRY.md` with the new timestamp and version.
2.  **Mark as Done**: Update the specific checkbox in `task_plan.md` and `SKILL_REFACTOR_TODO.md`.
3.  **Report**: Briefly summarize the specific improvements made to the user in the console.
4.  **Propose Commit**: Ask for explicit permission: *"Mira, he mejorado la skill [Nombre] añadiendo [X, Y, Z]. Voy a hacer este commit. ¿Te parece correcto?"*
5.  **Wait for User Approval** before proceeding to the next skill.
