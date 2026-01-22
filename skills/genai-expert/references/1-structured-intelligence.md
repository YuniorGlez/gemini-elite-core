# Reference: Structured Intelligence (Controlled Generation)

## Overview
The most critical feature of the `@google/genai` SDK in 2026 is **Controlled Generation**. This guarantees that the AI output follows a specific machine-readable structure.

---

## 🛠️ 1. Defining the Schema
You can define schemas using the `SchemaType` enum. The Squaads standard is to use **Typed Objects**.

```typescript
const schema = {
  type: SchemaType.OBJECT,
  properties: {
    intent: { 
      type: SchemaType.STRING, 
      enum: ["CREATE", "UPDATE", "DELETE", "QUERY"] 
    },
    confidence: { type: SchemaType.NUMBER },
    data: { type: SchemaType.OBJECT }
  },
  required: ["intent", "confidence"]
};
```

---

## 🚀 2. The "Zod-to-Gemini" Bridge
Since Squaads uses TypeScript, we often map Zod schemas to Gemini schemas for type safety.

```typescript
import { z } from "zod";
import { zodToJsonSchema } from "zod-to-json-schema";

const userSchema = z.object({
  id: z.string().uuid(),
  bio: z.string().max(500),
});

const model = genAI.getGenerativeModel({
  model: "gemini-3-flash-preview",
  generationConfig: {
    responseMimeType: "application/json",
    responseSchema: zodToJsonSchema(userSchema) as any,
  },
});
```

---

## 📈 3. Handling Enums & Constraints
Enums in Gemini are perfect for routing logic.

**Example Use Case:**
Extracting ticket priority from a support email.
```typescript
const prioritySchema = {
  type: SchemaType.STRING,
  enum: ["P0 - CRITICAL", "P1 - HIGH", "P2 - MEDIUM", "P3 - LOW"]
};
```

---

## 🏁 Benefits of Structured Intelligence
1.  **No More Parsing Hacks:** No `JSON.parse(result.replace('```json', ''))`.
2.  **Validation at the Source:** If the model can't fit the data into the schema, it returns an error rather than broken JSON.
3.  **Efficiency:** Models actually use fewer tokens when constrained to a schema.

---

*Updated: January 22, 2026 - 23:25*
