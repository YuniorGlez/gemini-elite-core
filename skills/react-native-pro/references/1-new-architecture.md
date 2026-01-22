# Reference: The New Architecture (Fabric & TurboModules)

## Overview
The "New Architecture" is a complete rewrite of React Native's core, replacing the asynchronous bridge with a synchronous, JSI-based system.

---

## 🎨 1. Fabric (The UI Renderer)
Fabric is the new rendering system. It is written in C++ and shared across platforms.

### Key Benefits:
- **Synchronous Layout:** No more "white flashes" during rapid layout changes.
- **Concurrent Rendering:** React 19 can interrupt rendering for high-priority tasks (like user input).
- **Reduced Memory:** More efficient tree management in C++.

---

## ⚙️ 2. TurboModules (The Native Interop)
TurboModules allow lazy-loading of native features.

### Why it's better:
In the old architecture, all native modules were initialized on app startup, even if they weren't used. TurboModules are only loaded when `requireNativeModule()` is called.

---

## 🌉 3. Bridgeless Mode
In 2026, the "Bridge" is entirely gone. Communication happens via **JSI (JavaScript Interface)**.

**What changes for the developer?**
- You can no longer rely on `MessageQueue`.
- Error messages are much clearer as they point directly to the native code.
- You must use `Codegen` to ensure type safety between JS and C++.

---

## 🛠️ 4. Using Codegen
Codegen is a tool that generates C++ and Java/Objective-C code from your TypeScript interfaces.

1.  **Define the Interface:** Write a TS file with `TurboModule` or `FabricComponent` types.
2.  **Run Codegen:** `node node_modules/react-native/scripts/generate-specs.js`
3.  **Implement Native:** Use the generated headers to write your native logic.
