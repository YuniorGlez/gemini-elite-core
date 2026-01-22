# Reference: Panel Architecture & Multi-Tenancy

## Overview
Filament's "Panel" system allows you to build multiple distinct apps (Admin, User, Partner) within the same Laravel installation.

---

## 🏗️ 1. The Multi-Panel Strategy
Define panels in `app/Providers/Filament/`:

- **AdminPanelProvider:** Full system access.
- **AppPanelProvider:** Client-facing dashboard.
- **PartnerPanelProvider:** Limited access for external vendors.

### Sharing Resources
You can share resources across panels by registering them in both providers, or keep them separate for security.

---

## 🔒 2. Multi-Tenancy (2026 Standard)
Filament has first-class support for multi-tenancy.

### Configuration:
```php
$panel->tenant(Team::class)
      ->tenantRegistration(RegisterTeam::class)
      ->tenantProfile(EditTeamProfile::class);
```

### Automatic Scoping:
Once a tenant is set, Filament automatically scopes all database queries to the current tenant using a global `where` clause.

---

## 🎨 3. White-Labeling & Branding
Use custom `RenderHooks` to inject content (e.g., support chat, branding banners) without modifying the core views.

```php
FilamentView::registerRenderHook(
    PanelsRenderHook::BODY_END,
    fn (): View => view('support-chat'),
);
```

---

## 🚀 4. Performance Audit
- **Deferred Loading:** Always defer heavy table columns (`->deferred()`).
- **Icons:** Use `heroicons` via the cache-optimized SVG provider.
- **Translations:** For multi-lingual panels, use `spatie/laravel-translatable` with the Filament wrapper.
