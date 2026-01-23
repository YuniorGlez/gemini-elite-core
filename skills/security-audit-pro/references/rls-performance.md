# RLS Performance Optimization

## The Cost of RLS
Each RLS policy is essentially a hidden `WHERE` clause added to every query. If not optimized, it can turn a `O(1)` lookup into a `O(N)` scan.

---

### 1. Mandatory Indexing
Any column used in a `USING` or `WITH CHECK` clause MUST be indexed.
- **Example**: If policy is `auth.uid() = user_id`, then `user_id` needs a B-Tree index.

---

### 2. Wrapping in Stable Functions
Postgres can cache the results of `STABLE` functions. Wrap complex subqueries in a function to avoid re-executing them for every row.

```sql
CREATE OR REPLACE FUNCTION check_membership(org_id uuid)
RETURNS boolean AS $$
  SELECT EXISTS (
    SELECT 1 FROM memberships 
    WHERE organization_id = org_id AND user_id = auth.uid()
  );
$$ LANGUAGE sql STABLE;

CREATE POLICY member_access ON documents
FOR SELECT USING (check_membership(organization_id));
```

---

### 3. Avoid Cross-Schema Subqueries
Try to keep your RLS logic within the same schema to minimize planning overhead.

---

### 4. Benchmarking with `EXPLAIN`
Always test your RLS policies with real data volumes.
`EXPLAIN (ANALYZE, BUFFERS) SELECT * FROM my_table;`
Check if the execution plan shows "Sequential Scan" (Bad) or "Index Scan" (Good).
