# 🚀 json-render-expert (v1.1.0)

## Executive Summary
`json-render` (by Vercel Labs) is the 2026 standard for **Guardrailed AI User Interfaces**. Unlike raw LLM generations that often hallucinate or break, `json-render` forces AI models to work within a strictly defined **Catalog** of components validated by **Zod**. It specializes in **JSONL Patch Streaming**, allowing React components to render incrementally as bits of data arrive, ensuring sub-300ms perceived latency.

---

## 📋 Table of Contents
1. [Core Architecture](#core-architecture)
2. [The Catalog (The Guardrail)](#the-catalog-the-guardrail)
3. [Next.js Integration](#nextjs-integration)
4. [Streaming Implementation (Native SDK)](#streaming-implementation-native-sdk)
5. [The "Do Not" List (Anti-Patterns)](#the-do-not-list-anti-patterns)
6. [Standard Production Patterns](#standard-production-patterns)
7. [Reference Library](#reference-library)

---

## 🏗 Core Architecture
`json-render` operates on a three-pillar system:
- **@json-render/core**: The engine that handles state, data binding, and JSONL patch application.
- **@json-render/react**: The renderer that maps JSON schema to React 19 components.
- **@json-render/codegen**: Tool for exporting AI-generated state into pure React code.

### The "State-to-UI" Loop
1. AI Model generates **JSONL Patches**.
2. `JSONRender` or `useUIStream` client accumulates patches into a **Virtual State**.
3. Components render dynamically based on the **Registry** whitelist.

---

## 🛡 The Catalog (The Guardrail)
The Catalog defines what the AI *can* build.

### Defining a Component
```typescript
import { z } from 'zod';

export const catalog = {
  components: {
    MetricCard: {
      schema: z.object({
        title: z.string(),
        value: z.number(),
      }),
      description: 'Display KPIs.',
    }
  }
};
```

---

## ⚡ Next.js Integration
Optimized for **Next.js 16+ App Router**.

**Server (app/api/render/route.ts):**
```typescript
import { GoogleGenAI } from "@google/genai";

export async function POST(req: Request) {
  const { prompt } = await req.json();
  const client = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

  const result = await client.models.generateContentStream({
    model: "models/gemini-3-flash-preview",
    contents: [{ role: "user", parts: [{ text: prompt }] }]
  });

  const stream = new ReadableStream({
    async start(controller) {
      for await (const chunk of result.stream) {
        if (chunk.text) controller.enqueue(new TextEncoder().encode(chunk.text));
      }
      controller.close();
    }
  });

  return new Response(stream);
}
```

---

## 🤖 Streaming Implementation (Native & Hook)
In 2026, we prefer the official **useUIStream** hook for robust parsing.

### Client-side Implementation
```tsx
'use client';

import { Renderer, JSONUIProvider, useUIStream } from '@json-render/react';
import { registry } from './registry';

export function AIInterface() {
  const { tree, isStreaming, send } = useUIStream({ api: '/api/render' });
  
  return (
    <JSONUIProvider registry={registry}>
      <Renderer 
        tree={tree} 
        registry={registry} 
        loading={isStreaming} 
      />
    </JSONUIProvider>
  );
}
```

---

## 🚫 The "Do Not List" (Anti-Patterns)

| Anti-Pattern | Why it fails in 2026 | Modern Alternative |
| :--- | :--- | :--- |
| **catalog prop in Provider** | Not supported in v0.2.0 | Pass `registry` to `JSONUIProvider` instead. |
| **Manual Stream Parsing** | Error-prone for partial JSON | Use **useUIStream** hook. |
| **Blocking Renders** | Poor UX | Use **JSONL Patch Streaming**. |
| **Mixing Logic** | Security risk | Use **Actions** for logic. |

---

## 🛠 Standard Production Patterns

### Pattern A: Multi-Turn UI Updates
Send the current `tree` back to the AI as context to request minimal patches.

### Pattern B: Registry Override
Override how a catalog component is rendered locally without changing the catalog.

### Pattern C: Native Visibility
Control UI based on external factors using the `VisibilityProvider` context.

---

## 📖 Reference Library
- [**API Reference**](./references/api-reference.md)
- [**Catalog Design**](./references/catalog-design.md)
- [**Next.js Optimization**](./references/nextjs-optimization.md)
- [**Streaming Patterns**](./references/streaming-patterns.md)

*Updated: January 22, 2026 - 19:55*