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
- **Status**: Table of contents only. No inline examples in main SKILL.md.
- **Tasks**:
    - [ ] Expand `SKILL.md` to include "Top 5 Performance Gains in React 19".
    - [ ] Add comprehensive examples for `useActionState`, `useOptimistic`, and `use`.
    - [ ] Refactor `references/1-waterfalls.md` to include real-world comparison: "Before (Waterfall) vs After (Parallel)".
    - [ ] Add section on "Compiler (React Forget)" expectations and manual optimizations.
- **Target**: 600+ lines total across refs.

### 3. tailwind4-expert (Refactor: Level 9)
- **Status**: Brief overview.
- **Tasks**:
    - [ ] Research Tailwind 4.0 `@theme` and `@utility` advanced usage.
    - [ ] Add examples for "Native Variants" and "Custom Container Queries".
    - [ ] Create a "Migration Guide" from Tailwind 3.x to 4.x as a reference file.
    - [ ] Add a "Design System" template for `globals.css`.
- **Target**: 400+ lines.

### 4. supabase-expert (Refactor: Level 9)
- **Status**: Brief overview of clients.
- **Tasks**:
    - [ ] Add `references/rls-patterns.md` with 10+ common RLS policy templates.
    - [ ] Add comprehensive "Auth Flow" diagram/steps for SSR.
    - [ ] Add examples for "Realtime Subscriptions" in Next.js 16.
    - [ ] Add "Common Pitfalls" (e.g., mixing server/client clients).
- **Target**: 500+ lines.

### 5. zustand-expert (Refactor: Level 8)
- **Status**: Covers basic SSR provider.
- **Tasks**:
    - [ ] Add examples for "Computed Properties" and "Middleware" (Persist, Immer).
    - [ ] Add `references/testing-stores.md` using Vitest.
    - [ ] Add pattern for "Slices Pattern" for large stores.
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
