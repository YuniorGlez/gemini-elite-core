# Reference: Query Plan Analysis (The Forensic Guide)

## Overview
Optimizing a query without looking at the plan is just guessing. In 2026, we use **EXPLAIN ANALYZE** with full context.

---

## 🛠️ 1. The "Standard" Explain Call
```sql
EXPLAIN (ANALYZE, BUFFERS, VERBOSE, SETTINGS)
SELECT ...
```

### Key Metrics to Audit:
1.  **Shared Hit:** Data found in RAM (Shared Buffers). **Goal: > 95%**.
2.  **Shared Read:** Data read from Disk. **Slow.**
3.  **Local Hit/Read:** Data in temporary files. **Critical Problem** (indicates `work_mem` is too low).

---

## 🔍 2. Identifying "Evil" Operators

### Sequential Scan (Seq Scan)
Reading the whole table. **Fix:** Index the column used in the `WHERE` clause.

### Nested Loop
Connecting two tables by scanning Table B for every row in Table A. **Fix:** Ensure Table B has an index on the join key.

### Hash Join / Merge Join
Better for large datasets, but can be memory-heavy.

---

## 🧩 3. B-tree Skip Scans (PG 18)
PostgreSQL 18 can now "Skip" irrelevant parts of a composite index.

**Example:**
Index on `(tenant_id, status)`.
Query: `SELECT * FROM orders WHERE status = 'pending';`
**Old PG:** Could NOT use the index (needed `tenant_id`).
**PG 18:** Efficiently skips the `tenant_id` prefix to find the `status`.

---

## 📉 4. Memory Optimization (`work_mem`)
If you see "External Merge Disk" in the plan, your sort operation is spilling to disk.

```sql
SET work_mem = '64MB'; -- Only for the current session/query
```
*Note: Be careful. `work_mem` is allocated per-operator, so a complex query can use 10x this amount.*
