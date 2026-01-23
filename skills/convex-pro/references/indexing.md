# Advanced Indexing & Search (Convex 2026)

Efficient queries are the backbone of reactive systems. Convex indexes are optimized for range queries and equality checks.

## 1. Defining Multi-property Indexes

Composite indexes are required for queries with multiple filters.

```typescript
// convex/schema.ts
export default defineSchema({
  messages: defineTable({
    roomId: v.id("rooms"),
    senderId: v.string(),
    text: v.string(),
    read: v.boolean(),
  })
  .index("by_room_unread", ["roomId", "read"]),
});
```

## 2. Full-Text Search

Convex provides a specialized search index for text-heavy data.

```typescript
// Schema
.searchIndex("search_body", {
  searchField: "text",
  filterFields: ["roomId"],
})

// Function
const results = await ctx.db
  .query("messages")
  .withSearchIndex("search_body", (q) => 
    q.search("text", args.query).eq("roomId", args.roomId)
  )
  .collect();
```

## 3. Vector Search (AI Integration)

As of 2026, Convex is a top choice for RAG (Retrieval Augmented Generation) due to its native Vector Search.

```typescript
// Schema
.vectorIndex("by_embedding", {
  vectorField: "embedding", // [0.1, 0.2, ...]
  dimensions: 1536,
  filterFields: ["userId"],
})

// Function
const results = await ctx.db
  .query("documents")
  .withVectorIndex("by_embedding", (q) => 
    q.vectorSearch("embedding", args.vector).eq("userId", user.subject)
  )
  .collect();
```

---
*Updated: January 23, 2026*
