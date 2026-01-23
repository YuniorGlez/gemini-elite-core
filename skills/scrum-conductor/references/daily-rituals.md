# Automated Daily Rituals

## The AI-Pre-Standup
In 2026, the first 10 minutes of the day are for the AI to prepare the human team.

### 1. Fact-Checking
The orchestrator scans:
- **Git Logs**: What was merged? What is still in PR?
- **CI/CD**: Are there any broken builds in `main`?
- **Tickets**: Which tickets changed status?

### 2. Status Synthesis
Instead of reading a list, the AI generates a "Vibe Report."
- *Example*: "Velocity is high, but we're seeing an increase in 'Failed Quality' labels on the Auth module. We might need a pairing session there."

### 3. Blocker Detection
AI identifies "Hidden Blockers":
- A PR that has been open for 3 days with no review.
- A ticket assigned to someone who is currently OOO.
- A dependency on a library that just released a breaking change.

---

## The "Parking Lot" Workflow
The standup is for status. Deep technical discussions happen in the "Parking Lot."
- The AI automatically identifies keywords during the standup (e.g., "Refactor", "Architecture decision") and adds them to a shared document for the post-standup session.
