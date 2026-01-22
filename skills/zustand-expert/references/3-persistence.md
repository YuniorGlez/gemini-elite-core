# 3. Persistence & Hydration

**Impact: HIGH**

Using `persist` middleware with `localStorage` is common, but it requires careful handling in SSR environments to avoid "Hydration Mismatch" errors.

## 3.1 Basic Persistence

```typescript
import { persist } from 'zustand/middleware';

export const useStore = create<MyStore>()(
  persist(
    (set) => ({ /* ... */ }),
    { name: 'app-storage' }
  )
);
```

## 3.2 Handling Hydration in Next.js

Because `localStorage` only exists on the client, the server will render with the initial state, while the client will try to render with the persisted state. This causes a mismatch.

### The Standard Fix: `skipHydration`

Manually trigger hydration in a `useEffect` inside your Client Component or Provider.

```typescript
// store.ts
export const useStore = create<MyStore>()(
  persist(
    (set) => ({ /* ... */ }),
    { 
      name: 'app-storage',
      skipHydration: true, // Don't hydrate automatically
    }
  )
);

// client-component.tsx
import { useEffect } from 'react';

export function MyComponent() {
  const hydrate = useStore(s => s.rehydrate); // provided by persist
  
  useEffect(() => {
    useStore.persist.rehydrate();
  }, []);

  // ...
}
```

## 3.3 Schema Versioning and Migration

If you change your state structure, you must handle migration for existing users' `localStorage`.

```typescript
persist(
  (set) => ({ /* ... */ }),
  {
    name: 'app-storage',
    version: 2, // Increment version
    migrate: (persistedState: any, version: number) => {
      if (version === 1) {
        // Transform old state to new state
        return { ...persistedState, newField: 'default' };
      }
      return persistedState;
    },
  }
)
```

## 3.4 Partial Persistence

Use `partialize` to only save specific fields.

```typescript
persist(
  (set) => ({ user: null, theme: 'dark', temp: 0 }),
  {
    name: 'settings',
    partialize: (state) => ({ theme: state.theme }), // Only saves 'theme'
  }
)
```
