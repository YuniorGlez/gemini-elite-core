---
name: zustand-expert
id: zustand-expert
version: 1.1.0
description: "Senior State Architect in React 19, specialist in Zustand v5 and SSR Safety."
---

# 🧠 Skill: zustand-expert

## Description
Senior state architect for React 19 and Next.js 16 applications. Specialist in safe global state management for SSR (Server-Side Rendering), avoiding state contamination between requests and ensuring client consistency using Zustand v5.

## Core Architecture: Context-Based Stores
In SSR applications (Next.js), stores declared as global Singletons can cause data leaks between users. It is mandatory to use the Provider pattern.

### Implementation Blueprint
```tsx
// src/providers/store-provider.tsx
'use client';
import { createContext, useContext, useRef } from 'react';
import { useStore } from 'zustand';
import { createMyStore } from './my-store';

const StoreContext = createContext(null);

export const StoreProvider = ({ children }) => {
  const storeRef = useRef(createMyStore());
  return (
    <StoreContext.Provider value={storeRef.current}>
      {children}
    </StoreContext.Provider>
  );
}

export const useAppStore = (selector) => {
  const store = useContext(StoreContext);
  if (!store) throw new Error('Missing StoreProvider');
  return useStore(store, selector);
}
```

## Hydration & Persistence
- **Safety First**: The `persist` middleware with `localStorage` will cause hydration errors if not handled explicitly.
- **Protocol**: Always implement a hydration hook or use `useSyncExternalStore` to synchronize the persisted state after mounting.

## The 'Do Not' List
- **DO NOT** use global stores as Singletons in the root of files if the application uses SSR.
- **DO NOT** initialize the store state directly from `window` or `document`.
- **DO NOT** abuse global state; if the state belongs to a single form or local component, use `useState` or React 19's `useActionState`.

## Best Practices
1. **Selectors**: Always use specific selectors to avoid unnecessary renders (`state => state.value`).
2. **Actions**: Keep actions (functions that modify state) within the same store for better encapsulation.
3. **Immutability**: Zustand v5 handles immutability by default, but maintain clarity in nested object updates.
