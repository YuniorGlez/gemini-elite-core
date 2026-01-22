# Reference: Nushell & Structured Data (2026)

## Overview
Nushell (Nu) is a modern shell for the GitHub era. It works with structured data rather than raw strings, making it the perfect tool for 2026 DevOps and AI orchestration.

## 📊 The "Table" Paradigm
In Nu, every command output is a table.

```bash
# List all files over 1MB, sorted by size
ls | where size > 1mb | sort-by size

# Get the first 5 processes using the most memory
ps | sort-by mem | last 5
```

---

## 🏗️ Working with APIs
Nushell makes `curl` look like a dinosaur.

```bash
# Fetch a JSON API and explore it interactively
http get https://api.github.com/repos/nushell/nushell | get stargazers_count

# Convert a CSV to a JSON file in one line
open data.csv | save data.json
```

---

## 🛠️ Scripting with Nu
Nushell scripts are typed and robust.

```bash
def deploy-check [env: string] {
  let status = (http get $"https://($env).squaads.com/health")
  if $status.ok {
    echo "System Healthy"
  } else {
    error make {msg: "Deploy Failed"}
  }
}
```

---

## 🔄 Interop with standard Unix
You can always go back to strings with `to text` or move from strings to tables with `from ssv` (Space Separated Values).

### The Squaads Audit Pipeline
```bash
# Audit disk usage and output a beautiful JSON summary
du -sk * | from ssv | rename size path | upsert size { $in.size | into int } | sort-by size -r | first 10 | to json
```

## 🏁 Why the Utility Pro uses Nushell
- **Safety:** No more "Word Splitting" or "Globbing" bugs.
- **Speed:** Native performance and parallel execution.
- **AI-Ready:** Tables are easy for LLMs to parse and generate.
