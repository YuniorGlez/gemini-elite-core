# Animations & Timing in Remotion

## Deterministic Animation
Animations in Remotion MUST be deterministic. This means for a given `frame`, the output must always be the same.

### `interpolate()`
The workhorse of Remotion.
```tsx
import { interpolate, Easing } from 'remotion';

const opacity = interpolate(frame, [0, 30], [0, 1], {
  easing: Easing.bezier(0.33, 1, 0.68, 1),
  extrapolateRight: 'clamp',
});
```

### `spring()`
Physically-based animations.
```tsx
import { spring } from 'remotion';

const scale = spring({
  frame,
  fps,
  config: {
    damping: 200, // Smooth, no bounce
    stiffness: 100,
    mass: 1,
  },
});
```

### Interpolation Options
- `extrapolateLeft`: `'clamp' | 'extend' | 'identity'`
- `extrapolateRight`: `'clamp' | 'extend' | 'identity'`
- `easing`: `Easing.in`, `Easing.out`, `Easing.inOut`, `Easing.bezier`, etc.

## 2026 Patterns: sub-frame precision
In 2026, we use `useCurrentFrame()` which supports sub-frame precision if configured in the renderer, allowing for even smoother motion blur and high-refresh renders.

```tsx
const frame = useCurrentFrame(); // May be fractional in high-fidelity renders
```

---
*Updated: January 22, 2026 - 20:00*
