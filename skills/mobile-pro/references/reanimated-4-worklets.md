# Reanimated 4: Worklets and Concurrent JS (2026)

Reanimated 4 moves beyond simple interpolation, allowing you to run complex JavaScript logic concurrently on the UI thread using **Worklets**.

## 1. What are Worklets?

Worklets are small pieces of JavaScript code that run in a separate thread (the UI thread). They are isolated from the main JS bundle to ensure 120fps performance.

-   **Native Runtime**: Worklets run in a dedicated JSI runtime.
-   **Direct Interaction**: They can directly manipulate View properties without going through the React bridge.

## 2. Shared Value Orchestration

In v4, shared values are the source of truth for all concurrent state.

```typescript
const offset = useSharedValue(0);

const gesture = Gesture.Pan()
  .onUpdate((e) => {
    'worklet'; // Explicit worklet directive
    offset.value = e.translationX;
  });
```

## 3. Reanimated Worklets: The "Pausable" Pattern

v4 introduces **Pausable Composition**, allowing UI work to be split across multiple frames to prevent long-running tasks from dropping frames.

## 4. Concurrent JS Logic

You can now run non-UI logic (e.g., complex math or data sorting) in a worklet to keep the main thread responsive.

```typescript
function performHeavyMath(data) {
  'worklet';
  // Isolated computation
  return data.map(x => Math.sin(x));
}
```

## 5. Transitioning from Reanimated 3

-   Replace `withSpring` and `withTiming` with the new **CSS Transition API** for simpler animations.
-   Use `GestureDetector` as the primary interface for all tactile interactions.

---
*Updated: January 22, 2026 - 20:15*
