# Reference: CRDTs & Collaborative Editing

## Overview
Conflict-free Replicated Data Types (CRDTs) allow multiple users to edit the same data simultaneously without a central lock.

---

## 🛠️ 1. Selecting the Engine
- **Yjs:** The Squaads standard for text-based collaboration (Monaco, TipTap).
- **Automerge:** Preferred for "JSON-as-a-State" collaboration (Dashboards, Settings).

---

## 🔄 2. Syncing CRDTs over Ably
While Yjs has a default WebSocket provider, for production, we bridge Yjs updates over Ably for global persistence.

```typescript
const ydoc = new Y.Doc();
const ablyProvider = new AblyYjsProvider(ydoc, channel);

// When Yjs updates, it sends a 'delta' over the Ably channel
ydoc.on('update', (update) => {
  channel.publish('yjs-update', update);
});
```

---

## 🎭 3. Handling Presence
Seeing where other users are (Cursors).

### Squaads Standard for Cursors:
- **Interpolation:** Smooth the cursor movement on the client-side using `requestAnimationFrame`.
- **Throttling:** Only send cursor position every 50-100ms.

---

## 🚫 4. Common CRDT Mistakes
- **Document Bloat:** CRDTs store history. Use **Snapshotting** (LWW - Last Writer Wins) for fields that don't need history (e.g., "window_width").
- **Clock Drift:** While CRDTs don't require perfect clocks, massive drift can cause "Interleaving" (letters appearing out of order).
- **Security:** CRDT updates are opaque. You must validate the final state in an "Auditor" service.
