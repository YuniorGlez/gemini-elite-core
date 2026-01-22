# 2. The Slices Pattern

**Impact: HIGH**

For large applications, a single store file becomes unmaintainable. The Slices Pattern allows you to split your store into functional modules while maintaining a single cohesive state tree.

## 2.1 Defining Slices

A slice is a function that returns a part of the state and actions.

```typescript
// src/stores/slices/user-slice.ts
import { StateCreator } from 'zustand';

export interface UserSlice {
  name: string;
  setName: (name: string) => void;
}

export const createUserSlice: StateCreator<UserSlice & AuthSlice, [], [], UserSlice> = (set) => ({
  name: '',
  setName: (name) => set({ name }),
});
```

## 2.2 Combining Slices into a Bound Store

Combine all slices in a single `create` call.

```typescript
// src/stores/root-store.ts
import { create } from 'zustand';
import { createUserSlice, type UserSlice } from './slices/user-slice';
import { createAuthSlice, type AuthSlice } from './slices/auth-slice';

export type RootStore = UserSlice & AuthSlice;

export const useStore = create<RootStore>()((...a) => ({
  ...createUserSlice(...a),
  ...createAuthSlice(...a),
}));
```

## 2.3 Accessing Other Slices

Because all slices share the same `set` and `get`, you can interact with other slices easily.

```typescript
export const createAuthSlice: StateCreator<UserSlice & AuthSlice> = (set, get) => ({
  isLoggedIn: false,
  login: () => {
    set({ isLoggedIn: true });
    console.log(`User ${get().name} logged in`); // Accessing UserSlice state
  },
});
```

## 2.4 Best Practices for Slices
- **Atomic Actions**: Keep actions close to the data they modify.
- **Type Safety**: Use the `StateCreator` type to ensure slices have access to the combined store type.
- **Avoid Duplication**: Don't repeat state keys across slices.
