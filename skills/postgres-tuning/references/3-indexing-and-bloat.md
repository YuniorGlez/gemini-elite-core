# Reference: Indexing & Bloat Management

## Overview
A "bloated" database is a slow database. Bloat occurs when `UPDATE` or `DELETE` operations leave empty spaces in the data pages.

---

## 🏗️ 1. Modern Indexing Patterns

### BRIN (Block Range Index)
Perfect for huge time-series tables (e.g., `logs`).
- **Benefit:** 100x smaller than a B-tree.
- **Drawback:** Only works on physically sorted data.

### HNSW (Hierarchical Navigable Small World)
The 2026 standard for **Vector Search** (AI).
```sql
CREATE INDEX ON embeddings USING hnsw (embedding_vector vector_cosine_ops);
```

---

## 🧹 2. Tuning Autovacuum
The Squaads standard is "Aggressive Autovacuum" for high-churn tables.

```sql
ALTER TABLE large_orders SET (
  autovacuum_vacuum_scale_factor = 0.01,
  autovacuum_vacuum_cost_limit = 1000
);
```
**Why?** This triggers a vacuum after 1% of the rows change, rather than the default 20%.

---

## ⛓️ 3. HOT (Heap Only Tuple) Updates
HOT updates are a major performance win. They happen when an update doesn't change any indexed columns.

**Optimization:**
Only index the columns you actually search on. Every extra index makes `UPDATE` and `INSERT` slower and prevents HOT updates.

---

## 📊 4. Detecting Bloat
Use the `pg_stat_user_tables` view to find "Dead Tuples."

```sql
SELECT relname, n_dead_tup, last_autovacuum 
FROM pg_stat_user_tables 
ORDER BY n_dead_tup DESC;
```
**Corrective Action:** If bloat is > 30%, consider `REINDEX CONCURRENTLY` or `pg_repack`.

---

## 🏁 Summary for the Optimizer
1.  **UUIDv7** for primary keys.
2.  **JSON-B** with GIN indexes for flexible data.
3.  **Partial Indexes** for specific subsets (e.g., `status = 'active'`).
4.  **Covering Indexes** (`INCLUDE`) to eliminate table lookups.
