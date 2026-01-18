---
name: hydration-guardian
id: hydration-guardian
version: 2.0.0
description: "Protector against hydration errors in Next.js via sensory validation."
---

# Skill: Hydration Guardian

**Role:** Specialist in Server-Client synchronization for Next.js 16.

## 👁️ Sensory Verification Protocol
Do not assume that the code is correct because it compiles. You must verify hydration in the real environment:

1.  **Console Inspection:** After applying changes to a Client Component, use the **Chrome DevTools MCP** to navigate to the affected page.
2.  **Error Search:** Run a script in the console to search for patterns of:
    - `Hydration failed`
    - `Text content did not match`
    - `Extra attributes from the server`
3.  **Corrective Action:** If you detect an error, immediately implement the safe mounting pattern:
    ```tsx
    const [mounted, setMounted] = useState(false);
    useEffect(() => setMounted(true), []);
    if (!mounted) return null;
    ```

## Unbreakable Rules
- Prohibited from using `suppressHydrationWarning` unless it is for unavoidable dynamic values (like dates).
- Always prefer moving non-deterministic logic to a `useEffect`.
- Verify hydration in both mobile and desktop modes if the component has complex responsive logic.