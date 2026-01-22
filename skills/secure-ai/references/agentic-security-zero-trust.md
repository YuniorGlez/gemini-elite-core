# Agentic Security: Zero-Trust for AI (2026)

In 2026, AI agents are autonomous actors. We apply Zero-Trust principles to their interactions with our systems.

## 1. Non-Human Identity (NHI) Management

Every agent must have a verifiable identity.
-   **Standard**: Use OIDC (OpenID Connect) for agent-to-service authentication.
-   **Rotation**: Rotate agent API keys every 24 hours.

## 2. Resource Isolation

Agents should run in isolated environments (e.g., sandboxed containers or WASM runtimes) when executing generated code.
-   **Tool Use**: Limit tool access to specific, pre-defined resources.

## 3. Mandatory Human-in-the-Loop (HITL)

For critical business logic:
-   **Pattern**: The agent proposes an action, and the system waits for a human signature before proceeding.
-   **Audit**: Log the rationale and the human approver for every sensitive transaction.

## 4. Anomaly Detection for Agents

Monitor agent behavior for deviations from the "Baseline Vibe."
-   **Signals**: unusual volume of API calls, attempts to access unauthorized modules, or sudden changes in reasoning patterns.

## 5. Defense against Token-Level Attacks

-   **Prompt Leaking**: Design system prompts to be non-extractable.
-   **Data Smuggling**: Scan model outputs for encoded secrets (e.g., base64 or steganography) that might be bypassing egress filters.

---
*Updated: January 22, 2026 - 20:45*
