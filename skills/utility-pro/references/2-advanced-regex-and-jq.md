# Reference: Advanced RegEx & jq Mastery

## 🧩 Part 1: Regular Expressions (RegEx) 2026

### The "Squaads Standard" for Patterns
In 2026, we prioritize readability and performance.

| Feature | Syntax | Use Case |
| :--- | :--- | :--- |
| **Named Groups** | `(?P<name>...)` | Extracting structured fields from logs. |
| **Lookahead** | `(?=...)` | Matching "X" only if followed by "Y". |
| **Lookbehind** | `(?<=...)` | Matching "X" only if preceded by "Y". |
| **Non-Greedy** | `*?` or `+?` | Matching the smallest possible string. |

### Case Study: Log Parsing
Pattern: `^(?P<timestamp>[\d-]{10} [\d:]{8}) (?P<level>INFO|WARN|ERROR) \[(?P<module>[^\]]+)\] (?P<message>.*)$`

---

## 💎 Part 2: JSON Manipulation with `jq`

`jq` is a full functional programming language for JSON.

### Essential Filters
- **Mapping:** `[.items[].id]` - Create an array of IDs.
- **Selection:** `.[] | select(.price > 100)` - Filter objects by value.
- **Update:** `(.user.role) |= "admin"` - Update a specific field.
- **Reduction:** `[ .[] | .amount ] | add` - Sum an array of numbers.

### Advanced: The "Squaads Report"
```bash
# Get a count of errors per module from a JSON log file
cat logs.json | jq -r 'group_by(.module) | .[] | {module: .[0].module, count: length}'
```

---

## 🛠️ Integrated Pipelines
The true power comes from combining tools.

```bash
# Find all API calls in the code, extract the endpoint, and sort by uniqueness
rg "fetch\(['\"]([^'\"]+)['\"]" --only-matching --no-filename | sed "s/fetch(['\"]//" | sed "s/['\"]//" | sort | uniq -c
```
*Note: In 2026, we use this for codebase audits and route mapping.*
