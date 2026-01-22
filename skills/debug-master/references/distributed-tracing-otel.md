# Distributed Tracing with OpenTelemetry (2026)

In 2026, tracing is the "Source of Truth" for complex, microservice-based architectures. OpenTelemetry (OTel) is the industry standard for collecting and propagating trace context.

## 1. The Core Concepts

-   **Span**: The basic building block. Represents a single operation (e.g., an HTTP request, a database query).
-   **Trace**: A DAG of spans representing the end-to-end journey of a request.
-   **Context Propagation**: Passing the `trace_id` through headers (e.g., `W3C Trace Context`) to link spans across services.

## 2. Standardized Naming & Metadata

Adopt a strict naming convention to make traces searchable.

-   **Span Name**: `[METHOD] [PATH]` (e.g., `POST /api/v1/checkout`).
-   **Common Attributes**:
    -   `service.name`: `checkout-service`
    -   `deployment.environment`: `production`
    -   `user.id`: `uuid_123`
    -   `error.type`: `StripeCardError`

## 3. Auto-Instrumentation in 2026

Leverage OTel auto-instrumentation for Node.js/Bun.

```typescript
import { registerInstrumentations } from '@opentelemetry/instrumentation';
import { HttpInstrumentation } from '@opentelemetry/instrumentation-http';
import { PrismaInstrumentation } from '@prisma/instrumentation';

registerInstrumentations({
  instrumentations: [
    new HttpInstrumentation(),
    new PrismaInstrumentation(),
  ],
});
```

## 4. Adaptive Sampling Strategy

Don't capture 100% of traffic—it's too expensive.

-   **Error Sampling**: Capture 100% of traces that contain an error.
-   **Latency Sampling**: Capture 100% of traces where `duration > 200ms`.
-   **Baseline**: Capture 1% of stable, healthy traffic for performance benchmarks.

## 5. Visualizing the Observability Graph

Use tools like **Honeycomb** or **Jaeger** to visualize the flow. In 2026, AI agents use these graphs to instantly identify the "Service in Red" without manual log exploration.

---
*Updated: January 22, 2026 - 18:25*
