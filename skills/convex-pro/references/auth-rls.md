# Auth & Authorization Strategies (Convex 2026)

Security in Convex is built around the identity of the user calling the function. Unlike traditional RLS, which happens at the DB engine level, Convex authorization happens at the application boundary.

## 1. Validating Identity

Always use `ctx.auth.getUserIdentity()` at the start of any protected function.

```typescript
import { query } from "./_generated/server";
import { ConvexError } from "convex/values";

export const getSecretData = query({
  args: {},
  handler: async (ctx) => {
    const user = await ctx.auth.getUserIdentity();
    if (!user) {
      throw new ConvexError({ code: "UNAUTHENTICATED", message: "Not logged in" });
    }
    
    // Identity subject is typically the stable ID from Clerk/Auth0
    return await ctx.db
      .query("secrets")
      .withIndex("by_user", (q) => q.eq("userId", user.subject))
      .unique();
  },
});
```

## 2. Row Level Security (RLS) Implementation

If you want a global RLS-like behavior, wrap the `ctx.db` in a custom layer.

```typescript
// convex/rls.ts - Conceptual
export function wrapDB(ctx: QueryCtx) {
  return {
    get: async (id: Id<"any">) => {
      const doc = await ctx.db.get(id);
      const user = await ctx.auth.getUserIdentity();
      if (doc?.userId !== user?.subject) return null;
      return doc;
    }
  };
}
```

## 3. Unguessable IDs
For public but secure data (like a shared link), use a random string property instead of the document `_id`.

```typescript
const item = await ctx.db
  .query("items")
  .withIndex("by_share_token", (q) => q.eq("shareToken", args.token))
  .unique();
```

## 4. Admin Roles
Define an `isAdmin` helper or use environment variables for superuser access.

```typescript
const isAdmin = user?.email === process.env.ADMIN_EMAIL;
```

---
*Updated: January 23, 2026*
