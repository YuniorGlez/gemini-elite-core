---
name: auth-expert
id: auth-expert
version: 1.2.0
description: "Senior expert in Auth.js v5 (NextAuth), Edge-First authentication and security. Use when configuring providers, securing server actions, or migrating from v4 in 2026."
---

# 🔐 Skill: auth-expert

## Description
Senior specialist in Auth.js v5 (formerly NextAuth), focused on high-performance, Edge-compatible authentication and zero-trust security. Expert in migrating legacy NextAuth systems to the modern 2026 standard with seamless Server Action integration.

## Core Priorities
1.  **Auth.js v5 Standard**: Mandatory use of the new beta APIs and `auth()` helper.
2.  **Environment Security**: Strict enforcement of the `AUTH_` prefix for all configuration.
3.  **Edge-Ready Architecture**: Decoupling auth logic to support middleware and edge runtimes natively.
4.  **Action-First Security**: Protecting Server Actions using the unified `auth()` call.

## 🏆 Top 5 Gains in Auth.js v5 (2026)

1.  **Unified API**: The same `auth()` function works in Middleware, Server Components, and Server Actions.
2.  **25% Faster Sessions**: Optimized internal caching and session validation logic.
3.  **Zero-Config Env**: Auto-detection of `AUTH_SECRET` and `AUTH_URL` reduces boilerplate.
4.  **Direct Database Adapters**: 15% smaller client bundle by moving adapter logic entirely to the server.
5.  **Native TypeScript 5.5 Support**: Full inference for `session.user` types across the entire stack.

## Table of Contents & Detailed Guides

### 1. [Migration from v4 to v5](./references/1-migration.md) — **CRITICAL**
- Package updates and renaming
- Env variable migration (`NEXTAUTH_` to `AUTH_`)
- Adapter configuration changes

### 2. [Edge-Ready Configuration](./references/2-edge-config.md) — **CRITICAL**
- Lazy initialization in middleware
- Handling non-edge-compatible adapters
- Session strategy: JWT vs. Database

### 3. [Securing Server Actions & Components](./references/3-securing-logic.md) — **HIGH**
- Using `auth()` as a guard
- Role-Based Access Control (RBAC) patterns
- Managing CSRF in 2026

### 4. [Custom Providers & Callbacks](./references/4-providers.md) — **MEDIUM**
- OAuth 2.1 implementation
- Customizing JWT and Session callbacks
- Error handling and custom login pages

## Quick Reference: The "Do's" and "Don'ts"

| **Don't** | **Do** |
| :--- | :--- |
| `getServerSession()` (Deprecated) | Use `auth()` (v5 API) |
| `NEXTAUTH_URL` | Use `AUTH_URL` or auto-detect |
| `useSession()` in Server Components | Use `auth()` for server-side access |
| Manual CSRF tokens | Trust native Auth.js protection |
| Expose secrets in Client Components | Keep all auth logic in `server-only` files |

---
*Optimized for Auth.js v5 and Next.js 16.1.*
*Updated: January 22, 2026 - 15:20*
