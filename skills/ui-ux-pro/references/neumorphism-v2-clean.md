# Neumorphism v2: The "Clean Tactile" Style (2026)

Neumorphism v2 (or "Clean Neumorphism") moves away from heavy shadows and high-contrast gradients toward a more subtle, tactile, and professional aesthetic.

## 1. The v2 Palette

-   **Muted Colors**: Avoid stark white or pure black. Use soft slates, creams, and grays.
-   **Low Contrast Shadows**: Shadows should be barely visible, creating a "pressed" or "raised" effect without visual clutter.

## 2. Implementation with Tailwind 4

```css
@theme {
  --shadow-neumorphic-up: 5px 5px 10px #bebebe, -5px -5px 10px #ffffff;
  --shadow-neumorphic-down: inset 5px 5px 10px #bebebe, inset -5px -5px 10px #ffffff;
}
```

## 3. Best Practices

-   **Strategic Use**: Do not apply neumorphism to every element. Use it for buttons, toggles, and cards that require a tactile feel.
-   **Accessibility Fix**: Stark neumorphism often fails contrast tests. Ensure you include a 1px border (`border-slate-200/50`) to define the shape for low-vision users.

## 4. Light vs. Dark Mode

Neumorphism works best in light mode. For dark mode, use "Soft Glass" instead, as shadows are harder to perceive on dark backgrounds.

## 5. Interaction States

-   **Normal**: `shadow-neumorphic-up`.
-   **Active/Pressed**: `shadow-neumorphic-down` + slight background darkening.

---
*Updated: January 22, 2026 - 19:50*
