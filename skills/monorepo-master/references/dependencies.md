# Dependency Management & Hoisting in 2026 Monorepos

## The Bun Resolution Model
Bun v1.2+ uses a high-performance dependency resolver that differs from `pnpm` and `npm`. 

### Key Features:
1. **Integrated Linker**: Bun links dependencies directly from its global cache, making `bun install` nearly instantaneous.
2. **Deterministic Locking**: `bun.lockb` is a binary format that ensures every environment has the exact same dependency tree.
3. **Workspace Awareness**: Bun automatically links local packages defined in `package.json` workspaces without requiring a separate `publish` step.

---

## Solving "Ghost Dependencies"
Ghost dependencies occur when a package uses a dependency that isn't explicitly listed in its `package.json`, but is available because it was hoisted by the package manager.

### The 2026 Fix:
- **Strict Peer Dependencies**: Always use `peerDependencies` for shared libraries like `react` and `tailwindcss` in packages.
- **Workspace Versions**: Use `workspace:*` for all internal package references. This forces the package manager to always use the local source.

```json
{
  "dependencies": {
    "@repo/ui": "workspace:*",
    "lucide-react": "^0.450.0"
  }
}
```

---

## Circular Dependencies
Circular dependencies (e.g., A depends on B, B depends on A) are common in large monorepos and can cause build failures or runtime errors.

### Detection & Prevention:
- Use `madge` or similar tools to visualize the dependency graph.
- **Strategy**: If two packages depend on each other, extract the shared logic into a third package (e.g., `@repo/core` or `@repo/utils`).

---

## Version Mismatches
In a monorepo, having different versions of the same dependency (e.g., `lodash` v4.17.21 in App A and v4.17.20 in App B) can bloat the `node_modules` and cause bugs.

### The "Single Version Policy":
- Use Bun's `overrides` or `resolutions` in the root `package.json` to force a specific version across the entire monorepo.

```json
{
  "resolutions": {
    "lodash": "4.17.21"
  }
}
```
