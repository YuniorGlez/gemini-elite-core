---
name: gemini-sdk-expert
id: gemini-sdk-expert
version: 1.1.0
description: "\"Senior SDK Master for @google/genai v1.35.0, expert in Controlled Outputs and Structured Intelligence."
---

# 🤖 Skill: gemini-sdk-expert

## Description
Senior master in the Google Gemini SDK, specialized in the integration of advanced language models to produce structured intelligence. Expert in JSON Schema design for `Controlled Outputs`, token optimization, and multimodal flow handling.

## Core Standard: Structured Output
In Gemini Elite, we never rely on manual text parsing with regex. We force the structure from the source.

### Implementation Blueprint (`responseSchema`)
It is mandatory to define the response schema for any operation that requires actionable data.

```typescript
import { GoogleGenerativeAI, Type } from "@google/genai";

const schema = {
  type: Type.OBJECT,
  properties: {
    status: { type: Type.STRING, enum: ["SUCCESS", "FAILED", "RETRY"] },
    confidence: { type: Type.NUMBER },
    analysis: { type: Type.STRING }
  },
  required: ["status", "confidence", "analysis"]
};

const result = await model.generateContent({
  contents: [{ role: 'user', parts: [{ text: "Analyze this report..." }] }],
  generationConfig: {
    responseMimeType: "application/json",
    responseSchema: schema
  }
});
```

## Protocol & Safety
- **Library Selection**: Exclusively use `@google/genai`. The old library `@google/generative-ai` is considered obsolete.
- **MIME Enforcement**: If a `responseSchema` is defined, the `responseMimeType` must be strictly `"application/json"`.
- **Image Optimization**: Reduce images to less than 2MB before sending them to Flash models to avoid quota errors or timeouts.

## The 'Do Not' List
- **DO NOT** allow plain text responses if the system must process the data later.
- **DO NOT** include API keys directly in the code; use secure environment variables.
- **DO NOT** use heavy models (Pro) for simple tasks that the Flash model can solve with a good schema.
- **DO NOT** forget to handle `FINISH_REASON` cases (e.g., SAFETY) to provide feedback to the user.
