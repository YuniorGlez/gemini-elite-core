---
name: animate-pro
id: animate-pro
version: 1.0.0
description: "Master of Purposeful Motion & Micro-interactions. Expert in natural easing, GPU-accelerated animations, and Framer Motion for high-end interfaces."
---

# 🎞️ Skill: Animate Pro (v1.0.0)

## Executive Summary
`animate-pro` is the specialist responsible for bringing interfaces to life through purposeful, high-performance motion. In 2026, animation is not decoration; it is **Communication**, **Feedback**, and **Delight**. This skill focuses on natural deceleration, accessibility-first motion (`prefers-reduced-motion`), and technical excellence to ensure 120fps experiences.

---

## 📋 The Motion Protocol

1.  **Assess Opportunity**: Identify static areas lacking feedback or jarring transitions.
2.  **Gather Context**: Define brand personality (Playful vs Serious) and audience.
3.  **DNA Alignment**: Consult `IMPECCABLE_DNA.md` for mandatory easing and duration standards.
4.  **Implementation**: Use `transform` and `opacity` to ensure GPU acceleration.
5.  **A11y Check**: Implement reduced-motion alternatives.

---

## 🛠️ Mandatory Standards (2026)

### 1. The Easing Canon (No CSS Defaults)
Avoid `linear` or standard `ease`. Use natural, exponential deceleration:
- **Refined**: `cubic-bezier(0.25, 1, 0.5, 1)` (ease-out-quart)
- **Snappy**: `cubic-bezier(0.22, 1, 0.36, 1)` (ease-out-quint)
- **Confident**: `cubic-bezier(0.16, 1, 0.3, 1)` (ease-out-expo)
- **🚫 NEVER**: Use `bounce` or `elastic` easing (AI Slop indicators).

### 2. Purposeful Durations
- **100-150ms**: Instant feedback (Toggles, button clicks).
- **200-300ms**: State changes (Hover, menu reveals).
- **300-500ms**: Layout changes (Accordions, modals).
- **500-800ms**: Entrance choreography (Page loads).

### 3. GPU-First Execution
- **Rule**: ONLY animate `transform` (scale, translate, rotate) and `opacity`.
- **Protocol**: Avoid animating `width`, `height`, `top`, or `padding` to prevent layout thrashing. Use `grid-template-rows` for height-reveals.

---

## 🚀 Show, Don't Just Tell (Implementation Patterns)

### Framer Motion Staggered Entrance (React 19)
```tsx
import { motion } from "framer-motion";

const container = {
  hidden: { opacity: 0 },
  show: {
    opacity: 1,
    transition: { staggerChildren: 0.1, ease: [0.16, 1, 0.3, 1] }
  }
};

const item = {
  hidden: { opacity: 0, y: 20 },
  show: { opacity: 1, y: 0 }
};

export const StaggeredList = ({ items }) => (
  <motion.ul variants={container} initial="hidden" animate="show">
    {items.map(i => <motion.li key={i} variants={item}>{i}</motion.li>)}
  </motion.ul>
);
```

---

## 🚫 The "Do Not" List (Anti-Patterns)

1.  **DO NOT** animate layout properties (e.g., `margin`, `width`).
2.  **DO NOT** block user interaction during long animations.
3.  **DO NOT** animate everything. "Animation fatigue" is a design failure.
4.  **DO NOT** use default CSS easing. It feels robotic and generic.
5.  **DO NOT** ignore `prefers-reduced-motion`.

---

## 📂 Progressive Disclosure

- [**Impeccable DNA**](../expert-instruction/references/IMPECCABLE_DNA.md): High-fidelity design standards.
- [**Motion Physics**](./references/motion-physics.md): Spring vs Tweening in 2026.
- [**Accessibility in Motion**](./references/a11y-motion.md): Designing for sensitivity.
