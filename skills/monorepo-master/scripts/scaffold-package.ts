/**
 * Scaffold a new package in the monorepo using 2026 standards.
 * Usage: bun scripts/scaffold-package.ts <package-name>
 */

import { mkdir, writeFile } from "node:fs/promises";
import { join } from "node:path";

const packageName = process.argv[2];

if (!packageName) {
  console.error("Please provide a package name.");
  process.exit(1);
}

const packageDir = join(process.cwd(), "packages", packageName);

async function scaffold() {
  console.log(`Scaffolding package: ${packageName}...`);

  await mkdir(packageDir, { recursive: true });
  await mkdir(join(packageDir, "src"), { recursive: true });

  // package.json
  const packageJson = {
    name: `@repo/${packageName}`,
    version: "0.0.0",
    private: true,
    exports: {
      ".": "./src/index.ts",
    },
    scripts: {
      build: "bun x tsc",
      lint: "bun x eslint src/",
      test: "bun test",
    },
    peerDependencies: {
      react: "^19.0.0",
    },
    devDependencies: {
      typescript: "latest",
      "@types/react": "latest",
    },
  };

  await writeFile(
    join(packageDir, "package.json"),
    JSON.stringify(packageJson, null, 2)
  );

  // tsconfig.json
  const tsConfig = {
    extends: "@repo/tsconfig/base.json",
    compilerOptions: {
      outDir: "dist",
      rootDir: "src",
    },
    include: ["src"],
    exclude: ["node_modules", "dist"],
  };

  await writeFile(
    join(packageDir, "tsconfig.json"),
    JSON.stringify(tsConfig, null, 2)
  );

  // src/index.ts
  await writeFile(
    join(packageDir, "src/index.ts"),
    `export const ${packageName.replace(/-/g, "_")} = () => {
  return "Hello from ${packageName}";
};
`
  );

  console.log(`✅ Package ${packageName} scaffolded successfully at ${packageDir}`);
}

scaffold().catch(console.error);
