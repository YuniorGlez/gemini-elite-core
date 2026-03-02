# Research Notes: Gemini CLI Evolution (v0.27.0 to v0.33.0)

## Core Capabilities & Scheduler
- **Event-Driven Scheduler (v0.27.0)**: Major shift to an event-driven model for tool execution. Improves responsiveness and performance. 
- **Kind.Agent Contiguous Parallel Admission (v0.33.0)**: New optimization for tool calls from Kind.Agent (sub-agents).
- **Parallel Admission for Kind.Agent tools (v0.31.0)**: Enabling contiguous parallel admission for Kind.Agent tools to reduce latency.

## New Commands & Modes
- **Plan Mode (`/plan`, `enter_plan_mode`) (v0.29.0)**: A comprehensive capability for mission planning with dedicated documentation and tool.
- **Rewind (`/rewind`) (v0.27.0)**: Navigate session history.
- **Introspect (`/introspect`) (v0.26.0)**: New debugging command.
- **Model Selection (`/model`) (v0.12.0)**: Interactive model switching.
- **Logout (`/logout`) (v0.23.0)**: Reset credentials.
- **Slash command execution in headless mode**: `gemini "/command args"` now supported.

## Policy Engine (The "New Seatbelt")
- **Policy Engine (v0.18.0 - v0.31.0)**: Replaces `--allowed-tools`. Supports user-defined policies (`--policy`), project-level policies, and administrator-defined allowlists for MCP servers.
- **Strict Seatbelt Profiles (v0.30.0)**: Introduction of higher security profiles.

## UI & Accessibility
- **Alternate Screen Buffer (v0.15.0 - v0.29.0)**: Scrollable UI, mouse support (click to focus), sticky headers.
- **Markdown Toggle (`Alt+M` / `Ctrl+M`) (v0.11.0)**: Switch between raw and rendered markdown.
- **Status in Title (`showStatusInTitle`) (v0.8.0)**: Show thoughts in terminal tab title.
- **Theme Switching (v0.28.0)**: Automatic background detection and Solarized themes.

## Agents & Skills
- **Skill Creator (v0.26.0)**: Native skill for building other skills.
- **Generalist Agent (v0.26.0)**: Standard router for tasks.
- **Codebase Investigator (v0.12.0)**: Built-in sub-agent for repository analysis. Turn-limited by default (configurable).

## Configuration Evolution (settings.json)
- **`enforcedAuthType`**: Mandate auth methods.
- **`enableToolOutputTruncation`**: Experimental management of large outputs.
- **`useWriteTodos`**: Managed checklist for complex tasks.
- **`ui.customWittyPhrases`**: Custom loading messages.
- **`hideCWD`, `hideModelInfo`, etc.**: Granular footer control.

## 2026 Models
- **Gemini 3.1 Pro Preview (v0.31.0)**: Now supported.
- **Gemini 3 Default (v0.29.0)**: Preview flag removed.
- **Gemini 2.5 Flash Lite (v0.4.0)**: Supported.
