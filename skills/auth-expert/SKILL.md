---
name: auth-expert
id: auth-expert
version: 1.1.0
description: "Senior expert in Auth.js v5 (NextAuth), Edge-First authentication and security."
---

# 🔑 Skill: auth-expert

## Description
Senior specialist in Auth.js v5 for modern applications, focusing on type-safe configurations, Edge Runtime support, and unified session architecture.

## Core Architecture: Split Configuration
To avoid build errors in Edge environments, it is mandatory to split the configuration.

### 1. Edge Config (`auth.config.ts`)
Only Edge-compatible logic (providers, authorization callbacks).
```typescript
import type { NextAuthConfig } from "next-auth";
export const authConfig = {
  providers: [], 
  callbacks: {
    authorized({ auth, request: { nextUrl } }) {
      const isLoggedIn = !!auth?.user;
      const isOnDashboard = nextUrl.pathname.startsWith("/dashboard");
      if (isOnDashboard) return isLoggedIn;
      return true;
    },
  },
} satisfies NextAuthConfig;
```

### 2. Main Auth Config (`auth.ts`)
Full logic with database adapters (Node.js).
```typescript
import NextAuth from "next-auth";
import { PrismaAdapter } from "@auth/prisma-adapter";
import { prisma } from "@/lib/prisma";
import { authConfig } from "./auth.config";

export const { auth, signIn, signOut, handlers } = NextAuth({
  adapter: PrismaAdapter(prisma),
  session: { strategy: "jwt" },
  ...authConfig,
});
```

## Usage Patterns

### Server-Side Access
In Next.js 16+, use the universal `auth()` method.
```tsx
import { auth } from "@/auth";

export default async function Page() {
  const session = await auth();
  if (!session) return <div>Access Denied</div>;
  return <div>Welcome {session.user.name}</div>;
}
```

### API Routes
Use Route Handlers in `app/api/auth/[...nextauth]/route.ts`.

## The 'Do Not' List
- **DO NOT** use `getServerSession`. Use `auth()`.
- **DO NOT** use `pages/api/auth/`. Use the App Router.
- **DO NOT** import DB adapters (like Prisma) in `auth.config.ts`.
- **DO NOT** use "magic" automatic logic; prefer explicit and typed configurations.
