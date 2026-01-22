# Reference: Modern Patterns (PHP 8.4-8.6)

## Overview
PHP in 2026 is a functional and object-oriented hybrid. This reference details how to use modern primitives to solve architectural problems with less code.

---

## 🏗️ 1. Property Hooks: The End of Boilerplate
Property hooks (PHP 8.4) allow properties to have logic for reading and writing without explicit methods.

### Virtual Properties
A virtual property has a `get` hook but no actual storage in the object.

```php
readonly class Invoice {
    public function __construct(
        public float $amount,
        public float $taxRate,
    ) {}

    public float $total {
        get => $this->amount * (1 + $this->taxRate);
    }
}
```

---

## 🧩 2. Advanced Typing: DNF Types
Disjunctive Normal Form (DNF) types allow you to combine union and intersection types.

**Usage:** `(HasId&HasEmail)|GuestUser`
This ensures the variable is either a `GuestUser` OR it must satisfy BOTH `HasId` and `HasEmail` interfaces.

---

## 🔄 3. Functional Data Transformation
With the **Pipe Operator (`|>`)** and **Partial Function Application**, PHP code becomes much more readable.

### The "Squaads Pipeline" Pattern
```php
$processOrder = fn ($order) => $order
    |> $this->validate(?)
    |> $this->calculateDiscount(?, $coupon)
    |> $this->save(?);
```
*Note: The `?` is a placeholder for the value being piped.*

---

## 💎 4. Immutability with `Clone With`
PHP 8.5 introduced a native way to update immutable objects.

**Old way (Wither pattern):**
```php
public function withStatus(Status $status): self {
    $clone = clone $this;
    $clone->status = $status;
    return $clone;
}
```

**New way (2026 Standard):**
```php
$updatedOrder = clone $order with ['status' => Status::Paid];
```

---

## 🚫 5. Avoiding the "Object-Array" Trap
In 2026, we avoid using associative arrays for structured data. Use **Readonly Classes** and **Enums**.

```php
// WRONG
$data = ['id' => 1, 'role' => 'admin'];

// RIGHT
readonly class UserData {
    public function __construct(
        public int $id,
        public Role $role
    ) {}
}
```
