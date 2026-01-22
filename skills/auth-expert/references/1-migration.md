# 1. Migration from v4 to v5

**Impact: CRITICAL**

The transition to Auth.js v5 is a major overhaul that simplifies the API and improves security.

## 1.1 Dependency Updates

Uninstall old packages and install the new scoped versions.

```bash
bun remove next-auth @next-auth/prisma-adapter
bun add next-auth@beta @auth/prisma-adapter
```

## 1.2 Env Variable Migration

In v5, all variables must use the `AUTH_` prefix.

**Before (v4):**
- `NEXTAUTH_SECRET`
- `NEXTAUTH_URL`

**After (v5):**
- `AUTH_SECRET`
- `AUTH_URL` (Optional, usually auto-detected)

## 1.3 File Structure Changes

Move your configuration to a central `auth.ts` file at the root or `src/`.

```typescript
// auth.ts
import NextAuth from "next-auth"
import Google from "next-auth/providers/google"

export const { handlers, auth, signIn, signOut } = NextAuth({
  providers: [Google],
})
```

## 1.4 API Routes

Replace the catch-all API route with the new handlers.

```typescript
// app/api/auth/[...nextauth]/route.ts
import { handlers } from "@/auth"
export const { GET, POST } = handlers
```
