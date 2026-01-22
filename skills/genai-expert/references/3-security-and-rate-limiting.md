# Reference: Security & Rate Limiting (AI Production)

## Overview
Deploying AI in 2026 requires strict "Safety Boundaries" to prevent prompt injection and cost overruns.

---

## 🔒 1. Safety Settings
The Google GenAI SDK allows you to configure thresholds for specific categories of harmful content.

```typescript
const { HarmBlockThreshold, HarmCategory } = require("@google/generative-ai");

const safetySettings = [
  {
    category: HarmCategory.HARM_CATEGORY_HARASSMENT,
    threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
  },
  {
    category: HarmCategory.HARM_CATEGORY_HATE_SPEECH,
    threshold: HarmBlockThreshold.BLOCK_ONLY_HIGH,
  },
];
```

---

## 🚦 2. Rate Limiting & Quotas
- **Flash vs Pro:** Pro has tighter rate limits (RPM). Use Flash for high-frequency user interactions.
- **Circuit Breakers:** Implement a circuit breaker in your Node.js proxy to fail gracefully when the AI quota is hit.

---

## 🔑 3. Key Management
- **Google Cloud Vertex AI:** For production, prefer the **Vertex AI SDK** over the `GenerativeAI` SDK as it uses IAM roles instead of API keys.
- **Environment Isolation:** Use separate API keys for `development`, `staging`, and `production`.

---

## 🛡️ 4. Prompt Injection Defense
- **System Instructions:** Use the `systemInstruction` field to define the model's core constraints. This is harder to override than a standard user message.
- **Output Sanitization:** Always validate the AI's JSON output against a Zod schema before executing any database commands based on it.

---

## 🏁 Security Audit Checklist
- [ ] Is the API key hidden from the frontend?
- [ ] Are safety filters set to `BLOCK_MEDIUM_AND_ABOVE`?
- [ ] Is there a retry logic with exponential backoff for `429 Too Many Requests`?
- [ ] Are user-provided images/files sanitized before being sent to the AI?
