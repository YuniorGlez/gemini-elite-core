# Browser-Use MCP & Skill Integration Guide

## Overview
[Browser-Use](https://github.com/browser-use/browser-use) is an AI agent that autonomously interacts with the web. It takes a user-defined task, navigates web pages using Chromium via CDP, processes HTML, and repeatedly queries a language model to decide the next action.

## 🛠️ MCP Installation (Automated via setup.sh)

The integration requires:
1. **uv**: Fast Python package manager (Recommended over pip).
2. **playwright**: Browser automation engine.
3. **mcp-server-browser-use**: The official MCP wrapper.

### Manual Installation Steps:
```bash
# 1. Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# 2. Install dependencies & browser
uv pip install browser-use playwright
uv run playwright install chromium
```

### Configuration in `settings.json`:
We recommend using **ChatBrowserUse** for the best performance or **Gemini** (Google) as a free alternative.

```json
"mcpServers": {
  "browser-use": {
    "command": "uvx",
    "args": ["--quiet", "--with", "playwright", "--with", "browser-use", "-y", "mcp-server-browser-use", "server"],
    "env": {
      "BROWSER_USE_API_KEY": "your-key-here",
      "GOOGLE_API_KEY": "your-gemini-key-here"
    }
  }
}
```

## 🔑 API Keys Configuration

| Provider | Model | API Key Variable | Get it here |
| :--- | :--- | :--- | :--- |
| **Browser Use** | `ChatBrowserUse` | `BROWSER_USE_API_KEY` | [cloud.browser-use.com](https://cloud.browser-use.com/new-api-key) |
| **Google** | `gemini-flash-latest` | `GOOGLE_API_KEY` | [AI Studio](https://aistudio.google.com/app/u/1/apikey) |

> **Note**: Gemini CLI uses `GEMINI_API_KEY` internally, but Browser-Use expects `GOOGLE_API_KEY`. Our `setup.sh` automatically maps them if you use Gemini.

## 🧠 Skill: browser-use-expert

This skill enables the Generalist Agent to orchestrate complex browser tasks. It prefers `ChatBrowserUse` for highest accuracy and speed.

### Key Capabilities:
- **Navigation**: Navigate to any URL and handle redirects.
- **Interaction**: Click, type, scroll, and handle dynamic elements.
- **Extraction**: Extract structured data from pages.
- **Stealth**: Support for proxies and cloud browsers to bypass captchas.

## 🛡️ Security Best Practices
- Use `BROWSER_USE_API_KEY` for production-grade automation (hosted browsers).
- For local use, ensure you have the necessary permissions for Playwright.
- Use `use_cloud=True` in the Browser configuration for better performance and stealth.

---