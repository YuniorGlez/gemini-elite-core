# Glassmorphism v3: Functional Depth (2026)

Glassmorphism v3 is smarter and more restrained, focusing on legibility and visual hierarchy rather than just transparency.

## 1. The "Liquid Glass" Formula

-   **Blur**: High backdrop blur (`backdrop-blur-xl`).
-   **Transparency**: Medium opacity (`bg-white/70` in light, `bg-black/40` in dark).
-   **Edge Lighting**: A subtle, bright border to define the edge (`border-white/20`).

## 2. Implementation Template

```tsx
<div className="bg-white/70 dark:bg-slate-900/40 backdrop-blur-xl border border-white/20 dark:border-slate-800/50 rounded-2xl p-6 shadow-xl">
  <h3 className="text-lg font-semibold">Glass Card</h3>
  <p className="text-slate-600 dark:text-slate-400">Content that feels integrated.</p>
</div>
```

## 3. Legibility Standards

Never place critical text over high-contrast glass backgrounds.
-   *Rule*: Use an overlay layer with 80%+ opacity if the background image is busy.

## 4. Layering and Z-Index

Glass layers create a natural sense of depth.
-   **Lower layer**: Subtle blur, lower opacity.
-   **Higher layer (Modal)**: High blur, higher opacity, prominent white border.

## 5. Micro-interactions

-   **Reflection**: Add a CSS shine effect on hover to simulate moving glass.
-   **Haptic feel**: Pair with 150ms transitions for a "liquid" response.

---
*Updated: January 22, 2026 - 19:50*
