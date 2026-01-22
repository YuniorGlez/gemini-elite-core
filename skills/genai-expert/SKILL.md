# Skill: GenAI Expert (Standard 2026)

**Role:** The GenAI Expert is the architect of "Structured Intelligence" within the Squaads AI Core. This role masters the `@google/genai` SDK v1.x to integrate Gemini 3 into production workflows. In 2026, the focus has shifted from simple chat prompts to "Controlled Generation," complex multimodal analysis, and high-efficiency context caching.

## 🎯 Primary Objectives
1.  **Structured Output Mastery:** Ensuring 100% reliable JSON responses using Controlled Generation (v1.x SDK).
2.  **Multimodal Orchestration:** Integrating Video, Audio, and Image analysis into reasoning loops.
3.  **Context Optimization:** Utilizing Context Caching to handle 1M+ token codebases with low latency and cost.
4.  **System Instruction Design:** Crafting immutable "Persona" layers that prevent jailbreaking and hallucination.
5.  **Gemini 3 Defaulting:** Prioritize `gemini-3-flash-preview` for agentic and streaming UI tasks.

---

## 🏗️ The 2026 SDK Toolbelt (v1.x)

### 1. Core Models
- **Gemini 3 Flash Preview:** The current Squaads standard for high-speed streaming and UI generation (`models/gemini-3-flash-preview`).
- **Gemini Flash Lite Latest:** The cost-effective high-speed model for simple extractions.

### 2. Key SDK Features (v1.x Patterns)
- **Controlled Generation:** Using `responseSchema` with the client-based API.
- **Streaming Async Iteration:** Proper handling of `response.stream` for real-time outputs.
- **Function Calling:** Connecting Gemini to local project tools via the `tools` property.

---

## 🛠️ Implementation Patterns

### 1. Controlled JSON Output (The 2026 Way)
No more "Please return only JSON" prompts. Use the native `responseSchema` with the v1.x SDK.

```typescript
import { GoogleGenAI } from "@google/genai";

const client = new GoogleGenAI({ apiKey });

const schema = {
  type: "OBJECT",
  properties: {
    name: { type: "STRING" },
    score: { type: "NUMBER" },
  },
  required: ["name", "score"],
};

const response = await client.models.generateContent({
  model: "models/gemini-3-flash-preview",
  contents: [{ role: "user", parts: [{ text: "Extract user data..." }] }],
  config: {
    responseMimeType: "application/json",
    responseSchema: schema,
  },
});
```

### 2. Reliable Streaming (Lessons Learned)
Always iterate over the `.stream` property and access `.text` as a property.

```typescript
const response = await client.models.generateContentStream({
  model: "models/gemini-3-flash-preview",
  contents: [...]
});

// Correct pattern for v1.x
for await (const chunk of response.stream) {
  const text = chunk.text; // Property, NOT a function chunk.text()
  if (text) process.stdout.write(text);
}
```

### 3. Context Caching for Large Repos
Reducing costs and latency for recurring codebase analysis.

```typescript
// 2026 Pattern: Caching a large repo context
const cache = await client.caches.create({
  model: "models/gemini-flash-lite-latest",
  contents: [
    { role: "user", parts: [{ text: codebaseIngest }] }
  ],
  ttlSeconds: 3600,
});
```

---

## 🚫 The "Do Not List" (Anti-Patterns)
1.  **NEVER** use `getGenerativeModel()` - This is legacy syntax from `@google/generative-ai`.
2.  **NEVER** use `chunk.text()` - In v1.x it throws a TypeError as it is a getter.
3.  **NEVER** iterate over the response object directly - Use `response.stream`.
4.  **NEVER** expose the raw `GOOGLE_API_KEY` to the client-side.

---

## 🛠️ Troubleshooting & Latency Optimization

| Issue | Likely Cause | 2026 Corrective Action |
| :--- | :--- | :--- |
| **TypeError: ... iterator** | Iterating over response object | Use `for await (const chunk of response.stream)`. |
| **TypeError: text is not a function** | Calling `chunk.text()` | Use the property `chunk.text`. |
| **High Token Costs** | Redundant context sent | Implement Context Caching for data over 32k tokens. |
| **Streaming Lag** | Buffering in middleware | Ensure no buffering in Next.js or proxies. |

---

## 🏁 Quality Metrics
- **Schema Adherence:** 100% (Native SDK enforcement).
- **Latency (Gemini 3 Flash):** < 300ms perceived with JSONL Patching.
- **Efficiency:** Use Gemini 3 for UI and 1.5 Pro for complex logic.

---

*Updated: January 22, 2026 - 23:25*
