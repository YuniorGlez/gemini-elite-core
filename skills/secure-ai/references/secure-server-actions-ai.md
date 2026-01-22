# Secure Server Actions for AI Integration (2026)

Next.js Server Actions are the secure bridge between the frontend and the AI backend.

## 1. Mandatory `server-only` Pattern

AI logic and API keys must never leak to the client bundle.

```typescript
import 'server-only';
import { auth } from '@/auth';

export async function processAiTask(data: any) {
  const session = await auth();
  if (!session) throw new Error("Unauthorized");
  // AI reasoning here...
}
```

## 2. Input Validation (Zod)

Never pass raw user input directly to an AI service.

```typescript
const InputSchema = z.object({
  prompt: z.string().max(500),
  contextId: z.string().uuid()
});

export async function secureAiAction(formData: FormData) {
  const validated = InputSchema.parse(Object.fromEntries(formData));
  // Safe execution...
}
```

## 3. Rate Limiting for Actions

AI tokens are expensive. Prevent "Denial of Wallet" attacks.
-   **Implementation**: Use Upstash Redis or a local bucket to rate-limit server actions per user/IP.

## 4. Secret Management

-   **Standard**: Use `process.env.OPENAI_API_KEY` mapping.
-   **Audit**: Use `gitleaks` in CI to ensure keys aren't committed to the repo.

## 5. Streaming Security

When streaming AI responses to the frontend:
-   **Scrubbing**: Use a server-side filter to scrub sensitive strings (e.g., internal IDs, passwords) from the stream before it reaches the client.

---
*Updated: January 22, 2026 - 20:45*
