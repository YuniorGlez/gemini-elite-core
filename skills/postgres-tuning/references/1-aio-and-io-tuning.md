# Reference: AIO & I/O Tuning (PostgreSQL 18)

## Overview
PostgreSQL 18 introduces a game-changing **Asynchronous I/O (AIO)** subsystem. Historically, Postgres was limited by synchronous syscalls; now, it can pipeline multiple I/O requests.

---

## 🏗️ 1. Configuring AIO
Depending on your OS, there are two primary methods:

### `io_method = worker`
Uses background worker processes to handle I/O. Best for managed cloud environments (RDS, Supabase) or non-Linux OS.
- **Tuning:** Set `io_workers` to roughly the number of storage channels (NVMe queues).

### `io_method = io_uring` (Linux Only)
The gold standard for performance. Directly interacts with the Linux kernel's high-speed I/O interface.
- **Requirement:** Kernel 5.10+ and a recent version of `liburing`.

---

## 🚀 2. Shared Buffer Tuning
The `shared_buffers` is your "Hot Data" cache.

- **Baseline:** 25% of System RAM.
- **2026 Shift:** With AIO, we can sometimes increase this to **40-50%** if the workload is heavily read-biased, as AIO reduces the CPU cost of cache misses.

---

## 📈 3. Monitoring with `pg_stat_io`
This view provides the "Internal Story" of your I/O.

```sql
SELECT backend_type, io_object, io_context, reads, writes, extend 
FROM pg_stat_io;
```
**What to look for:**
- `extend`: High numbers indicate a table is growing too fast for its fill-factor.
- `evictions`: High numbers in Shared Buffers mean your cache is too small.

---

## 🚫 4. Checkpoint Tuning
Checkpoints are the most common cause of "Latency Spikes."

```ini
checkpoint_timeout = 30min
max_wal_size = 16GB
checkpoint_completion_target = 0.9 # Smooth the write over 90% of the timeout
```
**Goal:** Avoid the "I/O Storm" by spreading writes evenly over time.
