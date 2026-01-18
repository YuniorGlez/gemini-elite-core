---
name: prisma-expert
id: prisma-expert
version: 1.1.0
description: "Senior specialist in Prisma 7, Rust-free architecture and database optimization."
---

# 💎 Skill: prisma-expert

## Description
Senior specialist in Prisma 7, focused on the TypeScript query engine (Rust-free) to reduce latency and memory consumption in serverless environments. Expert in PostgreSQL connection optimization and native adapters.

## Core Features (Prisma 7)
- **Rust-free Engine**: The query engine is now TypeScript/WASM, eliminating overhead and improving cold starts.
- **Typed Config**: Shifting magic configuration to explicit `.ts` files.

## Standard Configuration (`prisma.config.ts`)
```typescript
import { defineConfig } from '@prisma/config';

export default defineConfig({
  schema: './prisma/schema.prisma',
  output: './src/generated/client',
  earlyAccess: true,
  adapter: 'neon', // Native connection for Neon DB
});
```

## Serverless Blueprint
For stability in Edge and Serverless, the client requires an explicit adapter.

```typescript
import { PrismaClient } from '@prisma/client';
import { PrismaNeon } from '@prisma/adapter-neon';
import { Pool } from '@neondatabase/serverless';

const pool = new Pool({ connectionString: process.env.DATABASE_URL });
const adapter = new PrismaNeon(pool);

export const prisma = new PrismaClient({ adapter });
```

## The 'Do Not' List
- **DO NOT** assume that `DATABASE_URL` is sufficient by itself; always use the corresponding adapter (e.g., Neon).
- **DO NOT** use `prisma.$on('query')` for production logging; use `config.telemetry`.
- **DO NOT** forget to run `bun prisma generate` after schema changes.
- **DO NOT** use Prisma versions < 7 in new Gemini Elite projects.
