# Reference: High-Scale Laravel Performance & Queues

## Overview
Laravel 13 introduces advanced primitives for handling high-concurrency and background processing.

---

## ⚡ 1. Request Pooling (Concurrent I/O)
Using `Http::pool()` to fetch data from multiple external APIs simultaneously.

```php
$responses = Http::pool(fn (Pool $pool) => [
    $pool->as('github')->get('api.github.com/users/mgd34msu'),
    $pool->as('stripe')->get('api.stripe.com/v1/customers'),
]);

$githubData = $responses['github']->json();
```

---

## 📦 2. Caching Strategies 2026
- **Cache Tags:** Mandatory for clearing related data (e.g., all cache for `user_1`).
- **Cache::touch():** Extend TTL for session or rate-limit keys without the overhead of `get()` and `put()`.
- **Atomic Locks:** Using `Cache::lock()` to prevent race conditions in critical logic.

```php
Cache::lock('update_inventory_123', 10)->block(5, function () {
    // Critical section
});
```

---

## 🏃 3. Advanced Queues
- **Redis Horizon:** The only acceptable queue runner for Squaads production.
- **Job Middleware:** Use `RateLimited` and `ThrottlesExceptions` to protect external APIs.
- **Batching:** Grouping hundreds of jobs together and executing a callback once they all finish.

```php
Bus::batch([
    new ProcessPodcast($podcast1),
    new ProcessPodcast($podcast2),
])->then(function (Batch $batch) {
    // All jobs completed successfully...
})->dispatch();
```

---

## 📊 4. Database Optimization
- **Covering Indexes:** Ensuring the `SELECT` query is satisfied entirely by the index.
- **Lazy Loading Prevention:** Always run `Model::preventLazyLoading(! app()->isProduction())` in your `AppServiceProvider`.
- **Materialized Views:** Using database triggers to maintain "Read Models" for complex dashboards.
