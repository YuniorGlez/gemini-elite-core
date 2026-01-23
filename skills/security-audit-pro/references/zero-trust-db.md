# Zero-Trust DB Architecture (2026)

## Core Principles
1. **Never Trust, Always Verify**: Even if a request comes from your internal web server, verify the end-user's identity at the DB level.
2. **Least Privilege**: Grant only the permissions needed for the specific operation.
3. **Assume Breach**: Design your DB assuming an attacker already has a valid JWT.

---

### 1. Micro-Segmentation
Divide your database into logical segments.
- **Public Schema**: Contains only what is reachable via API.
- **Private Schema**: Internal data (logs, secrets) reachable only via specific backend services.
- **Audit Schema**: Tamper-proof logs with no `UPDATE` or `DELETE` permissions for the app user.

---

### 2. Identity Propagation
Pass the full end-user context (ID, Role, Org) down to the database level. 
- In Supabase/Postgres, this is handled via `auth.uid()` and `auth.jwt()`.
- In Convex, this is handled via `ctx.auth.getUserIdentity()`.

---

### 3. Connection Security
- Force TLS 1.3 for all connections.
- Use Asymmetric JWT signing (RS256/EdDSA) to prevent "Key Forgery" attacks.
- Use IP Allowlisting for administrative connections.
