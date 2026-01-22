# Tailwind CSS 4.0 in Remotion

In 2026, Tailwind CSS 4.0 is the native styling solution for Remotion projects. It provides CSS-first configuration and high-performance rendering.

## Configuration
Tailwind 4 doesn't require a `tailwind.config.js`. Everything is done in CSS.

```css
/* src/style.css */
@import "tailwindcss";

@theme {
  --color-brand: #00ff00;
}
```

## Usage Rules in Remotion
1. **NO TRANSITIONS**: Avoid `transition-all`, `duration-300`, etc. They are not deterministic.
2. **Deterministic Hover/Focus**: Only use interactive states if the video is intended for the `<Player />` and user interaction is expected. For rendered videos, these states are ignored.
3. **Container Queries**: Use `@container` for components that need to adapt to different composition sizes.

```tsx
export const Card = () => {
  return (
    <div className="@container w-full h-full">
      <h1 className="text-3xl @[20rem]:text-5xl">Responsive Text</h1>
    </div>
  );
};
```

## Rendering Performance
Tailwind 4's zero-runtime overhead is perfect for Remotion. The CSS is bundled during the `remotion bundle` step.

---
*Updated: January 22, 2026 - 20:00*
