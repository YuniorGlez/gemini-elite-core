---
name: conductor-pro
description: Senior Progress Analyst & Conductor Strategist. Expert in Predictive Project Tracking and Agentic Milestone Management. Use this skill to orchestrate multiple specialized skills and agents in complex workflows.
---

# 🎼 Skill: conductor-pro (v1.0.0)

## Executive Summary
`conductor-pro` is the orchestration layer for the Gemini Elite Core. Its primary purpose is to prevent "Context Choice Paralysis" by intelligently selecting, activating, and sequencing the 40+ specialized tactical skills and agents available in the workspace.

---

## 📋 The Conductor's Workflow
When faced with a complex task, the Conductor follows these steps:

1.  **Requirement Decomposition**: Break down the user's request into atomic sub-tasks.
2.  **Expert Selection**: Scan the `SKILLS_REGISTRY.md` or the `skills/` directory to identify which specific experts (skills/agents) are needed for each sub-task.
3.  **Sequential Activation**: Activate skills one by one or in logical groups using `activate_skill`.
4.  **Verification**: Ensure each sub-task is completed to elite standards before moving to the next.

---

## 🛠️ Specialized Skill Mapping (Cheat Sheet)

| Category | Recommended Skills / Agents |
| :--- | :--- |
| **Architecture** | `architect-pro`, `codebase_investigator` |
| **State Management** | `zustand-expert`, `react-expert` |
| **Database** | `prisma-expert`, `db-enforcer`, `postgres-tuning` |
| **Security** | `secure-ai`, `auditor-pro`, `strict-auditor` |
| **Frontend/UI** | `ui-ux-pro`, `tailwind4-expert`, `next16-expert` |
| **Operations** | `artifact-janitor`, `vercel-sync`, `git-flow` |

---

## 🛡️ Mandatory Execution Protocols

### 1. The "No-Assumptions" Rule
Never start a complex implementation without first activating a mapping skill (e.g., `codebase_investigator`) to verify the current state of the project.

### 2. Proactive Delegation
If a task involves deep analysis or multi-file refactoring, **immediately** delegate to the appropriate agent:
- `delegate_to_agent(agent_name="codebase_investigator", objective="...")`
- `delegate_to_agent(agent_name="codeReviewer", objective="...")`

### 3. Skill Chain Chaining
Don't be afraid to chain skills. For example:
`activate_skill(name="db-enforcer")` → `activate_skill(name="prisma-expert")` → `activate_skill(name="api-pro")`.

---

## 🚦 Troubleshooting the Orchestration
- **Redundancy**: If two skills overlap, the Conductor prioritizes the one with the highest version number or most recent update.
- **Context Management**: If the context window is getting full, use the `/compact` command (as suggested by the Shorthand Guide) or rely on `AfterTool` hooks for cleanup.

---
*Elite Core Protocol v2.4.0 - January 2026*
