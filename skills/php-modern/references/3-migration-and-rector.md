# Reference: Migration & Rector (The 2026 Shift)

## Overview
Upgrading legacy PHP (7.x/8.0) to the 2026 Standard (8.5+) should be an automated process. We use **Rector** as the primary engine for "Instant Upgrades."

---

## 🏗️ 1. Rector Configuration
The Squaads `rector.php` configuration prioritizes modern language features and dead-code removal.

```php
use Rector\Config\RectorConfig;
use Rector\Set\ValueObject\LevelSetList;

return RectorConfig::configure()
    ->withPaths([__DIR__ . '/app', __DIR__ . '/tests'])
    ->withSets([
        LevelSetList::UP_TO_PHP_85,
        Rector\Set\ValueObject\SetList::DEAD_CODE,
        Rector\Set\ValueObject\SetList::CODE_QUALITY,
    ]);
```

---

## 🛠️ 2. The Migration Workflow
1.  **Analyze:** `vendor/bin/rector process --dry-run`
2.  **Apply:** `vendor/bin/rector process`
3.  **Audit:** Run `PHPStan` to find edge cases the automated refactor missed.
4.  **Verify:** Run the **Pest 3** test suite.

---

## 🔄 3. Key Refactors for 2026
- **Getter/Setter to Hooks:** Automatically convert boilerplate methods into property hooks.
- **Closure to First-Class Callables:** `array_map([$this, 'method'], $items)` -> `array_map($this->method(...), $items)`.
- **String concat to Pipe:** Convert nested function calls into readable pipelines.

---

## 🧪 4. Testing the Migration
Always include an architectural test (via Pest) to ensure no legacy features leak back in.

```php
// tests/ArchTest.php
arch('no legacy functions')
    ->expect(['var_dump', 'die', 'extract'])
    ->not->toBeUsed();

arch('use property hooks')
    ->expect('App\Models')
    ->toOnlyUsePropertyHooks(); // Custom Squaads Arch rule
```

---

## 📜 Summary
Migration in 2026 is **Continuous**. We don't do "Big Bang" upgrades; we keep the code in a "Ready-to-Refactor" state using automated tools.
