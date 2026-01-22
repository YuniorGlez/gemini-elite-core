# Reference: Modular Monoliths & Hexagonal Laravel

## Overview
In 2026, the Squaads standard for large-scale Laravel apps is the **Modular Monolith**. This avoids the complexity of microservices while providing the isolation needed for large teams.

---

## 🏗️ 1. The Module Structure
Each module should be self-contained, owning its own database migrations, routes, and views.

```text
app/Modules/OrderManagement/
├── Actions/          # Business Logic (Single Responsibility)
├── Contracts/        # Interfaces for Cross-Module communication
├── DataTransfer/     # DTOs
├── Models/           # Eloquent Models (Internal to module)
├── Providers/        # Module-specific Service Providers
└── UI/               # Controllers and Livewire Components
```

---

## 🔌 2. Cross-Module Communication
Modules should never directly import each other's Models. They should communicate via **Interfaces** or **Events**.

### WRONG:
`use App\Modules\User\Models\User;` (Inside Order module)

### RIGHT (2026 Standard):
```php
// OrderModule calling UserModule
$user = $this->userModule->findUser($id); 
```

---

## 🏛️ 3. Hexagonal (Ports & Adapters)
Laravel is the "Adapter." Your business logic (the "Core") should not depend on Laravel specific classes if possible.

- **Port:** An Interface (e.g., `SmsProviderInterface`).
- **Adapter:** The Implementation (e.g., `TwilioSmsProvider` or `LogSmsProvider`).

```php
// Inside an Action
public function __construct(
    protected SmsProviderInterface $sms // Port
) {}

public function execute() {
    $this->sms->send(...); // Logic is independent of the provider
}
```

---

## 🔄 4. Transitioning to Modules
If you have a legacy "Flat" app, use the **Strangler Pattern**:
1.  Identify a cohesive feature (e.g., "Invoicing").
2.  Create a new Module.
3.  Move logic and models to the Module one by one.
4.  Redirect old routes to the new Module UI.
