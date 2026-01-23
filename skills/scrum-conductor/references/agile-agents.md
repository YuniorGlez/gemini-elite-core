# Agile with AI Agents

## The Agent as a Team Member
In the Squaads Core, AI agents are not just "tools," they are ephemeral team members.

---

### 1. Task Handoff Protocols
When a human delegates a ticket to an agent:
- **Input**: The Ticket (Context + AC).
- **Output**: A PR or a Blocker Report.

### 2. Supervisor Checkpoints
Every agent-completed task must be validated by a "Supervisor" (either a human or a high-level `auditor-pro` agent).
- **Rule**: No agent-written code goes to `main` without an independent review.

### 3. Escalation Tiers
- **Tier 1**: Agent solves the task autonomously.
- **Tier 2**: Agent asks for clarification on a specific technical point.
- **Tier 3**: Agent identifies a fundamental logic gap and requests a "Human Pairing" session.

---

## Retrospectives with AI
Use AI to analyze the sprint and suggest improvements:
- "We spent 40% of our time on CSS bugs. Recommend activating `shadcn-ui-expert` for the next sprint."
- "The `auth` module is a bottleneck. Suggest refactoring into a separate package."
