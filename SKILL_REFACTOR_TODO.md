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
- **Status**: COMPLETED (v1.2.0). ~500+ lines across SKILL.md and 4 references.
- **Tasks**:
    - [x] Add `references/query-optimization.md` for indexes and raw queries.
    - [x] Add examples for "TypedSQL" (Prisma 7 feature).
    - [x] Add "Prisma in Edge Functions" configuration reference.
- **Target**: 400+ lines.

### 7. auth-expert (Refactor: Level 10)
- **Status**: COMPLETED (v2.0.0). Edge-first, OIDC, and React 19 integration.
- **Tasks**:
    - [x] Implement Dual-Config Pattern for Edge compatibility.
    - [x] Add templates for `auth.ts`, `auth.config.ts`, and `middleware.ts`.
    - [x] Add references for Enterprise patterns and Billing integration.
- **Target**: 600+ lines.

### 8. ai-pro (Refactor: Level 10)
- **Status**: COMPLETED (v1.0.0). Asset generation suite for 2026.
- **Tasks**:
    - [x] Integrated GPT-5 Reasoning and o3 models.
    - [x] Added references for advanced prompting and model benchmarks.
- **Target**: 500+ lines.

### 9. api-pro (Refactor: Level 10)
- **Status**: COMPLETED (v1.0.0). Resilience and Contract-first APIs.
- **Tasks**:
    - [x] Added Zod contract validation and Circuit Breaker patterns.
    - [x] Integrated Stripe v13 auto-pagination and SDK features.
- **Target**: 500+ lines.

### 10. architect-pro (Refactor: Level 10)
- **Status**: COMPLETED (v1.0.0). Clean Architecture and Tactical DDD.
- **Tasks**:
    - [x] Defined 2026 production stack folder structure.
    - [x] Added references for Hexagonal Architecture and ADRs.
- **Target**: 600+ lines.

## Priorities: Medium (Tools & Utilities)

### 11. browser-use-expert
- **Status**: COMPLETED (v1.2.0). Derived from official documentation.
- **Tasks**:
    - [x] Integrated latest 2026 features (TypeScript SDK, Zod, Stealth).

### 12. artifact-janitor
- **Status**: COMPLETED (v1.1.0). ~400+ lines with safety protocols and deep-clean script.
- **Tasks**:
    - [x] Add automated scripts for cleaning deep node_modules or specific build caches.
    - [x] Create `scripts/deep-clean.sh`.

### 13. docs-pro
- **Status**: COMPLETED (v1.1.0). ~500+ lines with 2026 style guide and AI collaboration patterns.
- **Tasks**:
    - [x] Add "Style Guide" for documentation (Tone, structure, Markdown standards).

### 14. archive-searcher
- **Status**: COMPLETED (v2.0.0). Professional Git Forensics.
- **Tasks**:
    - [x] Integrated with Conductor track forensics.
    - [x] Added `scripts/deep-search.sh`.

### 15. gemini-sdk-expert
- **Status**: COMPLETED (v1.2.0). ~500+ lines with structured output, function calling, and context caching.
- **Tasks**:
    - [x] Integrate 2026 multimodal reasoning (Video/Audio).
    - [x] Add Context Caching implementation guide.

### 16. mcp-expert
- **Status**: COMPLETED (v1.4.0). ~500+ lines with MCP Apps, Server Dev, and Security.
- **Tasks**:
    - [x] Research 2025-11-25 MCP Spec.
    - [x] Add guides for MCP Apps and interactive UI.

## Priorities: Low (Niche or Stable)
- [ ] **TLDR-expert**: Add examples for token-efficient file summaries.

---
## Tracking
- **Total Skills to Refactor**: 42
- **Completed**: 13
- **Overall Quality Score**: 31% (Estimated)
