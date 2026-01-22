# Reference: Edge Orchestration (Vercel 2026)

## Strategy: The "Latency First" Architecture
In 2026, Squaads projects default to Edge for everything except complex compute or legacy dependencies.

## 🛠️ Runtime Selection Guide

### ⚡ The Edge Runtime
**Use for:**
- Middleware (Geo-blocking, Auth redirects).
- Personalization (A/B testing).
- Small API Route Handlers.

**Constraints:**
- No Node.js `fs` or `net` modules.
- 50MB memory limit (standard tier).
- 30s max execution time.

### ❄️ The Serverless (Bun) Runtime
**Use for:**
- Database heavy operations (Prisma).
- AI Prompt Processing.
- Heavy Image/PDF manipulation.

**Advantages in 2026:**
- Bun runtime virtually eliminates the "Cold Start Tax" of traditional Node.js.
- Full access to the Squaads utility library.

---

## 🏗️ Configuration in Next.js 16.2

### Route-Level Config
```tsx
// app/api/fast-proxy/route.ts
export const runtime = 'edge'; 

export async function GET() {
  return Response.json({ status: 'Global Priority' });
}
```

### Global Middleware
```tsx
// middleware.ts
export const config = {
  runtime: 'edge', // Mandatory for 2026 middleware
  matcher: ['/((?!api|_next/static|_next/image|favicon.ico).*)'],
}
```

---

## 📊 Monitoring Edge Performance
Use the **Vercel Edge Config** and **Edge Middleware Metrics** to track:
- **Middleware Execution Time:** Goal < 5ms.
- **Regional Latency:** Ensure users in Asia and Europe aren't paying a "round-trip to US-East-1" penalty.

## 🏁 Summary
Orchestration is the art of moving the code to the data. If the data is global (Edge Config), use Edge. If the data is in a regional DB, use Serverless in the same region as the DB.
