# 4. Middleware & Advanced Patterns

**Impact: MEDIUM**

## 4.1 Immer for Nested State

Updating deeply nested objects is error-prone. The `immer` middleware allows you to write "mutative" code that stays immutable.

```typescript
import { immer } from 'zustand/middleware/immer';

export const useStore = create<MyStore>()(
  immer((set) => ({
    user: { profile: { address: { city: 'NY' } } },
    updateCity: (newCity: string) => 
      set((state) => {
        // Direct "mutation" is safe here
        state.user.profile.address.city = newCity;
      }),
  }))
);
```

## 4.2 Logging Middleware

You can create custom middleware for debugging.

```typescript
const log = (config) => (set, get, api) =>
  config(
    (...args) => {
      console.log('  applying', args);
      set(...args);
      console.log('  new state', get());
    },
    get,
    api
  );

export const useStore = create(log((set) => ({ /* ... */ })));
```

## 4.3 Testing Zustand Stores

Use Vitest to test your store logic in isolation.

```typescript
import { describe, it, expect, beforeEach } from 'vitest';
import { createCounterStore } from './counter-store';

describe('Counter Store', () => {
  let store;
  beforeEach(() => {
    store = createCounterStore();
  });

  it('increments count', () => {
    const { increment } = store.getState();
    increment();
    expect(store.getState().count).toBe(1);
  });
});
```

## 4.4 useSyncExternalStore

Zustand v5 is built on top of `useSyncExternalStore`. This ensures that your store is consistent with React's concurrent rendering features, preventing "tearing" where different parts of the UI show different state values in the same render.
