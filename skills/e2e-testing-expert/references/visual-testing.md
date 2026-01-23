# Visual Regression Strategies

## Snapshot Testing
Visual regression compares a screenshot of the current UI with a "Baseline" (Gold standard) image.

```typescript
await expect(page).toHaveScreenshot('dashboard.png');
```

---

## Handling Dynamic Data
If your UI includes a clock, a greeting (e.g., "Hello, John"), or random IDs, your visual tests will flake.

### 1. Masking
Hides specific elements with a solid color before taking the screenshot.
```typescript
await expect(page).toHaveScreenshot({
  mask: [page.getByTestId('timestamp'), page.getByRole('complementary')]
});
```

### 2. Mocking Time
Use `page.addInitScript` to freeze or mock the system time.

---

## Tolerance (Thresholds)
Small rendering differences (due to OS or font version) shouldn't fail the build.
- `maxDiffPixels`: Maximum number of pixels that can be different.
- `maxDiffPixelRatio`: Maximum ratio of pixels that can be different.

```typescript
await expect(page).toHaveScreenshot({ maxDiffPixelRatio: 0.1 });
```

---

## Baseline Management
- Store baselines in Git (using LFS for large binary files).
- Update baselines only after manual verification: `npx playwright test --update-snapshots`.
- Use separate baselines for different browsers/OS if they render significantly differently.
