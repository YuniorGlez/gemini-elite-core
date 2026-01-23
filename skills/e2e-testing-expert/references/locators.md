# Advanced Locators & Auto-Waiting

## The Role-Based Strategy
In 2026, we prioritize locators that match how a human (or a screen reader) perceives the UI.

### 1. `getByRole` (The Gold Standard)
Matches elements based on their ARIA role.
```typescript
await page.getByRole('button', { name: 'Submit' }).click();
await page.getByRole('heading', { level: 1 }).toBeVisible();
```

### 2. `getByText`
Best for verifying content.
```typescript
await expect(page.getByText('Success! Your order is placed.')).toBeVisible();
```

### 3. `getByLabel`
Perfect for form fields.
```typescript
await page.getByLabel('Username').fill('john_doe');
```

---

## Why avoid CSS/XPath?
- **Implementation Detail**: If you change `div.btn-primary` to `button.cta`, a CSS selector breaks, but `getByRole('button')` continues to work.
- **Accessibility**: Using role-based locators forces your team to write accessible HTML. If you can't find it by role, it's probably not accessible.

---

## Auto-Waiting (Web-First Assertions)
Playwright automatically waits for elements to be "Actionable" (Visible, Stable, Enabled, Editable).

### The "Elite" Assertion Pattern:
```typescript
// GOOD: Automatically waits up to 5s (default) for the condition to be met.
await expect(page.getByRole('alert')).toContainText('Error');

// BAD: Manually waiting for a specific time.
await page.waitForTimeout(3000); 
```

---

## Locating in Shadow DOM
Playwright locators pierce the Shadow DOM by default, so you don't need special configuration for modern Web Components.
