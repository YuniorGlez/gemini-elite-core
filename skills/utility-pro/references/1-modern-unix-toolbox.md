# Reference: Modern Unix Toolbox (2026)

## Introduction
The "New Wave" of Unix utilities, mostly written in Rust, prioritize speed, safety, and human-friendly defaults.

## 🛠️ The Essential Tools

### 1. `ripgrep` (rg)
**Why:** Faster than `grep`, `ag`, and `git grep`. It respects `.gitignore` and skips binary/hidden files by default.
**Advanced Usage:**
- `rg -C 3 "pattern"`: Show 3 lines of context.
- `rg -l "pattern"`: Only list files with matches.
- `rg -w "pattern"`: Match whole words only.
- `rg --type-add 'web:*.{html,css,js}' --type web "pattern"`: Search custom file types.

### 2. `fd`
**Why:** A simple, fast alternative to `find`. Colorized output and smart case-sensitivity.
**Advanced Usage:**
- `fd -e pdf`: Find all PDF files.
- `fd "pattern" /path/to/search`: Search in a specific path.
- `fd -x command`: Execute a command for every search result.

### 3. `bat`
**Why:** A `cat` clone with wings. It supports syntax highlighting for 100+ languages and integrates with Git.
**Advanced Usage:**
- `bat --style=header,grid,numbers file.js`: Detailed view.
- `bat -L 10:20 file.py`: Show specific line range.

### 4. `zoxide` (z)
**Why:** Remembers where you've been. `z proj` might take you to `~/work/active/my-project`.
**Advanced Usage:**
- `z -`: Go back to the previous directory.
- `zi`: Interactive selection using `fzf`.

### 5. `fzf` (Fuzzy Finder)
**Why:** The glue of the modern CLI. It provides an interactive interface for searching history, files, and more.
**Integration:**
- `CTRL-T`: Fuzzy search for files.
- `CTRL-R`: Fuzzy search through command history.

---

## 🚀 Terminal Setup (2026)
For the best Squaads AI Core experience, use these tools inside **Warp** or **Ghostty** with a **Nerd Font** (like JetBrains Mono) for proper icon support in `eza`.
