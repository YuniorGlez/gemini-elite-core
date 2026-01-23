# Audit Log Implementation

## Why Database-Level Auditing?
Application-level logs can be bypassed. Database-level auditing (triggers or extensions) captures every change regardless of how it was initiated.

---

### 1. Trigger-Based Auditing (Postgres)
Create a generic trigger that captures `INSERT`, `UPDATE`, and `DELETE`.

```sql
CREATE TABLE audit_log (
  id bigserial PRIMARY KEY,
  table_name text NOT NULL,
  action text NOT NULL,
  old_data jsonb,
  new_data jsonb,
  actor_id uuid,
  changed_at timestamptz DEFAULT now()
);

-- Trigger Function
CREATE OR REPLACE FUNCTION process_audit() RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'DELETE') THEN
    INSERT INTO audit_log(table_name, action, old_data, actor_id)
    VALUES (TG_TABLE_NAME, 'DELETE', to_jsonb(OLD), auth.uid());
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO audit_log(table_name, action, old_data, new_data, actor_id)
    VALUES (TG_TABLE_NAME, 'UPDATE', to_jsonb(OLD), to_jsonb(NEW), auth.uid());
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;
```

---

### 2. PGAudit Extension
For high-compliance environments (HIPAA, SOC 2), use `pgaudit`.
- It logs full SQL statements and their parameters.
- It can be configured to log only specific tables or roles.

---

### 3. Log Integrity
To prevent an attacker from deleting the audit logs:
- Store audit logs in a separate, read-only (for the app user) database.
- Use a "Forward-Only" logging service that cannot be modified once data is sent.
