# Hooks Reference Specification (v0.27.0)

## Global Hook Mechanics
Hooks communicate via:
- **stdin**: Input (JSON)
- **stdout**: Output (JSON)
- **stderr**: Logs and feedback

## Exit Codes Behavior
- **0**: Success. stdout is parsed as JSON.
- **2**: System Block/Retry. Interrupts the current operation; stderr is shown as the rejection reason.
- **Other**: Warning. Execution continues; stderr is logged as a warning.

## Base Input Schema (All Events)
```typescript
{
  "session_id": string,       // Unique ID for the current session
  "transcript_path": string,  // Absolute path to session transcript JSON
  "cwd": string,              // Current working directory
  "hook_event_name": string,  // The firing event (e.g. "BeforeTool")
  "timestamp": string         // ISO 8601 execution time
}
```

## Event-Specific Fields
### Tool Events (BeforeTool, AfterTool)
- **tool_name**: string
- **tool_input**: object
- **tool_response**: object (AfterTool only)
- **mcp_context**: object (Optional, contains server identity)

### Agent Events (BeforeAgent, AfterAgent)
- **prompt**: string
- **prompt_response**: string (AfterAgent only)
- **stop_hook_active**: boolean (AfterAgent only)
```
