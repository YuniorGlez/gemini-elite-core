# Reference: Local Data & Persistence (Expo 2026)

## Overview
For 2026 mobile apps, data persistence is critical for offline-first experiences. We use **Expo SQLite** as our primary relational engine.

---

## 🗄️ 1. Expo SQLite (Next Gen)
Expo SQLite now supports a high-performance, synchronous API that matches the speed of native SQLite.

### Best Practice: The Repository Pattern
```typescript
import * as SQLite from 'expo-sqlite';

const db = SQLite.openDatabaseSync('squaads.db');

export const UserRepository = {
  getById: (id: number) => {
    return db.getFirstSync('SELECT * FROM users WHERE id = ?', [id]);
  }
};
```

---

## 📂 2. File System Management
`expo-file-system` is used for storing large blobs (Images, PDFs, Audio).

- **Cache vs Document:** Use `CacheDirectory` for transient data (can be deleted by OS) and `DocumentDirectory` for permanent user data.
- **Resumable Downloads:** For large AI model weights or video assets.

---

## 🔄 3. State Synchronization
Combining **Zustand** (with `persist` middleware) and **Expo SQLite**.

```typescript
import { create } from 'zustand';
import { persist, createJSONStorage } from 'zustand/middleware';
import { mmkvStorage } from './mmkv-adapter';

export const useStore = create(
  persist(
    (set) => ({ ... }),
    {
      name: 'app-storage',
      storage: createJSONStorage(() => mmkvStorage),
    }
  )
);
```
*Note: We use MMKV for high-speed key-value storage and SQLite for relational data.*

---

## 🏁 Persistence Checklist
- [ ] Is sensitive data encrypted before storage?
- [ ] Are SQLite migrations handled correctly on app updates?
- [ ] Is the app size monitored (SQLite databases can grow large)?
- [ ] Is there a "Sync" indicator for background data uploads?
