# 4. Custom Providers & Callbacks

**Impact: MEDIUM**

Leveraging OAuth 2.1 and custom JWT logic in 2026.

## 4.1 Custom OAuth 2.1 Provider

```typescript
import type { Provider } from "next-auth/providers"

const CustomProvider: Provider = {
  id: "custom",
  name: "Custom SSO",
  type: "oidc",
  issuer: process.env.AUTH_CUSTOM_ISSUER,
  clientId: process.env.AUTH_CUSTOM_ID,
  clientSecret: process.env.AUTH_CUSTOM_SECRET,
}
```

## 4.2 Handling JWT Expiration

Always monitor `token.exp` to handle session timeouts gracefully.

```typescript
callbacks: {
  async jwt({ token, account, user }) {
    if (account && user) {
      return {
        ...token,
        accessToken: account.access_token,
        refreshToken: account.refresh_token,
      }
    }
    return token
  },
}
```

## 4.3 Error Handling

Implement a custom error page in `auth.ts`.

```typescript
pages: {
  signIn: '/auth/login',
  error: '/auth/error',
},
```
This prevents users from seeing generic Auth.js error screens and keeps them within your application's design system.
