# 1. SSR & Next.js 16 Pattern

**Impact: CRITICAL**

In SSR (Server-Side Rendering), creating a store as a global singleton is dangerous because it persists in memory across multiple requests, leading to data leakage between different users.

## 1.1 The Provider Pattern (Ref-based)

The standard for 2026 is to create a store instance *per request* and share it via React Context.

```tsx
// src/providers/store-provider.tsx
'use client';

import { createContext, useContext, useRef } from 'react';
import { useStore } from 'zustand';
import { createCounterStore, type CounterStore } from '@/stores/counter-store';

export const CounterStoreContext = createContext<CounterStore | null>(null);

export const CounterStoreProvider = ({ children }: { children: React.ReactNode }) => {
  // useRef ensures the store is created only once per client mount
  // but uniquely for every server request
  const storeRef = useRef<CounterStore>();
  if (!storeRef.current) {
    storeRef.current = createCounterStore();
  }

  return (
    <CounterStoreContext.Provider value={storeRef.current}>
      {children}
    </CounterStoreContext.Provider>
  );
};

export const useCounterStore = <T,>(selector: (store: CounterStore) => T): T => {
  const counterStoreContext = useContext(CounterStoreContext);

  if (!counterStoreContext) {
    throw new Error(`useCounterStore must be used within CounterStoreProvider`);
  }

  return useStore(counterStoreContext, selector);
};
```

## 1.2 Initializing State from Server Props

You can pass initial data from a Server Component to the store via the Provider.

```tsx
// In your store creator
export const createCounterStore = (initState: Partial<CounterState> = {}) => {
  return create<CounterStore>()((set) => ({
    count: 0,
    ...initState,
    increment: () => set((state) => ({ count: state.count + 1 })),
  }));
};

// In your Provider
export const CounterStoreProvider = ({ 
  children, 
  initialCount 
}: { 
  children: React.ReactNode, 
  initialCount: number 
}) => {
  const storeRef = useRef<CounterStore>();
  if (!storeRef.current) {
    storeRef.current = createCounterStore({ count: initialCount });
  }
  // ...
}
```

## 1.3 Why `useRef`?

Using `useRef` prevents the store from being re-created if the Provider component re-renders. This is crucial for maintaining state stability on the client.
