# Reference: Advanced Context Caching (2026)

## Overview
Context Caching is the technology that allows us to "Read a book once" and then ask questions about it multiple times without paying for the reading phase again.

---

## 🏗️ 1. Implicit vs Explicit Caching
- **Implicit:** Automatically handled by the SDK for common prefixes (v1.35.0+). Good for small repetitive prompts.
- **Explicit:** Manually created using the `cacheManager`. Mandatory for large repositories or training data.

---

## ⏱️ 2. TTL (Time To Live) Management
Caches cost money to "store" per minute. 

### Squaads Standard for TTL:
- **Project Context:** 8 hours (Covers a workday).
- **Core Library Docs:** 24 hours.
- **Quick Forensic Tasks:** 30 minutes.

---

## 🚀 3. Cache Warming Strategy
For major refactors, "warm" the cache with the full repository before the agent starts its loop.

```bash
# Example warming command
bun run warm-cache --repo . --ttl 4h
```

---

## 📈 4. Monitoring Cache Hit Rate
Always log if a prompt hit the cache. If the hit rate is < 50%, your "Pruning" strategy is likely failing (adding too many dynamic elements like timestamps to the cached block).

### Pro-Tip:
Move `new Date()` or `git-branch` strings OUT of the system instruction and into the `user` message to keep the system instruction cacheable.
