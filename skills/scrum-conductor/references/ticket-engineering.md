# Ticket Engineering Standards

## Writing for Two Audiences
In 2026, tickets are read by humans *and* AI agents. They must be precise.

---

### 1. The "Why" (Context)
Explain the business or technical reason for the task. 
- **Good**: "Needed to comply with the new Stripe 2026 billing meters."
- **Bad**: "Update stripe code."

### 2. Implementation Pointers
For AI agents, provide a "Starting Point."
- *Example*: "Relevant file: `src/lib/stripe.ts`. See `StripeMeter` interface in `@stripe/sdk` docs."

### 3. Acceptance Criteria (AC)
Must be binary (True/False).
- [ ] Users can see their current usage in the dashboard.
- [ ] Webhook handles `meter.updated` events.
- [ ] 100% test coverage on `calculateBilling()` function.

### 4. Technical Constraints
Mention any "No-Go" zones.
- *Example*: "Do not change the `User` schema in this ticket."

---

## Automatic Grooming
Use AI to scan the backlog for:
- **Ambiguity**: "This ticket has no AC, please clarify."
- **Duplication**: "This looks 85% similar to ticket PROJ-456."
- **Technical Debt**: "This module hasn't been touched in 4 months."
