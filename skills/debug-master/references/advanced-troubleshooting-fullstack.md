# Advanced Fullstack Troubleshooting (2026)

Master the "Layers of Defense" when debugging complex, non-deterministic issues.

## 1. Network Layer

-   **DNS**: Verify TTLs and resolution in different regions.
-   **TLS**: Check for expired certificates or handshake timeouts.
-   **WAF/Firewall**: Is the WAF blocking legitimate agent traffic?

## 2. Infrastructure Layer

-   **Connection Pools**: Identify "Connection Leaks" where handles aren't being closed.
-   **Queue Saturation**: Check if the background worker queue is backing up (e.g., BullMQ/RabbitMQ).
-   **Disk I/O**: High wait times on database volumes.

## 3. Logic Layer (The "Vibe" Debug)

For non-deterministic AI behavior:

-   **Reasoning Traces**: Read the LLM's "Internal Thought" logs to see where it lost context.
-   **Prompt Injection**: Verify if user input is hijacking the system prompt.
-   **Token Limit**: Did the response get truncated?

## 4. Troubleshooting Workflow

1.  **Reproduce**: Create a minimal test case.
2.  **Isolate**: Use binary search (`git bisect`) to find the change.
3.  **Trace**: Follow the `trace_id` from the browser to the database.
4.  **Fix**: Apply a surgical fix with high-fidelity validation.
5.  **Audit**: Check if similar bugs exist in other parts of the system.

## 5. Rollback Logic

In 2026, we follow the **"Rollback First, Debug Later"** rule for production.
-   If MTTR (Mean Time To Repair) exceeds 5 minutes, trigger a total automated rollback to the last known stable commit.

---
*Updated: January 22, 2026 - 18:25*
