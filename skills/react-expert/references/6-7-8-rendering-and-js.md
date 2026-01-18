# 6. Rendering Performance

**Impact: MEDIUM**

## 6.1 Animate SVG Wrapper Instead of SVG Element

Wrap SVG in a `<div>` and animate the wrapper instead to enable hardware acceleration.

## 6.2 CSS content-visibility for Long Lists

Apply `content-visibility: auto` to defer off-screen rendering.

## 6.3 Hoist Static JSX Elements

Extract static JSX outside components to avoid re-creation.

## 6.4 Optimize SVG Precision

Reduce SVG coordinate precision to decrease file size.

## 6.5 Prevent Hydration Mismatch Without Flickering

Use synchronous inline scripts to inject client-side state (like themes) before React hydrates.

## 6.6 Use Activity Component for Show/Hide

Use React's `<Activity>` to preserve state/DOM for components that frequently toggle visibility.

## 6.7 Use Explicit Conditional Rendering

Use ternary operators (`? :`) instead of `&&` for numbers/strings to avoid rendering `0` or `NaN`.

---

# 7. JavaScript Performance

**Impact: LOW-MEDIUM**

## 7.1 Batch DOM CSS Changes

Group multiple CSS changes together via classes or `cssText`.

## 7.2 Build Index Maps for Repeated Lookups

Use a `Map` instead of multiple `.find()` calls on the same array.

## 7.3 Cache Property Access in Loops

Cache object property lookups in hot paths.

## 7.4 Cache Repeated Function Calls

Use a module-level Map to cache function results during render.

## 7.5 Cache Storage API Calls

`localStorage` and `document.cookie` are expensive. Cache reads in memory.

## 7.6 Combine Multiple Array Iterations

Combine multiple `.filter()` or `.map()` calls into one loop.

## 7.7 Early Length Check for Array Comparisons

Check lengths first before doing expensive deep comparisons.

## 7.8 Early Return from Functions

Return immediately when the result is determined.

## 7.9 Hoist RegExp Creation

Don't create RegExp inside render loops.

## 7.10 Use Loop for Min/Max Instead of Sort

Finding min/max is O(n), sorting is O(n log n).

## 7.11 Use Set/Map for O(1) Lookups

Convert arrays to Set for repeated membership checks.

## 7.12 Use toSorted() Instead of sort() for Immutability

`.sort()` mutates the array; `.toSorted()` creates a new one.

---

# 8. Advanced Patterns

## 8.1 Store Event Handlers in Refs

Use `useEffectEvent` or refs for stable subscriptions.

## 8.2 useLatest for Stable Callback Refs

Access latest values in callbacks without adding them to dependency arrays.
