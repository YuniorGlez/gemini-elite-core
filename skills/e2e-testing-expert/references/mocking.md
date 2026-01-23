# Network Mocking & Interception

## Why Mock?
1. **Speed**: Skipping real network calls makes tests 5-10x faster.
2. **Stability**: Third-party APIs (Stripe, GitHub) can be down or have rate limits.
3. **Edge Case Testing**: Easily simulate 500 errors, timeouts, or malformed JSON.

---

### 1. Mocking a REST API
```typescript
test('shows error when API fails', async ({ page }) => {
  await page.route('**/api/user/*', route => {
    route.fulfill({
      status: 500,
      contentType: 'application/json',
      body: JSON.stringify({ error: 'Internal Server Error' }),
    });
  });

  await page.goto('/profile');
  await expect(page.getByText('API Error')).toBeVisible();
});
```

---

### 2. Mocking Images (Performance)
In E2E tests, you often don't need real images. Block them to save bandwidth and speed up page load.
```typescript
await page.route('**/*.{png,jpg,jpeg}', route => route.abort());
```

---

### 3. Har Replay (Advanced)
You can record real network traffic into a `.har` file and then replay it during tests for high-fidelity mocks.
```typescript
await page.routeFromHAR('tests/fixtures/api-snapshot.har', {
  url: '**/api/**',
  update: false,
});
```

---

### 4. Websocket Mocking
Playwright 2026 supports deep introspection and mocking of WebSocket messages, essential for real-time apps.
