# Microservices & Transports (NestJS 2026)

NestJS is the premier framework for building distributed systems in the Node/Bun ecosystem.

## 1. Selecting the Right Transport

| Transport | Best For | Pros |
| :--- | :--- | :--- |
| **NATS** | Real-time, Async | Ultra-fast, lightweight, built-in load balancing. |
| **gRPC** | Internal APIs | Type-safe (Protobuf), high performance, streaming. |
| **MQTT** | IoT | Low bandwidth, reliable over shaky networks. |
| **RabbitMQ** | Complex Routing | Battle-tested, complex exchange logic. |

## 2. NATS JetStream (The 2026 Standard)
Use JetStream for message persistence and "at-least-once" delivery guarantees.

```typescript
// main.ts
const app = await NestFactory.createMicroservice<MicroserviceOptions>(AppModule, {
  transport: Transport.NATS,
  options: {
    servers: ['nats://localhost:4222'],
    jetstream: true,
  },
});
```

## 3. Resilience Patterns
Always implement timeouts and retries in your microservice clients using RxJS.

```typescript
this.client
  .send('pattern', data)
  .pipe(
    retry(3),
    timeout(5000),
    catchError(err => handleDistributedError(err))
  );
```

---
*Updated: January 23, 2026*
