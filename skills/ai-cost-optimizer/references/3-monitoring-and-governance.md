# Reference: AI Monitoring & Governance

## Overview
As agents become more autonomous, the risk of "Token Burn" increases. Governance is the set of tools and rules that prevent billing surprises.

---

## 🚦 1. Model Quotas & Budgets
Set strict limits at the Google Cloud Project level:
- **RPM (Requests Per Minute):** Prevent DoS on your own API.
- **TPM (Tokens Per Minute):** Cap the throughput of large reasoning tasks.

---

## 📊 2. Token Attribution
Every API call should be tagged with a `project_id` and `feature_id` in the metadata.

```typescript
// Conceptual Attribution Log
{
  "timestamp": "2026-01-22T23:45:00Z",
  "project": "Squaads-Core",
  "feature": "Code-Audit",
  "tokens": 5400,
  "cost": 0.0027,
  "cache_hit": true
}
```

---

## 🛡️ 3. The "Kill Switch" Pattern
Agents must have a hard limit on the number of "Turns" or total cost per mission.

```typescript
if (currentMission.accumulatedCost > BUDGET_LIMIT) {
  await notifyHuman("Budget exceeded. Pause mission?");
  return ABORT;
}
```

---

## 📈 4. Billing Dashboards
Use the Squaads billing dashboard to identify "Expensive Patterns."

**Common Culprits:**
- Infinite loops in agent logic.
- Sending high-res screenshots for text-only tasks.
- Stale caches not being deleted.
- Duplicate system instructions across multiple agents.
