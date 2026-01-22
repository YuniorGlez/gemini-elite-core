# Reference: Performance & Reanimated 4

## Overview
Reanimated 4 is the industry standard for high-performance animations in 2026. It uses **Worklets**—small pieces of JS code that run directly on the UI thread.

---

## ⚡ 1. Worklet Basics
A worklet is marked with the `"worklet";` directive.

```javascript
function myWorklet(x) {
  "worklet";
  return x * 2;
}
```

### useAnimatedStyle
The core hook for connecting JS state to native styles without crossing the bridge.

```tsx
const animatedStyle = useAnimatedStyle(() => {
  return {
    transform: [{ translateX: offset.value }],
  };
});
```

---

## 🎨 2. Shopify Skia
When standard Views aren't enough, use Skia for GPU-accelerated graphics.

### Use Case: Glassmorphism v3
```tsx
<Canvas style={{ flex: 1 }}>
  <Fill color="#000000" />
  <BackdropBlur blur={20}>
    <Rect x={10} y={10} width={100} height={100} />
  </BackdropBlur>
</Canvas>
```

---

## 🤖 3. The React Compiler (React Forget)
In 2026, the React Compiler automatically optimizes your components.
- **No more `useMemo` or `useCallback`** in 90% of cases.
- **Stable References:** The compiler ensures that props passed to native components don't trigger unnecessary re-renders.

---

## 📊 4. Profiling with Flipper & Hermes
- **Hermes Sampling Profiler:** Use this to find JS bottlenecks.
- **Systrace:** For native rendering bottlenecks.
- **FPS Monitor:** Always keep it active during development to catch drops.
