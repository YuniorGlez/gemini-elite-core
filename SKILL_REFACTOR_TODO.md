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

### 17. commit-sentinel
- **Status**: COMPLETED (v2.1.0). ~500+ lines with Git 3.0 readiness, rebasing, and bisecting.
- **Tasks**:
    - [x] Research Git 3.0 (SHA-256/Rust).
    - [x] Add guides for advanced rebasing and forensics.

### 18. db-enforcer
- **Status**: COMPLETED (v2.1.0). ~500+ lines with PostgreSQL 18, Prisma 7, and RLS.
- **Tasks**:
    - [x] Research PostgreSQL 18 features (UUIDv7, Virtual Columns).
    - [x] Add guides for migration safety and TypedSQL.

### 19. debug-master
- **Status**: COMPLETED (v1.1.0). ~500+ lines with distributed tracing (OTel) and agentic response.
- **Tasks**:
    - [x] Research 2026 SRE patterns and predictive observability.
    - [x] Add guides for OTel and autonomous incident remediation.

### 20. expert-instruction
- **Status**: COMPLETED (v1.1.0). ~500+ lines with EGI framework, memory systems, and context engineering.
- **Tasks**:
    - [x] Research 2026 agentic instruction protocols (A2A, ACP).
    - [x] Add guides for cognitive architectures and tiered memory.

### 21. git-flow
- **Status**: COMPLETED (v1.1.0). ~500+ lines with TBD, Stacked Changes, and 2026 strategies.
- **Tasks**:
    - [x] Research Trunk-Based Development best practices.
    - [x] Add guides for Graphite and stacked PRs.

### 22. git-automation (git-pro)
- **Status**: COMPLETED (v2.1.0). ~500+ lines with GitHub Actions 2026 and Git internals.
- **Tasks**:
    - [x] Research GitHub Actions reusable workflows and OIDC.
    - [x] Add automation toolkit and internals guide.

### 23. code-architect
- **Status**: COMPLETED (v1.1.0). ~500+ lines with AX (Agent Experience) and Modular Monoliths.
- **Tasks**:
    - [x] Research 2026 AX standards and AI-native design.
    - [x] Add guides for modern modular monoliths and edge orchestration.

### 24. auditor-pro
- **Status**: COMPLETED (v1.1.0). ~500+ lines with CTEM and Agentic Security.
- **Tasks**:
    - [x] Research 2026 security trends (CTEM, NHI).
    - [x] Add guides for agentic security orchestration and forensics.

### 25. strict-auditor
- **Status**: COMPLETED (v2.1.0). ~500+ lines with Verification Gap and AI code standards.
- **Tasks**:
    - [x] Define "Verification Gap" resolution strategy.
    - [x] Add quality gate metrics and AI coding standards.

### 26. ui-ux-pro
- **Status**: COMPLETED (v1.1.0). ~500+ lines with Bento Grid and AI adaptive layouts.
- **Tasks**:
    - [x] Research 2026 design trends (Bento, Glassmorphism v3).
    - [x] Add guides for AI-driven interfaces.

### 27. ui-ux-specialist
- **Status**: COMPLETED (v1.1.0). ~500+ lines with WCAG 2.2 and inclusive patterns.
- **Tasks**:
    - [x] Research WCAG 2.2 Level AA success criteria.
    - [x] Add guides for semantic HTML and inclusive design.

### 28. mobile-pro
- **Status**: COMPLETED (v1.1.0). ~500+ lines with Expo SDK 54, Fabric, and Worklets.
- **Tasks**:
    - [x] Research Expo SDK 54 and iOS 26 Liquid Glass support.
    - [x] Add guides for Reanimated 4 and React Native New Architecture.

### 29. product-pro
- **Status**: COMPLETED (v1.1.0). ~500+ lines with Probabilistic Strategy and Agentic Prototyping.
- **Tasks**:
    - [x] Research 2026 AI product trends.
    - [x] Add guides for rapid prototyping and context engineering for PMs.

### 30. seo-pro
- **Status**: COMPLETED (v1.1.0). ~500+ lines with SGE optimization and E-E-A-T.
- **Tasks**:
    - [x] Research Google SGE and AI Overviews.
    - [x] Add guides for authoritative content and entity SEO.

### 31. secure-ai
- **Status**: COMPLETED (v1.1.0). ~500+ lines with Prompt Injection defense and Zero-Trust agents.
- **Tasks**:
    - [x] Research 2026 AI security standards.
    - [x] Add guides for prompt boundaries and agent sandboxing.

### 32. prompt-pro
- **Status**: COMPLETED (v1.1.0). ~500+ lines with Reasoning model optimization (o3) and ToT.
- **Tasks**:
    - [x] Research OpenAI o3 and Gemini 3 Pro reasoning patterns.
    - [x] Add guides for Tree-of-Thoughts and ReAct loops.

### 33. manus-expert
- **Status**: COMPLETED (v1.2.0). ~500+ lines with Mission Lifecycle and RSA Security.
- **Tasks**:
    - [x] Research Manus API v2 features.
    - [x] Add guides for secure connectors and mission recovery.

### 34. stagehand-expert
- **Status**: COMPLETED (v4.1.0). ~500+ lines with Direct CDP and Agent Caching.
- **Tasks**:
- [x] Research Stagehand V3 CDP communication.
- [x] Add guides for decision caching and shadow DOM mastery.

+### 35. track-master
+- **Status**: COMPLETED (v1.1.0). ~500+ lines with Predictive Tracking and Conductor Architecture.
+- **Tasks**:
+    - [x] Research AI-native project tracking.
+    - [x] Add guides for risk metrics and agentic milestones.
+
+### 36. context-distiller
+- **Status**: COMPLETED (v1.1.0). ~500+ lines with Automated Context Packing and Symbol Indexing.
+- **Tasks**:
+    - [x] Research Repomix and gitingest optimization.
+    - [x] Add guides for symbolic project mapping and memory rehydration.
+
 ### 37. hydration-guardian
 - **Status**: COMPLETED (v1.1.0). ~500+ lines with Sensory Validation and Pausable Composition.
 - **Tasks**:
     - [x] Research React 19.3 Hydration Sensory Validation.
     - [x] Add guides for Pausable Composition and @use cache patterns.
 
 ### 38. vercel-sync
- **Status**: COMPLETED (v1.1.0). ~500+ lines with Bun-Vercel orchestration and OIDC.
- **Tasks**:
    - [x] Research Bun-Vercel native integration 2026.
    - [x] Add guides for Zero-Secret OIDC deployments and Edge orchestration.

## Priorities: Low (Niche or Stable)
 
 - [ ] **TLDR-expert**: Add examples for token-efficient file summaries.
 
 ---
 ## Tracking
 - **Total Skills to Refactor**: 41
 - **Completed**: 38
 - **Overall Quality Score**: 83% (Estimated)
 