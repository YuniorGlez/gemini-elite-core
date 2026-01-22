# Reference: PHP Performance & JIT (2026)

## Overview
PHP's performance in 2026 is driven by the mature JIT (Just-In-Time) compiler and optimized internal extensions.

---

## 🚀 1. JIT Configuration
JIT is not always "better" for web applications. The Squaads standard uses **Tracing JIT** for I/O heavy apps.

### Optimal `php.ini` for 2026:
```ini
opcache.enable=1
opcache.enable_cli=1
opcache.jit_buffer_size=128M
opcache.jit=tracing
opcache.preload=/app/scripts/preload.php
```

---

## 💾 2. OPcache Preloading
Preloading allows you to compile your entire framework (Laravel/Filament) into memory once when the server starts.

**Benefit:** Zero file-system lookups during requests.
**Requirement:** You must restart the PHP-FPM service to apply code changes.

---

## ⛓️ 3. Persistent Handle Sharing (PHP 8.5)
PHP 8.5 allows cURL handles and other resource-like objects to persist across requests via the **cURL Share Handle** API.

```php
// Persistent connection pool for API calls
$sh = curl_share_init();
curl_share_setopt($sh, CURLSHOPT_SHARE, CURL_LOCK_DATA_CONNECT);
curl_share_setopt($sh, CURLSHOPT_SHARE, CURL_LOCK_DATA_SSL_SESSION);
```

---

## 📊 4. Memory Management
- **Fiber Orchestration:** Use PHP Fibers for concurrent I/O (Database calls + API calls) to prevent thread blocking.
- **Buffer Optimization:** Set `output_buffering = 4096` to align with modern OS page sizes.

---

## 🛠️ Performance Audit Checklist
- [ ] Is `opcache` enabled and has enough memory (`opcache.memory_consumption`)?
- [ ] Are expensive computations cached using `APCu` or `Redis`?
- [ ] Does the app use `json_validate` before `json_decode` to save memory on large invalid payloads?
- [ ] Are N+1 queries eliminated via Eloquent's `with()` or `load()`?
