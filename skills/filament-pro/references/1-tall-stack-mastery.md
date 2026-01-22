# Reference: TALL Stack Mastery (The Filament Engine)

## Overview
Filament is built on the **TALL Stack**. To be a Pro, you must master the synergy between these four technologies.

---

## ⚡ 1. Livewire 4 (The Heart)
In 2026, Livewire 4 is the standard. It uses a "Hybrid" approach where state is synchronized only when necessary.

### Best Practices:
- **Lazy Loading:** Use `#[Lazy]` for expensive components that shouldn't block the initial page load.
- **Computed Properties:** Use `#[Computed]` for derived data to avoid re-calculating on every render.
- **Entanglement:** Use `$wire.entangle()` for seamless state sharing between Livewire and Alpine.js.

---

## 🏔️ 2. Alpine.js (The Brain)
Alpine handles the "Micro-Interactions" that make Filament feel like a desktop app.

### Squaads Pattern: Custom Alpine Components
Instead of putting complex JS in your PHP, create an Alpine component in a separate file.

```javascript
// resources/js/components/file-uploader.js
export default () => ({
    dragging: false,
    handleDrop(e) { /* logic */ }
})
```

---

## 🎨 3. Tailwind 4 (The Skin)
Filament v4 uses Tailwind 4's "Oxide" engine for near-instant build times.

### Customizing the Panel
Use the `Filament::registerTheme()` method to inject custom CSS variables for branding.

```css
@theme {
  --color-primary-500: #ff5500; /* Squaads Orange */
}
```

---

## 🏗️ 4. Laravel (The Foundation)
Mastering the **Service Layer** ensures that your Filament logic is reusable in APIs or CLIs.

- **Actions:** Wrap business logic in classes (e.g., `CreateInvoiceAction`).
- **Events:** Use Livewire's `$this->dispatch()` to trigger logic in other parts of the panel without a page refresh.
