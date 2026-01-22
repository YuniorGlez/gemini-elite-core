# Reference: Ably LiveSync & Guaranteed Delivery

## Overview
Ably provides the infrastructure for "Guaranteed" real-time. Where WebTransport is the "Pipe," Ably is the "Orchestrator."

---

## ⛓️ 1. Sequence Tracking
Every message in an Ably channel has a `sequenceId`. This is critical for data integrity.

### The "Rewind" Pattern
If a client reconnects after 10 seconds, it uses the `rewind` parameter to fetch only the missed messages.
```typescript
const channel = ably.channels.get('orders', {
  params: { rewind: '1m' } // Last 1 minute of history
});
```

---

## 🏗️ 2. The Transactional Outbox (Deep Dive)
To ensure the DB and Ably are in sync, use a "Job" that polls the `realtime_outbox` table.

1.  **DB Transaction:** Write the data + Write to Outbox.
2.  **CDC Worker:** Reads Outbox -> Pushes to Ably -> Marks Outbox as 'Sent'.
3.  **Client:** Receives message -> Updates Local State.

---

## 🌍 3. Global Edge Splicing
Ably's "Splicing" feature allows you to combine multiple real-time streams at the edge, reducing the number of connections the mobile device has to maintain.

---

## 🏁 Quality Checklist
- [ ] Is `autoConnect` enabled?
- [ ] Are `Presence` heartbeats tuned for the device's battery life?
- [ ] Does the client handle `REJECTED` or `SUSPENDED` states gracefully with a UI banner?
