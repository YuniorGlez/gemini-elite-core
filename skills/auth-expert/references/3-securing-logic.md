# 3. Securing Server Actions & Components

**Impact: HIGH**

In 2026, the unified `auth()` call is the primary gatekeeper for all server-side logic.

## 3.1 Protection in Server Components

```tsx
import { auth } from "@/auth"

export default async function Dashboard() {
  const session = await auth()
  
  if (!session) return <div>Access Denied</div>
  
  return <div>Welcome, {session.user.name}</div>
}
```

## 3.2 Protection in Server Actions

Always re-verify the session inside the action.

```typescript
'use server'

import { auth } from "@/auth"

export async function updateProfile(formData: FormData) {
  const session = await auth()
  
  if (!session?.user?.id) {
    throw new Error("Unauthorized")
  }
  
  // Update DB...
}
```

## 3.3 Role-Based Access Control (RBAC)

Extend the session type to include roles.

```typescript
// auth.ts
callbacks: {
  async session({ session, token }) {
    if (token.sub && session.user) {
      session.user.id = token.sub
      session.user.role = token.role // Added role
    }
    return session
  },
}
```
Now you can check roles in your actions: `if (session.user.role !== 'admin') throw Error(...)`.
