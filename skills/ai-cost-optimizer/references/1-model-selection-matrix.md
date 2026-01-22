# Reference: Model Selection Matrix (Gemini 3 Family)

## Overview
Choosing the right model is the most important step in cost optimization. In 2026, the Squaads AI Core uses a "Lite-First" strategy.

---

## 📊 Comparison Table

| Model | Task Suitability | Relative Cost | Latency |
| :--- | :--- | :--- | :--- |
| **Gemini Flash-Lite** | Real-time validation, small edits, summarization. | 💰 | ⚡⚡⚡ |
| **Gemini 3 Flash** | Major feature implementation, complex extraction. | 💰💰 | ⚡⚡ |
| **Gemini 3 Pro** | Architecture mapping, legacy refactoring, deep debugging. | 💰💰💰💰 | ⚡ |

---

## 🛠️ The "Escalation" Pattern
Instead of hardcoding a model, use a router.

```typescript
async function smartGenerate(prompt) {
  // 1. Try with Lite first
  const liteResult = await generateWithLite(prompt);
  
  // 2. Validate the result (Self-Correction)
  if (isInvalid(liteResult)) {
    // 3. Escalate to Pro if Lite fails
    return await generateWithPro(prompt);
  }
  
  return liteResult;
}
```

---

## 🎞️ Multimodal Cost Strategy
For Video and Images, the cost depends on resolution.

- **Low Res (70 tokens):** Action recognition, general scene understanding.
- **High Res (280 tokens):** OCR, identifying specific small UI elements.

**Squaads Recommendation:** Always start with Low Res and only re-process "Interesting" frames in High Res.
