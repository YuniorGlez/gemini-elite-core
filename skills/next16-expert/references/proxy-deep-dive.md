# Proxy & Network Orchestration (`proxy.ts`)

In Next.js 16, `middleware.ts` is officially deprecated in favor of `proxy.ts`. This file acts as the universal entry point for all network traffic, providing a unified layer for routing, security, and request decoration.

## Core Concepts

- **Runtime**: Runs on the Node.js runtime by default but is designed for Edge compatibility.
- **Placement**: Must reside at the root of the `app/` directory or `src/app/`.
- **Scope**: Intercepts every incoming request before it reaches the App Router or API routes.

## Basic Implementation

```typescript
// src/app/proxy.ts
import { nextProxy } from 'next/server';

export default nextProxy(async (request) => {
  const url = request.nextUrl;

  // 1. Global Redirects
  if (url.pathname === '/legacy-path') {
    return Response.redirect(new URL('/new-standard', request.url));
  }

  // 2. Request Decoration (Elite Standard)
  request.headers.set('X-Elite-Trace-Id', crypto.randomUUID());

  // 3. Execution
  const response = await fetch(request);

  // 4. Response Modification
  response.headers.set('Server', 'Elite-Engine-16');
  
  return response;
});
```

## Advanced Routing & Sharding

`proxy.ts` is the ideal place for A/B testing and tenant-based routing.

```typescript
export default nextProxy(async (request) => {
  const host = request.headers.get('host');
  const isBetaUser = request.cookies.get('beta_access')?.value === 'true';

  if (isBetaUser && !request.nextUrl.pathname.startsWith('/beta')) {
    return Response.rewrite(new URL(`/beta${request.nextUrl.pathname}`, request.url));
  }

  return fetch(request);
});
```

## Security & Rate Limiting

Unlike middleware, `proxy.ts` has full access to the Node.js environment, allowing for more robust security checks.

```typescript
import { verifyJWS } from '@/lib/auth/jws';

export default nextProxy(async (request) => {
  // IP-based Rate Limiting (Conceptual)
  const ip = request.headers.get('x-forwarded-for') ?? '127.0.0.1';
  if (await isRateLimited(ip)) {
    return new Response('Too Many Requests', { status: 429 });
  }

  // JWT Verification at the Gate
  const token = request.cookies.get('session')?.value;
  if (request.nextUrl.pathname.startsWith('/admin')) {
    const isValid = await verifyJWS(token);
    if (!isValid) {
      return Response.redirect(new URL('/login', request.url));
    }
  }

  return fetch(request);
});
```

## Critical Warnings

1. **Caching**: `fetch` options like `revalidate` or `cache: 'no-store'` are **ignored** inside `proxy.ts`. It is a transparent pass-through.
2. **Infinite Loops**: Always ensure your redirects/rewrites don't point back to the same proxy logic without a break condition.
3. **Performance**: Keep logic inside `proxy.ts` extremely lean (< 50ms) to avoid impacting TTFB (Time to First Byte).
