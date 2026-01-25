# 🤖 Gemini Elite Core: Full Context & Project DNA

## 1. Project Overview
**Gemini Elite Core** is not a standard software application; it is a high-performance **Autonomous Agent Orchestration Suite**. It serves as the "Operating System" and "Tactical Brain" for the Gemini CLI (v0.26.0+). Its primary purpose is to transform a base LLM into a specialized Senior Software Engineer capable of navigating the complex tech landscape of 2026.

## 2. The "Why" (The Problem)
Standard AI agents suffer from:
- **Knowledge Stale-ness:** Training data lacks the latest 2026 updates (React 19.2, Next.js 16.2, Tailwind 4).
- **Lack of Protocol:** Agents often make non-idiomatic choices or fail to follow project-specific linting/typing standards.
- **Context Choice Paralysis:** Having too many tools but no clear strategy on which to activate for a specific task.

## 3. The "Elite" Solution (The Goals)
- **Structured Intelligence:** Providing an indexed library of **73+ Tactical Skills** that inject real-time documentation and "Elite Standards" into the agent's context.
- **Agent Experience (AX) Optimization:** Designing the codebase so it is "readable" and "executable" by machines first, humans second.
- **Automated Guardrails:** Using **Hooks** to enforce type-checking (`tsc`), linting, and commit standards (`Commit Sentinel`) without human intervention.
- **Zero-Latency Orchestration:** Using `conductor-pro` to intelligently sequence sub-agents and skills.

## 4. Technical Pillars

### A. Tactical Skills (`/skills`)
The core knowledge base. Each skill (e.g., `react-expert`, `supabase-expert`) is a "Context Injection" module.
- **Standard:** 400+ lines of depth, example-first, and includes a "Do Not List".
- **Recency:** Explicitly optimized for January 2026 standards.

### B. Event Hooks (`/hooks`)
The "Nervous System" of the CLI.
- `session-start-welcome.js`: Bootstraps the agent's persona.
- `after-tool-type-check.js`: Automatically runs `bun x tsc --noEmit` after logic modifications.
- `after-model-commit-check.js`: Validates Conventional Commits.

### C. The Conductor (`conductor-pro`)
The meta-skill that prevents choice paralysis. It breaks down complex requests into atomic sub-tasks and delegates them to the appropriate tactical experts.

### D. The Landing Page (`/website`)
A high-performance React 19 + Tailwind 4 site that serves as the project's public face and installation portal.

## 5. Architectural Standards (2026)
- **Runtime:** Bun (Exclusive).
- **Frontend:** React 19.2 (using `use()`, `cacheSignal`, and the React Compiler).
- **Styling:** Tailwind CSS 4.0 (Oxide engine, CSS-first config).
- **Typing:** Strict TypeScript (no `any`, Zod-validated tool inputs).
- **Protocol:** Conventional Commits only.

## 6. Guidance for Future Agents
When you enter this repository:
1. **Acknowledge the Persona:** You are an Elite Senior Engineer.
2. **Follow the Hooks:** If a change is made, assume the `after-tool` hooks will catch errors.
3. **Respect the Registry:** Always consult `SKILLS_REGISTRY.md` before suggesting a new skill.
4. **Maintain AX:** Keep documentation precise and "Prompt-Ready".

---
*Generated: January 25, 2026*
