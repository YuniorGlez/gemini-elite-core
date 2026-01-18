---
name: react-expert
id: react-expert
version: 1.0.0
description: "Senior specialist in React 19 performance, optimization, and advanced patterns. Use when needing to optimize re-renders, bundle size, data fetching waterfalls, or server-side performance (RSC)."
---

# ⚡ Skill: react-expert

## Description
This skill provides comprehensive performance optimization guidance for React applications, optimized for AI-assisted workflows. It focuses on eliminating waterfalls, reducing bundle size, and maximizing both server and client-side efficiency.

## Core Priorities
1. **Eliminating Waterfalls**: The #1 priority for performance. Move fetches as high as possible and parallelize independent operations.
2. **Bundle Size**: Direct imports over barrel files, lazy loading, and intentional preloading.
3. **Rendering Efficiency**: Minimal re-renders through stable callbacks, functional updates, and strategic component extraction.

## Table of Contents & Detailed Guides

### 1. [Eliminating Waterfalls](./references/1-waterfalls.md) — **CRITICAL**
- Defer Await Until Needed
- Dependency-Based Parallelization (`better-all`)
- Preventing Waterfall Chains in API Routes
- `Promise.all()` for Independent Operations
- Strategic Suspense Boundaries

### 2. [Bundle Size Optimization](./references/2-bundle-optimization.md) — **CRITICAL**
- Avoiding Barrel File Imports (Lucide, MUI, etc.)
- Conditional Module Loading
- Deferring Non-Critical Libraries (Analytics)
- Dynamic Imports (`React.lazy`)
- Preloading based on User Intent

### 3. [Server-Side Performance](./references/3-server-side.md) — **HIGH**
- Cross-Request LRU Caching
- Minimizing Serialization at RSC Boundaries
- Parallel Data Fetching with Component Composition
- Per-Request Deduplication (`React.cache`)
- Non-Blocking Operations for Side Effects

### 4. [Client-Side & Data Fetching](./references/4-5-fetching-and-rerender.md) — **MEDIUM-HIGH**
- Deduplicating Global Event Listeners
- SWR for Automatic Deduplication

### 5. [Re-render Optimization](./references/4-5-fetching-and-rerender.md) — **MEDIUM**
- Deferring State Reads
- Memoized Components
- Narrowing Effect Dependencies
- Functional `setState` Updates
- Lazy State Initialization
- Transitions for Non-Urgent Updates (`startTransition`)

### 6. [Rendering Performance](./references/6-7-8-rendering-and-js.md) — **MEDIUM**
- SVG Wrapper Animations
- CSS `content-visibility`
- Hoisting Static JSX
- Hydration Mismatch Prevention (No-Flicker)
- `<Activity>` Component
- Explicit Conditional Rendering

### 7. [JavaScript Micro-Optimizations](./references/6-7-8-rendering-and-js.md) — **LOW-MEDIUM**
- Batching DOM Changes
- Index Maps vs `.find()`
- Caching Storage API Reads (`localStorage`, cookies)
- Combining Array Iterations
- `toSorted()` vs `sort()`

### 8. [Advanced Patterns](./references/6-7-8-rendering-and-js.md) — **LOW**
- Event Handlers in Refs / `useEffectEvent`
- `useLatest` for Stable Callback Refs

## Quick Reference: The "Do's" and "Don'ts"

| **Don't** | **Do** |
| :--- | :--- |
| `import { Icon } from 'large-lib'` | `import Icon from 'large-lib/Icon'` |
| `await a(); await b();` | `Promise.all([a(), b()])` |
| `const [s, setS] = useState(init())` | `useState(() => init())` |
| `useEffect(() => ..., [obj])` | `useEffect(() => ..., [obj.id])` |
| `array.sort()` | `array.toSorted()` |
| `searchParams` in component body | `searchParams` only in callbacks |

---
*Optimized for React 19.2+ and Next.js 16+.*
