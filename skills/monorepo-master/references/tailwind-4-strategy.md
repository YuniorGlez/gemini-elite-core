# Tailwind CSS 4 Monorepo Strategy (CSS-First)

## The Shift to CSS-First
In Tailwind 4, the `tailwind.config.js` is deprecated. Configuration is now handled directly in CSS using the `@theme` directive.

---

## Shared Theme Architecture
Create a dedicated package for your design tokens and Tailwind base.

### 1. `packages/tailwind-config/base.css`
```css
@import "tailwindcss";

@theme {
  --color-primary: #3b82f6;
  --color-secondary: #64748b;
  
  --font-sans: "Inter", sans-serif;
  
  --radius-xl: 1rem;
}

/* Base resets or common utility layers */
@layer base {
  body {
    @apply bg-background text-foreground;
  }
}
```

---

## Consumption in Applications
Apps import the shared base and can extend it locally.

### `apps/web/src/app/globals.css`
```css
/* Import shared monorepo theme */
@import "@repo/tailwind-config/base.css";

/* App-specific extensions */
@theme {
  --color-accent: #f59e0b;
}

/* Tailwind 4 native container queries */
.app-shell {
  @container;
}

@container (min-width: 600px) {
  .sidebar {
    display: block;
  }
}
```

---

## Handling Shared UI Packages
Shared packages (e.g., `@repo/ui`) should not bundle Tailwind. They should use standard classes that will be resolved when the main application compiles its CSS.

### Cross-Package Scanning
Ensure the application scans the shared packages for classes. In Tailwind 4, this is often handled by the compiler automatically if the files are part of the workspace, but explicit `@source` can be used if needed:

```css
@source "../../../packages/ui/src/**/*.tsx";
```

---

## Best Practices
1. **No Runtime Config**: Avoid passing configurations through JS/TS if possible. Use CSS variables.
2. **Container Queries**: Use `@container` for component-level responsiveness, making your shared UI packages truly modular and independent of viewport size.
3. **Atomic CSS**: Stick to the utility-first principle but leverage `@apply` sparingly in a shared `base.css` for truly global patterns.
