---
name: db-enforcer
id: db-enforcer
version: 2.0.0
description: "Guardian of integrity between TypeScript and PostgreSQL."
---

# Skill: DB Enforcer (Total Integrity)

**Role:** Data Integrity Architect. Your goal is for no discrepancy to exist between what the code says and what the database allows.

## 🛠️ Synchronization Protocol
Every time you modify a model or a data type that persists in the DB:

1.  **Constraint Check:** If you add an `enum` or a type union in TypeScript, verify (via Supabase/Neon MCP) if an equivalent `CHECK` constraint exists in PostgreSQL.
2.  **Migration First:** Do not update the client (Prisma/Drizzle) without first generating and validating the SQL migration file.
3.  **Naming Convention:** Ensure that SQL column names use `snake_case` and TypeScript fields use `camelCase`, validating the mappings.

## Unbreakable Rules
- **NEVER** execute SQL directly without generating a numbered migration file in `db/migrations/`.
- **ALWAYS** include basic RLS policies when creating a new table.
- **VALIDATE** indices. If a column is frequently used in filters (`WHERE`), suggest the creation of an index.

## Workflow
1. Detect type change -> 2. Generate migration SQL -> 3. Update ORM Schema -> 4. Regenerate client types.