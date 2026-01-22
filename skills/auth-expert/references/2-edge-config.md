# 2. Edge-Ready Configuration

**Impact: CRITICAL**

To support Middleware and Edge functions, you must ensure your auth configuration is lazily initialized and doesn't rely on Node-only modules.

## 2.1 Decoupling for Middleware

If your adapter (like Prisma) is not Edge-ready, separate your configuration.

```typescript
// auth.config.ts (Edge compatible)
import Google from "next-auth/providers/google"
import type { NextAuthConfig } from "next-auth"

export default {
  providers: [Google],
} satisfies NextAuthConfig

// auth.ts (Server-side with Adapter)
import NextAuth from "next-auth"
import { PrismaAdapter } from "@auth/prisma-adapter"
import { db } from "@/lib/db"
import authConfig from "./auth.config"

export const { handlers, auth, signIn, signOut } = NextAuth({
  adapter: PrismaAdapter(db),
  session: { strategy: "jwt" },
  ...authConfig,
})
```

## 2.2 Middleware usage

```typescript
// middleware.ts
import NextAuth from "next-auth"
import authConfig from "./auth.config"

export const { auth: middleware } = NextAuth(authConfig)

export const config = {
  matcher: ["/((?!api|_next/static|_next/image|favicon.ico).*)"],
}
```
Using the same `authConfig` ensures consistent session handling across the edge and server.
