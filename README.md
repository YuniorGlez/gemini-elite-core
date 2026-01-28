# 🤖 Gemini Elite Core

**The Ultimate Configuration Suite for Gemini CLI (v0.27.0+)**

Transform your Gemini CLI into a high-performance autonomous agentic environment. This repository provides a curated collection of tactical skills, advanced agent configurations, and automated protocol hooks used by elite engineering teams.

## 🚀 Key Features

- **Advanced Agent Configs**: Pre-configured `codebaseInvestigator`, `codeReviewer`, `bugFixer`, and `skillCreator` optimized for the **Event-Driven Scheduler** in v0.27.0.
- **Tactical Skill Library**: Over 70 specialized skills for React 19, Next.js 16, Tailwind 4, Supabase, Git Flow, and more. Now promoted to **Stable** (`skills.enabled`).
- **Improved Provisioning**: New setup script with automated MCP detection (Chrome DevTools, Filesystem, llm-tldr, browser-use) and optional Rust-based Filesystem MCP for extreme performance.
- **Persistent Planning**: Full support for `plan.persistentStorage`, allowing session recovery and deep auditability.
- **Agentic Hooks**: Automated type-checking (with System Block exit codes), commit message validation, and session initialization.
- **Deep Documentation**: Modern technical guides for the latest 2026 tech stack.
- **Extension Settings**: Dynamic loading of `hooks.json`, `agents.json`, and `skills.json` for modular extensions.

## 🛠️ Instant Installation

Clone this repository and run the setup script:

**Steps For Unix Users**

```bash
git clone https://github.com/YuniorGlez/gemini-elite-core.git
cd gemini-elite-core
chmod +x setup.sh
./setup.sh
```

**Steps For Windows Users**

```bash
git clone https://github.com/YuniorGlez/gemini-elite-core.git
cd gemini-elite-core
.\setup.cmd
```

## 📖 How to Use

Once installed, the setup script configures your `~/.gemini/settings.json` and installs all tactical skills.

### 1. Initialize your session

When starting a new project, simply tell Gemini:

> "Analyze the codebase and prepare for development."

### 2. Activate Specialized Skills

Need deep knowledge of Next.js 16?

> "activate_skill next16-expert"

### 3. Use Automated Protocols

Gemini Elite Core includes hooks that:

- **Auto-Type-Check**: Runs `tsc --noEmit` after logic changes and blocks execution on failure (v0.27.0 standard).
- **Commit Sentinel**: Ensures your commits follow Conventional Commits standards.

## 📂 Repository Structure

- `skills/`: Tactical MD skills for specific frameworks and tools.
- `hooks/`: JavaScript hooks for session events (SessionStart, AfterTool, AfterModel, etc.).
- `docs/`: Up-to-date documentation for 2026 technologies.
- `docs/skills-patterns/`: Advanced patterns for modular skill design.
- `scripts/`: Operational tools including the surgical `committer.sh`.

## 🛡️ Security & Privacy

Gemini Elite Core is designed to be safe. It uses the new Security Consent Prompts of v0.27.0 for skill installations, enforces strict policy directory permissions (700), and avoids any hardcoded secrets.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

_Optimized for the future of agentic development. Built for Gemini CLI v0.27.0._
