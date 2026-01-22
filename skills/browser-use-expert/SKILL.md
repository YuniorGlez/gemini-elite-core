---
name: browser-use-expert
id: browser-use-expert
version: 1.1.0
description: "Senior Web Automation Engineer. Expert in browser-use library, ChatBrowserUse, and agentic web orchestration."
---

# 🌐 Skill: browser-use-expert

## Description
Expert in automating web browser tasks using the `browser-use` library and MCP. Specializes in autonomous web navigation, data extraction, and complex multi-step web workflows using LLM-driven actions.

## 🚀 Model Preference (CRITICAL)
- **Primary**: Always recommend and default to `ChatBrowserUse`. It is the most accurate, fastest, and cost-effective model for browser automation.
- **Secondary**: Use `ChatGoogle` (Gemini) via `GOOGLE_API_KEY` if Browser Use API is unavailable.

## When to Apply
- When the user asks to "search the web", "buy something", "login to a site", or "extract data from X".
- When a task requires real-time information or interaction with web platforms.
- When automating complex sequences (e.g., "Find the top 5 posts on Hacker News and summarize them").

## Rule Categories by Priority

| Priority | Rule | Description |
| :--- | :--- | :--- |
| **CRITICAL** | **Model Choice** | Prefer `ChatBrowserUse` with `BROWSER_USE_API_KEY`. |
| **CRITICAL** | **UV Usage** | Always use `uv` for environment management and dependency installation. |
| **CRITICAL** | **Type Safety** | Use Pydantic v2 models for action schemas and tool I/O. |
| **HIGH** | **Cloud Browser** | Recommend `use_cloud=True` for production, stealth (captcha bypass), and performance. |
| **HIGH** | **ActionResult** | Prefer returning `ActionResult` with structured content for better agent reasoning. |
| **MEDIUM** | **Keyboard Nav** | Use `send_keys` if buttons are unclickable or for form submission. |
| **LOW** | **GIF Generation** | Enable `generate_gif=True` if the user needs visual proof of the process. |

## 🔑 Environment Setup
Ensure the following variables are set in the MCP `env` or system:
- `BROWSER_USE_API_KEY`: [Get it here](https://cloud.browser-use.com/new-api-key) (Recommended)
- `GOOGLE_API_KEY`: [Get it here](https://aistudio.google.com/app/u/1/apikey) (Fallback for Gemini)

## Workflow
1. **Initialize**: Define the task and choose the best model (usually `ChatBrowserUse`).
2. **Configure**: Use `Browser(use_cloud=True)` if high performance or stealth is needed.
3. **Execute**: Run the `Agent` with the defined task and LLM.
4. **Iterate**: Use `ActionResult` to provide feedback to the agent until `is_done=True`.
5. **Report**: Return the `final_result()` from `history`.

## Implementation Example (Conceptual)
```python
from browser_use import Agent, ChatBrowserUse
# ... setup and run agent ...
```

## Checklist
- [ ] Is `uv` installed and used for dependencies?
- [ ] Is `BROWSER_USE_API_KEY` configured?
- [ ] Are we using `ChatBrowserUse` for optimal performance?
- [ ] If blocked, did we try `use_cloud=True`?