---
name: next16-expert
id: next16-expert
version: 1.1.0
description: "Senior specialist in Next.js 16.1.1, React 19.2, and Gemini Elite Standards."
---

# ⚡ Skill: next16-expert

## Description
Senior specialist in the Next.js 16.1.1 and React 19.2 ecosystem, focused on the Proxy & Cache paradigm, Bun optimization, and Gemini Elite standards for high-performance applications.

## Architecture Guidelines (Next.js 16)

### 1. The Proxy Revolution (`proxy.ts`)
The `middleware.ts` file is considered legacy. Global network logic must reside in `proxy.ts`.
- **Runtime**: Node.js by default (edge-optimizable).
- **Usage**: Explicit routing, global request decoration, and security.

```typescript
// app/proxy.ts
import { nextProxy } from 'next/server';

export default nextProxy(async (request) => {
  if (request.nextUrl.pathname === '/old-path') {
    return Response.redirect(new URL('/new-path', request.url));
  }
  const response = await fetch(request);
  response.headers.set('X-Elite-Power', 'Level-Olympus');
  return response;
});
```

### 2. Unified Caching with `'use cache'`
Replace the complexity of manual revalidations with the stable `'use cache'` directive.
- Automatic caching of results between requests.
- Absolute simplicity in data fetching.

```tsx
// src/services/ai.ts
export async function getModelStatus() {
  'use cache';
  const res = await fetch('https://api.manus.im/status');
  return res.json();
}
```

## Gemini Elite Best Practices

### 1. Data Fetching & Mutations
- **Server-First**: Prioritize React Server Components (RSC) for 80% of the application.
- **Server Actions**: Mandatory for all mutations (POST/PATCH/DELETE).
- **Security**: Use `import 'server-only'` in DB services or private APIs.

### 2. Component Design
- **Single Responsibility**: Keep files under 300 lines.
- **Client Components**: Only for complex interactivity (forms with local state, charts).
- **Hydration Guard**:
  ```tsx
  const [mounted, setMounted] = useState(false);
  useEffect(() => setMounted(true), []);
  if (!mounted) return null;
  ```

### 3. Performance & Deployment
- **Assets**: Strict use of `next/image` and `next/font`.
- **Bun on Vercel**: Ensure `"bunVersion": "1.x"` in `vercel.json` and use `bun.lockb`.
- **Optimization**: Use `dynamic()` for heavy components outside the initial render.
- **Advanced React Patterns**: For deep optimizations (waterfalls, bundle size, re-renders), refer to the `react-expert` skill.

## The 'Do Not' List
- **DO NOT** use `middleware.ts`.
- **DO NOT** use `revalidatePath` for simple changes; use Server Actions with `updateTag`.
- **DO NOT** access cookies in RSC without Suspense if the proxy hasn't stabilized the session.
