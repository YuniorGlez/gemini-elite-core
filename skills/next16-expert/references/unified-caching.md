# Unified Caching & `@use cache` (Next.js 16)

Next.js 16 shifts from "Implicit Caching" to "Explicit Orchestration." Caching is now an opt-in behavior using the `use cache` directive.

## The `use cache` Directive

Conceptually similar to `use client`, this directive tells the Next.js compiler that a function's result should be cached across requests.

### Basic Usage

```tsx
// src/services/github.ts
export async function getRepoStars(owner: string, repo: string) {
  'use cache';
  const res = await fetch(`https://api.github.com/repos/${owner}/${repo}`);
  const data = await res.json();
  return data.stargazers_count;
}
```

## Cache Lifetimes & Tags

In Next.js 16, revalidation is managed through granular APIs.

```typescript
import { cacheLife, cacheTag } from 'next/cache';

export async function getProduct(id: string) {
  'use cache';
  
  // Set a 1-hour expiration for this specific cache entry
  cacheLife(3600); 
  
  // Add tags for manual invalidation
  cacheTag(`product-${id}`, 'catalog');

  return db.product.findUnique({ where: { id } });
}
```

## Partial Pre-rendering (PPR)

PPR allows a single route to have both static and dynamic segments without complex configuration.

```tsx
// app/dashboard/page.tsx
import { Suspense } from 'react';
import { StaticNav } from '@/components/nav';
import { DynamicStats } from '@/components/stats';

export default function Page() {
  return (
    <main>
      {/* This part is pre-rendered at build time */}
      <StaticNav />
      
      {/* This part is streamed at request time */}
      <Suspense fallback={<StatsSkeleton />}>
        <DynamicStats />
      </Suspense>
    </main>
  );
}
```

## The "Unified" Invalidation Strategy

Next.js 16 introduces `updateTag()`, which is more efficient than `revalidateTag()`.

| Method | Behavior |
| :--- | :--- |
| `revalidateTag(tag)` | Immediately purges the cache entry. |
| `updateTag(tag)` | Marks as stale and triggers a background revalidation on the next request (SWR). |
| `revalidatePath(path)` | Purges all cache entries for a specific URL. |

## Best Practices

1. **Granular Functions**: Apply `use cache` to small, specific data-fetching functions rather than entire components if possible.
2. **Deterministic Inputs**: Ensure functions marked with `use cache` are deterministic (the same inputs always produce the same cached output).
3. **Avoid Side Effects**: Functions with `use cache` should not perform mutations or write to databases.
4. **Hydration Guard**: When using highly cached components, ensure they don't depend on client-side state during the initial RSC render.
