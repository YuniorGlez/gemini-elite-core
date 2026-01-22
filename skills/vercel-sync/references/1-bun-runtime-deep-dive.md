# Reference: Bun Runtime Deep Dive (Vercel 2026)

## Overview
Bun on Vercel is not just a package manager; it is a full runtime replacement for Node.js in Serverless Functions. This deep dive explains how to squeeze every microsecond of performance from this combination.

## 🚀 Performance Gains
In 2026, Bun 2.x provides the following advantages on Vercel:
1.  **Fast SQLite:** Bun's native SQLite driver is significantly faster for local cache storage within a function.
2.  **Native ESM:** No more transpilation overhead for modern JavaScript.
3.  **Zig-powered I/O:** Drastically reduced latency for network requests (fetching from DB or AI APIs).

---

## ⚙️ Advanced Configuration
To fully leverage Bun, your `package.json` must be "Bun-Aware."

### Recommended Scripts
```json
{
  "scripts": {
    "dev": "bun --bun next dev",
    "build": "bun --bun next build",
    "start": "bun --bun next start",
    "lint": "bun x next lint"
  }
}
```
*Note: The `--bun` flag tells Bun to use its own binary to run the Next.js CLI, bypassing the Node.js shim entirely.*

---

## 📦 Dependency Management
Bun's `bun.lock` (binary lockfile v2) is the source of truth.
- **Speed:** `bun install` is typically 10-20x faster than `npm install`.
- **Space:** Bun uses a shared content-addressable store, reducing disk usage during builds.

### CI Optimization
Always use the `--frozen-lockfile` flag in Vercel to prevent accidental dependency drift.

---

## 🚫 Limitations & Workarounds
- **`Bun.serve`:** Do not use this. Vercel expects a standard entry point (like `next start` or an exported handler).
- **Native Modules:** Some old C++ Node.js modules may not be compatible with Bun's `N-API` implementation. Prefer Bun-native or Rust-based alternatives.
- **Monitoring:** Standard APM tools (like New Relic or Datadog) may require specific Bun-compatible agents as of 2026.
