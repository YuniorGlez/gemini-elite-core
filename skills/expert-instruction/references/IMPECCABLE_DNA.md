# 💎 The Impeccable DNA (2026)
Reference for High-Performance, Anti-AI Slop Engineering.

## 🚫 The AI Slop Manifesto
Any interface that looks "AI-generated" is a failure of craftsmanship. Eradicate these fingerprints:

### Visual Tells (DON'T)
- **Generic Fonts**: Inter, Roboto, Arial, System defaults.
- **AI Palette**: Cyan-on-dark, purple-to-blue gradients, neon accents.
- **Lazy Shadows**: Rounded rectangles with generic drop shadows.
- **Glassmorphism**: Blur effects used decoratively without purpose.
- **Template Layouts**: Identical card grids (icon + heading + text), hero metric layouts.
- **Timid Scale**: Everything is medium-sized; no dramatic contrast.
- **Bounce Easing**: Avoid `bounce` or `elastic` easing; they feel dated.

### Visual Excellence (DO)
- **Bold Typography**: Distinctive display fonts + refined body fonts. Modular fluid scales (`clamp`).
- **OKLCH Color**: Perceptually uniform colors. 60/30/10 distribution.
- **Spatial Rhythm**: Varied spacing, intentional asymmetry, breaking the grid.
- **Meaningful Motion**: Natural deceleration (`ease-out-expo/quart`). 100ms-800ms durations.
- **Resilient Layouts**: Container queries, logical properties, expansion-aware design.

---

## 🛠️ The Impeccable Workflow

### 1. Pre-Flight Context
NEVER guess intent. Verify:
- Target Audience & Personas.
- Brand Personality (Brutally minimal vs Maximalist chaos vs ...).
- Technical & Performance constraints.

### 2. The AI Slop Test
"If I showed this to someone and said 'AI made this', would they believe me immediately?"
- If YES: Distill, Bolden, or Polish until the answer is NO.

### 3. Systematic Transformation
- **Distill**: Remove 20% of complexity to reveal 80% of value.
- **Bolden**: Increase contrast, scale, and character.
- **Harden**: Design for the "unideal" (long text, slow net, RTL, errors).
- **Normalize**: Align 100% with the established Design System.
- **Delight**: Add ONE signature interaction or micro-moment of joy.

---

## 📏 Technical Standards (2026)
- **Color**: Use `oklch()`, `color-mix()`, and `light-dark()`.
- **Layout**: Use `@container`, `grid-template-rows` for height transitions.
- **Motion**: `transform` and `opacity` only. Respect `prefers-reduced-motion`.
- **Typography**: Fluid type via `clamp()`. No hard-coded `px` for font sizes.
- **Resilience**: `min-width: 0` on flex/grid items, `word-wrap: break-word`.
