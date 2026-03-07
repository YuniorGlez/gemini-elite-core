---
name: harden-pro
id: harden-pro
version: 1.0.0
description: "Master of Interface Resilience & Production Edge Cases. Expert in error handling, internationalization (i18n), and extreme data constraints."
---

# 🛡️ Skill: Harden Pro (v1.0.0)

## Executive Summary
`harden-pro` is the guardian of interface stability. While `ui-ux-pro` focuses on the "Happy Path", `harden-pro` builds for **Production Reality**. This skill focuses on error handling, internationalization (text expansion/RTL), responsive text overflow, and network resilience. A hardened interface never breaks, it gracefully adapts.

---

## 📋 The Resilience Protocol

1.  **Extreme Input Test**: Simulate very long/short text, special characters, and massive datasets.
2.  **Error Scenario Audit**: Map network failures, API timeouts, and validation errors.
3.  **i18n Validation**: Check for text expansion (German/RTL) and logical properties.
4.  **Empty State Design**: Ensure every feature has a teaching empty state.
5.  **Sanitization**: Validate and sanitize all user-facing inputs.

---

## 🛠️ Mandatory Standards (2026)

### 1. Text Resilience (CSS)
- **Rule**: Never use fixed `width` or `height` for text containers.
- **Protocol**: Use `min-width: 0` for flex/grid items to prevent overflow. Use `line-clamp` for multi-line truncation and `hyphens: auto` for long strings.

### 2. Logical Properties (RTL Support)
- **Rule**: Avoid `left` / `right` / `width` / `height` based margins/padding.
- **Protocol**: Use `margin-inline`, `padding-block`, `inset-inline-start`. This ensures automatic support for Arabic, Hebrew, and other RTL scripts.

### 3. Graceful Error States
- **Rule**: No generic "Error occurred" messages.
- **Protocol**: Every error MUST provide:
  - Clear explanation of what happened.
  - Actionable recovery (Retry/Home button).
  - Friendly tone (Human-grade UX writing).

---

## 🚀 Show, Don't Just Tell (Implementation Patterns)

### Resilient Component (React 19)
```tsx
export function HardenList({ items, isLoading, error, onRetry }) {
  if (isLoading) return <SkeletonList count={5} />;
  
  if (error) return (
    <div className="p-6 border-red-500 bg-red-50 rounded-xl" role="alert">
      <p className="text-red-900 font-medium">Failed to load content.</p>
      <button onClick={onRetry} className="mt-2 text-red-700 underline">Try again</button>
    </div>
  );

  if (items.length === 0) return (
    <div className="flex flex-col items-center p-12 text-center">
      <IllustrationEmpty className="w-32 h-32 opacity-50" />
      <p className="mt-4 text-slate-600">No items found. Create your first one to get started.</p>
    </div>
  );

  return (
    <ul className="grid gap-4">
      {items.map(item => (
        <li key={item.id} className="min-w-0 break-words">
          {item.text}
        </li>
      ))}
    </ul>
  );
}
```

---

## 🚫 The "Do Not" List (Anti-Patterns)

1.  **DO NOT** assume English-length text. Always test +30% expansion.
2.  **DO NOT** ignore network timeouts. Always implement loading/error boundaries.
3.  **DO NOT** leave actions without feedback (Spinners/Optimistic UI).
4.  **DO NOT** use absolute positioning without considering overflow.
5.  **DO NOT** trust client-side data only.

---

## 📂 Progressive Disclosure

- [**Impeccable DNA**](../expert-instruction/references/IMPECCABLE_DNA.md): High-fidelity design standards.
- [**i18n & Logical Properties**](./references/i18n-standards.md): Global-first engineering.
- [**Error Boundary Patterns**](./references/error-handling-2026.md): React 19 resilience.
