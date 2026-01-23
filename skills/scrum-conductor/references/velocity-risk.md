# Predictive Velocity & Risk

## Moving Beyond "Story Points"
Story points are subjective. In 2026, we use "Cycle Time" and "Lead Time" as the primary metrics.

---

### 1. Cycle Time Analysis
- How long does it take for a ticket to go from "In Progress" to "Merged"?
- **Elite Pattern**: Flag any ticket that exceeds the team's 90th percentile cycle time.

### 2. Context Debt
AI performance drops when the "Context Window" of a project becomes cluttered or contradictory.
- **Risk Indicator**: An increase in "Fixing previous fix" commits.
- **Remedy**: Schedule a "Context Cleanup" sprint.

### 3. Integration Friction
If the time spent in "Ready for Review" is increasing, your review process is a bottleneck.
- **Fix**: Implement `code-review-pro` to automate the low-level checks, leaving only architectural review for humans.

---

## The "Burn-Down" Evolution
The 2026 burn-down chart includes a "Probability Cone."
- "Based on current velocity and remaining work, there is an 85% chance we hit the goal by Friday."
