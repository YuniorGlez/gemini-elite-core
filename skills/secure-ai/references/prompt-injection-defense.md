# Prompt Injection Defense: Multi-Layered Protection (2026)

Prompt injection is the #1 risk in LLM applications. In 2026, we utilize a defense-in-depth approach to isolate system instructions from untrusted user input.

## 1. Structural Isolation (The Primary Defense)

Never mix instructions and data in a single string. Use the Chat API's message roles or Function Calling.

-   **Bad**: `summarize this: ${userInput}`
-   **Good**:
    ```typescript
    messages: [
      { role: "system", content: "You are a summarizer." },
      { role: "user", content: userInput }
    ]
    ```

## 2. Input Sanitization & Boundaries

Use explicit boundary markers to help the model identify where user data starts and ends.

```text
Summarize the following text.
--- USER DATA START ---
${userInput}
--- USER DATA END ---
```

## 3. The "Guardian" Model Pattern

Use a smaller, faster model (e.g., Gemini 3 Flash) to scan user input for injection patterns before sending it to the main reasoning model.

-   **Checklist**:
    -   Does the input contain "Ignore previous instructions"?
    -   Does it attempt to change the AI's persona?
    -   Does it contain instruction-like keywords (e.g., "SYSTEM:", "REWRITE")?

## 4. Privilege Escalation Defense

AI agents should operate with **Least Privilege**.
-   **Rule**: Agents cannot execute sensitive actions (e.g., deleting data, making payments) without a separate authentication token or human approval.

## 5. Defense against Indirect Injection

Indirect injection happens when an AI reads data from an external source (e.g., a URL or an email) that contains malicious instructions.
-   **Action**: Always treat data fetched from URLs as untrusted and wrap it in a "Sandboxed Context" with strict behavioral rules.

---
*Updated: January 22, 2026 - 20:45*
