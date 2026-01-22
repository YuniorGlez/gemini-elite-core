# Advanced Performance & Rendering

## Parallel Rendering
Remotion 4.0 leverages multi-core rendering by default.

### `prefetch()`
Use `prefetch()` to start loading heavy assets before they are needed.
```tsx
import { prefetch } from 'remotion';

const { free, waitUntilDone } = prefetch('https://example.com/video.mp4');
```

## Offscreen Rendering
Avoid rendering elements that are not visible.

```tsx
const frame = useCurrentFrame();
const isVisible = frame > 100 && frame < 200;

return isVisible ? <HugeComponent /> : null;
```

## 2026 Rendering: Lambda vs Cloud Run
- **Lambda**: Best for short, bursty renders.
- **Cloud Run**: Best for long-form content (> 15 mins) where Lambda timeouts might occur.

---
*Updated: January 22, 2026 - 20:00*
