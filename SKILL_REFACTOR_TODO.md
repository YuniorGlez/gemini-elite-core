# SKILL_REFACTOR_TODO.md: Roadmap for Skill Excellence

## Priorities: High (Core Stack)

### 1. next16-expert (Refactor: Level 10)
- **Status**: COMPLETED (v1.2.0). 500+ lines across SKILL.md and references.
- **Tasks**:
    - [x] Research Next.js 16.1.1 specific changes vs 15.
    - [x] Add `references/proxy-deep-dive.md` with advanced routing and security.
    - [x] Add `references/unified-caching.md` for `@use cache` edge cases.
    - [x] Add examples for Parallel Routes and Intercepting Routes (Added to SKILL.md/Refs).
    - [x] Create `templates/api-route-standard.ts` (Integrated patterns into Refs).
- **Target**: 500+ lines total.

### 2. react-expert (Refactor: Level 10)
- **Status**: COMPLETED (v1.2.0). ~1000 lines across SKILL.md and 6 references.
- **Tasks**:
    - [x] Expand `SKILL.md` to include "Top 5 Performance Gains in React 19".
    - [x] Add comprehensive examples for `useActionState`, `useOptimistic`, and `use`.
    - [x] Refactor `references/1-waterfalls.md` to include real-world comparison: "Before (Waterfall) vs After (Parallel)".
    - [x] Add section on "Compiler (React Forget)" expectations and manual optimizations.
- **Target**: 600+ lines total across refs.

### 3. tailwind4-expert (Refactor: Level 9)
- **Status**: COMPLETED (v1.2.0). ~400+ lines across SKILL.md and 4 references.
- **Tasks**:
    - [x] Research Tailwind 4.0 `@theme` and `@utility` advanced usage.
    - [x] Add examples for "Native Variants" and "Custom Container Queries".
    - [x] Create a "Migration Guide" from Tailwind 3.x to 4.x as a reference file.
    - [x] Add a "Design System" template for `globals.css`.
- **Target**: 400+ lines.

### 4. supabase-expert (Refactor: Level 9)
- **Status**: COMPLETED (v1.2.0). ~500+ lines across SKILL.md and 4 references.
- **Tasks**:
    - [x] Add `references/rls-patterns.md` with 10+ common RLS policy templates.
    - [x] Add comprehensive "Auth Flow" diagram/steps for SSR.
    - [x] Add examples for "Realtime Subscriptions" in Next.js 16.
    - [x] Add "Common Pitfalls" (e.g., mixing server/client clients).
- **Target**: 500+ lines.

### 5. zustand-expert (Refactor: Level 8)
- **Status**: COMPLETED (v1.2.0). ~400+ lines across SKILL.md and 4 references.
- **Tasks**:
    - [x] Add examples for "Computed Properties" and "Middleware" (Persist, Immer).
    - [x] Add `references/testing-stores.md` using Vitest (Integrated in Middleware Ref).
    - [x] Add pattern for "Slices Pattern" for large stores.
- **Target**: 400+ lines.

### 6. prisma-expert (Refactor: Level 8)
- **Status**: Covers basic Prisma 7 config.
- **Tasks**:
    - [ ] Add `references/query-optimization.md` for indexes and raw queries.
    - [ ] Add examples for "TypedSQL" (Prisma 7 feature).
    - [ ] Add "Prisma in Edge Functions" configuration reference.
- **Target**: 400+ lines.

## Priorities: Medium (Tools & Utilities)

### 7. browser-use-expert
- **Tasks**: Add complex navigation examples (handling popups, shadow DOM, infinite scroll).
- [ ] Add `references/selectors-strategy.md`.

### 8. artifact-janitor
- **Tasks**: Add automated scripts for cleaning deep node_modules or specific build caches.
- [ ] Create `scripts/deep-clean.sh`.

### 9. docs-pro
- **Tasks**: Add "Style Guide" for documentation (Tone, structure, Markdown standards).

## Priorities: Low (Niche or Stable)
- **Archive-Searcher**: Add examples for grep/ripgrep complex regex.
- **TLDR-expert**: Add examples for token-efficient file summaries.

---
## Tracking
- **Total Skills to Refactor**: 42
- **Completed**: 0
- **Overall Quality Score**: 15% (Estimated)
