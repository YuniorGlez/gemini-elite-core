# Convex Security Deep Dive

## Identity Validation
Convex functions are public by default. You must secure them using the `ctx.auth` object.

### Pattern: The "Pre-Handler" Check
Create a helper to validate the user and return their metadata.

```typescript
async function getAuthenticatedUser(ctx: QueryCtx | MutationCtx) {
  const identity = await ctx.auth.getUserIdentity();
  if (!identity) throw new Error("Unauthorized");
  return identity;
}
```

---

### Protecting Data (The Manual RLS)
Since Convex doesn't have native SQL RLS, you must implement it in your function handlers.

```typescript
export const updatePost = mutation({
  args: { id: v.id("posts"), content: v.string() },
  handler: async (ctx, args) => {
    const user = await getAuthenticatedUser(ctx);
    const post = await ctx.db.get(args.id);
    
    if (post.authorId !== user.subject) {
      throw new Error("You are not the author of this post.");
    }
    
    await ctx.db.patch(args.id, { content: args.content });
  }
});
```

---

## Granular Functions vs. "The God Update"
- **Bad**: `updateUser(data: any)`
- **Elite**: `updateUserDisplayName`, `updateUserAvatar`, `updateUserPermissions`.
By splitting functions, you can apply different authorization rules to each specific action.

---

## Encryption & Compliance
Convex encrypts all data at rest and in transit. For HIPAA/SOC 2 environments, use the **Enterprise Tier** which provides audit logs and dedicated infrastructure isolation.
    