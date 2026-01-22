# Reference: Security & Multi-tenancy (Laravel 13)

## Overview
Security in 2026 is "Zero-Trust." We assume the perimeter is breached and protect data at the row level.

---

## 🔒 1. Multi-tenancy Patterns
The Squaads standard prefers **Single Database, Column-based Isolation** using Global Scopes.

### The Tenant Scope
```php
class TenantScope implements Scope {
    public function apply(Builder $builder, Model $model) {
        $builder->where('tenant_id', tenant()->id);
    }
}
```

### Automatic ID Assignment
Use a `Trait` to ensure every new model automatically gets the `tenant_id`.

---

## 🛡️ 2. Advanced Security
- **Asymmetric Visibility (PHP 8.4):** Using `public private(set)` to prevent accidental state changes.
- **Content Security Policy (CSP):** Using `spatie/laravel-csp` to prevent XSS.
- **Signed URLs:** For sensitive downloads or email verification.

```php
return URL::temporarySignedRoute(
    'download.invoice', now()->addMinutes(30), ['user' => $user->id]
);
```

---

## 🔑 3. Secret Management
- **Encrypted Environment Files:** Use `php artisan env:encrypt` to keep secrets in Git safely.
- **Dynamic Secrets:** Integrating with AWS Secrets Manager or HashiCorp Vault for database credentials.

---

## 🚦 4. Rate Limiting & DoS Protection
Laravel's `RateLimiter` should be used not just for APIs, but for expensive business logic (e.g., "Export PDF").

```php
RateLimiter::for('exports', function (Request $request) {
    return Limit::perMinute(5)->by($request->user()->id);
});
```

---

## 🏁 Security Audit Checklist
- [ ] Are all sensitive fields encrypted at rest (`casts: ['secret' => 'encrypted']`)?
- [ ] Is `SQL Injection` protection verified (No raw queries without bindings)?
- [ ] Are `Mass Assignment` vulnerabilities closed (Using `fillable` or `guarded`)?
- [ ] Is `OIDC` used for admin authentication?
