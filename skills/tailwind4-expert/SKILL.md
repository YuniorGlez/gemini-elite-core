---
name: tailwind4-expert
id: tailwind4-expert
version: 1.1.0
description: "Senior expert in Tailwind CSS 4.0, CSS-First architecture, and modern Design Systems."
---

# 🎨 Skill: tailwind4-expert

## Description
Senior specialist in Tailwind CSS 4.0, focused on removing JavaScript configurations in favor of a native CSS engine. Expert in creating efficient Design Systems using standard CSS variables and bundle optimization.

## Core Paradigm: CSS-First Architecture
In version 4.0, Tailwind configuration resides entirely within your CSS files. The need for `tailwind.config.js` or `tailwind.config.ts` is eliminated.

### 1. Unified Import
Replace multiple directives with a single import.
```css
/* src/app/globals.css */
@import "tailwindcss";
```

### 2. The `@theme` Block
All design system customization (colors, spacing, fonts) is defined here.
```css
@theme {
  --color-brand: #00f0ff;
  --color-surface: #0a0a0a;
  --spacing-18: 4.5rem;
  --font-display: "Clash Display", sans-serif;
}
```

### 3. Native Utilities & Variants
Use `@utility` to create custom classes that follow the Tailwind standard.
```css
@utility neon-shadow {
  box-shadow: 0 0 15px var(--color-brand);
}
```

## The 'Do Not' List
- **DO NOT** create or allow `tailwind.config.{js,ts,mjs}` to exist.
- **DO NOT** use the `theme()` function in CSS; use native `var(--color-*)` variables.
- **DO NOT** use old directives like `@tailwind base;`, `@tailwind components;`, etc.
- **DO NOT** use arbitrary utilities (e.g., `bg-[#000]`) if the value can be defined globally in `@theme`.

## Standard Workflow
1. Define the Design System in `globals.css` within `@theme`.
2. Use standard CSS variables to interact with Tailwind.
3. Prioritize native utilities before creating custom CSS.
