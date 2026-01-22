# Reference: WebTransport Mastery (2026)

## Overview
WebTransport is the HTTP/3-powered replacement for WebSockets. It allows for multiple streams within a single connection and supports both reliable and unreliable data.

---

## 🛠️ 1. Stream Types
Unlike WebSockets, WebTransport gives you choices:

- **Unidirectional Streams:** Perfect for one-way state updates (e.g., coordinates).
- **Bidirectional Streams:** For request-response loops or heavy handshakes.
- **Datagrams:** UDP-like, unreliable delivery. Ideal for high-frequency game state where losing one frame is better than waiting for a retransmission.

---

## 🚀 2. Implementation: The Squaads Worker Pattern
We typically handle WebTransport inside a **Web Worker** to prevent blocking the UI thread.

```javascript
// transport.worker.js
const transport = new WebTransport(url);
const stream = await transport.createUnidirectionalStream();
const writer = stream.writable.getWriter();

self.onmessage = ({data}) => {
  writer.write(encode(data));
};
```

---

## 💾 3. Congestion Control
WebTransport has built-in congestion control. In 2026, we use the **BBR v3** algorithm to maximize throughput without causing "Bufferbloat."

**Key metric:** Monitor `transport.getStats()` to identify if the user's network is saturating.

---

## 🚫 4. Common Pitfalls
- **Certificate Errors:** WebTransport requires a specific hash-based authentication if not using a standard CA.
- **Firewall Blocking:** Some enterprise firewalls still block UDP (HTTP/3). Always implement a **WebSocket Fallback**.
- **Stream Leaks:** Failing to close streams when a component unmounts will quickly crash the transport.
