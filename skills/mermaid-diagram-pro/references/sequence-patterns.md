# Advanced Sequence Diagram Patterns

## 1. Activations & Lifelines
Clearly show when an object is "busy" using `activate` and `deactivate` (or the `+`/`-` shorthand).

```mermaid
sequenceDiagram
    User->>+Service: Call API
    Service-->>-User: Return Data
```

---

## 2. Loops (Repetitive Actions)
Use `loop` for actions that repeat until a condition is met.

```mermaid
sequenceDiagram
    loop Every 5 seconds
        HealthCheck->>Service: Ping
        Service-->>HealthCheck: Pong
    end
```

---

## 3. Alternatives (Conditional Logic)
Use `alt` and `else` to show branching paths.

```mermaid
sequenceDiagram
    Agent->>Database: Query User
    alt User exists
        Database-->>Agent: User Object
    else User not found
        Database-->>Agent: Error 404
    end
```

---

## 4. Parallel Actions
Use `rect` (rectangle) or simply grouped messages to show parallel interactions, although Mermaid doesn't have a strict `par` tag, you can use `Parallel` notes.

---

## 5. Critical Sections
Use `critical` for operations that must succeed or fail as a unit.

```mermaid
sequenceDiagram
    critical Transaction
        Service->>Bank: Deduct
        Service->>Database: Update Balance
    option Network Failure
        Service->>User: Retry
    end
```
