---
name: genai-expert
id: genai-expert
version: 1.1.0
description: "Senior SDK Master for @google/genai v1.35.0+, expert in Controlled Outputs, Multimodal Context, and Structured Intelligence."
last_updated: "2026-01-22"
---

# Skill: GenAI Expert (Standard 2026)

**Role:** The GenAI Expert is the architect of "Structured Intelligence" within the Squaads AI Core. This role masters the `@google/genai` SDK to integrate Gemini 1.5 Pro and Flash models into production workflows. In 2026, the focus has shifted from simple chat prompts to "Controlled Generation," complex multimodal analysis, and high-efficiency context caching.

## 🎯 Primary Objectives
1.  **Structured Output Mastery:** Ensuring 100% reliable JSON responses using Controlled Generation (v1.35.0+).
2.  **Multimodal Orchestration:** Integrating Video, Audio, and Image analysis into reasoning loops.
3.  **Context Optimization:** Utilizing Context Caching to handle 1M+ token codebases with low latency and cost.
4.  **System Instruction Design:** Crafting immutable "Persona" layers that prevent jailbreaking and hallucination.

---

## 🏗️ The 2026 SDK Toolbelt

### 1. Core Models
- **Gemini 1.5 Pro:** The reasoning engine for complex coding and logic tasks.
- **Gemini 1.5 Flash:** The high-speed agent for real-time extraction and summarization.

### 2. Key SDK Features
- **Controlled Generation:** Forcing the model to follow a Zod or JSON schema.
- **System Instructions:** Defining the model's core logic at the engine level.
- **Function Calling:** Seamlessly connecting AI to local project tools and APIs.

---

## 🛠️ Implementation Patterns

### 1. Controlled JSON Output (The 2026 Way)
No more "Please return only JSON" prompts. Use the native `responseSchema`.

```typescript
import { GoogleGenerativeAI, SchemaType } from "@google/generative-ai";

const schema = {
  description: "User profile extraction",
  type: SchemaType.OBJECT,
  properties: {
    name: { type: SchemaType.STRING },
    score: { type: SchemaType.NUMBER },
  },
  required: ["name", "score"],
};

const model = genAI.getGenerativeModel({
  model: "gemini-1.5-pro",
  generationConfig: {
    responseMimeType: "application/json",
    responseSchema: schema,
  },
});
```

### 2. Context Caching for Large Repos
Reducing costs and latency for recurring codebase analysis.

```typescript
// 2026 Pattern: Caching a large repo context
const cache = await cacheManager.create({
  model: "models/gemini-1.5-pro-002",
  contents: [
    { role: "user", parts: [{ text: codebaseIngest }] }
  ],
  ttlSeconds: 3600,
});
```

### 3. Multimodal Video Extraction
```typescript
const result = await model.generateContent([
  { fileData: { mimeType: "video/mp4", fileUri: videoUri } },
  { text: "List every scene where a user clicks a button." },
]);
```

---

## 🚫 The "Do Not List" (Anti-Patterns)
1.  **NEVER** use regex to parse AI output if `responseSchema` can be used.
2.  **NEVER** expose the raw `GOOGLE_API_KEY` to the client-side. Always use a Node.js/Bun proxy.
3.  **NEVER** use Gemini 1.5 Pro for simple tasks where Flash would suffice (Cost & Latency optimization).
4.  **NEVER** ignore "Safety Settings." In 2026, we default to `BLOCK_MEDIUM_AND_ABOVE` for all production code.

---

## 🛠️ Troubleshooting & Latency Optimization

| Issue | Likely Cause | 2026 Corrective Action |
| :--- | :--- | :--- |
| **Hallucinated JSON** | Missing `responseSchema` | Implement strict schema-based generation config. |
| **High Token Costs** | Redundant context sent every time | Implement Context Caching for data over 32k tokens. |
| **Safety Blockage** | Prompt contains ambiguous terms | Use "System Instructions" to pre-sanitize the model's intent. |
| **Streaming Lag** | Model overhead (Pro) | Switch to Flash or use `generateContentStream` for better UX. |

---

## 📚 Reference Library
- **[Structured Intelligence](./references/1-structured-intelligence.md):** Deep dive into JSON schemas and enums.
- **[Multimodal Orchestration](./references/2-multimodal-orchestration.md):** Working with Audio, Video, and Files.
- **[Security & Rate Limiting](./references/3-security-and-rate-limiting.md):** Production-grade AI scaling.

---

## 📊 Quality Metrics
- **Schema Adherence:** 100% (Native SDK enforcement).
- **Latency (Flash):** < 1s for standard extractions.
- **Context Hit Rate:** > 90% (Using caching effectively).

---

## 🔄 Evolution from v0.x to v1.35.0
- **v0.1:** Basic text generation.
- **v1.0:** Introduction of Gemini 1.5 Pro and 1M context.
- **v1.20:** Context Caching and improved Function Calling.
- **v1.35.0:** Stable Controlled Generation and native Pydantic/Zod schema mapping.

---

**End of GenAI Expert Standard (v1.1.0)**
