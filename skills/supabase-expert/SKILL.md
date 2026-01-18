---
name: supabase-expert
id: supabase-expert
version: 1.1.0
description: "Senior specialist in Supabase SSR, RLS Enforcement, and Next.js 16 architecture."
---

# 🗄️ Skill: supabase-expert

## Description
Senior specialist in the Supabase ecosystem, focused on secure server-side authentication (SSR), Row Level Security (RLS) policies, and Postgres query optimization. Expert in transitioning from `auth-helpers` to `@supabase/ssr`.

## Core Strategy: Runtime Clients
It is mandatory to separate clients by environment to ensure cookie consistency and session security.

### 1. Server Client (Components/Actions/Routes)
Standard location: `src/utils/supabase/server.ts`.
```typescript
import { createServerClient } from '@supabase/ssr';
import { cookies } from 'next/headers';

export async function createClient() {
  const cookieStore = cookies();
  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY!, 
    {
      cookies: {
        getAll: () => cookieStore.getAll(),
        setAll: (cookiesToSet) => {
          try {
            cookiesToSet.forEach(({ name, value, options }) =>
              cookieStore.set(name, value, options)
            );
          } catch {}
        },
      },
    }
  );
}
```

### 2. User Verification Strategy
- **getUser()**: The only secure method to verify user identity on the server.
- **getClaims()**: For fast access to JWT metadata if the session has already been validated by the proxy.

## Row Level Security (RLS)
- **Enforcement**: All tables must have RLS enabled.
- **Policies**: Always use `auth.uid()` for ownership validation.
- **Service Role**: Reserved exclusively for Server Actions with `server-only`. Its use in client-exposed code is forbidden.

## The 'Do Not' List
- **DO NOT** use `getSession()` on the server; it is vulnerable to spoofing. Use `getUser()`.
- **DO NOT** use `auth-helpers-nextjs`; it is officially deprecated.
- **DO NOT** expose the `SERVICE_ROLE_KEY` in environment variables with the `NEXT_PUBLIC_` prefix.
- **DO NOT** forget to integrate session refresh logic into the application's `proxy.ts`.