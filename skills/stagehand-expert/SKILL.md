---
name: stagehand-expert
id: stagehand-expert
version: 4.0.0
description: "Master Architect in Stagehand V3. Expert in proactive code research, resilient automation, and high-precision AI agent orchestration."
---

# 🎭 Skill: stagehand-expert (v4 - Proactive Architecture)

## 🌟 General Description
This skill transforms the agent into a **Proactive Automation Engineer**. Unlike a passive code generator, the Stagehand expert investigates the project's architecture, maps navigation routes, and analyzes the DOM structure before proposing or writing a single line of test. It is optimized for **Stagehand V3** and high-performance environments with **Bun**.

---

## 🔍 Proactive Investigation Protocol (Deep Discovery)

Before creating a test, the agent **MUST** perform a deep discovery of the user's ecosystem following these steps:

### 1. Route and Navigation Exploration
Do not assume that login is at `/login`. Investigate the routing system (e.g., `app/` directory in Next.js or `src/pages/`):
*   **Action**: Use `list_directory` and `glob` to find `page.tsx` files or similar.
*   **Goal**: Understand how to get from point A to point B (real user flows).

### 2. Component and UI Analysis
Analyze the page's source files to identify critical elements:
*   **Action**: Read the component code (`read_file`) looking for IDs, input names, `aria-label` tags, and loading states (Spinners, Skeletons).
*   **Goal**: Give natural instructions to the agent that match the technical reality of the code.

### 3. Technology Detection
Identify if the project uses heavy client frameworks, form libraries, or specific authentication systems:
*   **Action**: Review `package.json` and global configuration files.
*   **Goal**: Adjust `domSettleTimeout` and waiting strategies.

### 4. Data Mapping (Zod Inference)
If the test requires extracting data, first investigate existing data types in the backend or React state:
*   **Action**: Look for `types/` folders, `interfaces/`, or database schemas.
*   **Goal**: Create `extract()` schemas that are 100% compatible with the project.

---

## 🏗️ Core Mandates (Gemini Elite Protocol)

### 1. Mandatory Execution Model
*   **Mandate**: Always use `"google/gemini-3-flash-preview"`. It is the model optimized for the vision and reasoning engine of Stagehand V3.
*   **Restriction**: NEVER use Gemini 1.5 or obsolete models.

### 2. "Step-by-Step" Philosophy
*   IA automation is more robust when it is atomic. Break down complex flows into verifiable steps.
*   Each test must start by ensuring the server is up (`wait-on`).
*   Remember to use `observe` as also recommended in the documentation.

### 3. Closure and Cleanup
*   **Mandatory**: Strict use of `try...finally { await stagehand.close(); }`. A test that leaves a Chromium process hanging is an engineering failure.
*   **Mandatory**: Once you have created the tests the user requested, review them again with a critical eye, especially focusing on whether you have applied the best practices recommended in the skill, and if not, correct everything. It is also super important that you never type anything as `any`.

---

## 🚀 Installation and V3 Architecture

### Core Dependencies (Bun Ecosystem)
```bash
bun add @browserbasehq/stagehand playwright zod
```

### Master Initialization
In V3, Stagehand separates the client from the session. Initialization must be proactive and resilient:

```typescript
import { Stagehand } from "@browserbasehq/stagehand";

const stagehand = new Stagehand({
  env: process.env.BROWSERBASE_API_KEY ? "BROWSERBASE" : "LOCAL",
  model: "google/gemini-3-flash-preview", 
  verbose: 1, 
  domSettleTimeout: 10000, // Hydration time for modern SPAs
  cacheDir: "./cache/e2e",   // Vital for determinism and token savings
  localBrowserLaunchOptions: {
    headless: process.env.TEST_HEADLESS !== "false",
    chromiumSandbox: false, // Critical for Docker/CI environments
    args: ["--no-sandbox", "--disable-setuid-sandbox", "--disable-gpu", "--disable-dev-shm-usage"]
  }
});
```

---

## ⚡ Primitives Reference (V3 Syntax)

### 1. `act` (Deterministic and AI Actions)
Utilize precise natural language. Avoid ambiguities.

```typescript
// ✅ Recommended: Surgical precision
await stagehand.act("Click the 'Save' button inside the profile form");

// ✅ Recommended: Use variables for security
await stagehand.act("Write %apiKey% into the configuration input", {
  variables: { apiKey: process.env.SECRET_KEY }
});
```

### 2. `observe` (Planning - The speed multiplier)
**Golden Rule**: Before a series of actions (e.g., filling out a form), use `observe` to identify all elements at once. This reduces cost and latency by 70%.

```typescript
// A single LLM call to plan
const [userField, passField, submitBtn] = await stagehand.observe("Find login fields");

// Direct execution (Native speed)
await stagehand.act(userField, { variables: { value: "user@test.com" }});
await stagehand.act(passField, { variables: { value: "pass123" }});
await stagehand.act(submitBtn);
```

### 3. `extract` (Structured Extraction)
Use Zod to ensure the data extracted by the AI is valid for your application.

```typescript
const inventory = await stagehand.extract(
  "List all out-of-stock products",
  z.object({
    items: z.array(z.object({
      id: z.string(),
      name: z.string(),
      stock: z.number().max(0)
    }))
  })
);
```

---

## 🤖 Autonomous Agents (CUA & Hybrid)

For tasks requiring exploration or complex decision-making.

### Computer Use Agent (CUA)
```typescript
const agent = stagehand.agent({
  cua: true, // Enables advanced visual capabilities
  model: "google/gemini-3-flash-preview",
  systemPrompt: "You are a senior QA analyst. Your goal is to find visual bugs...
});

const result = await agent.execute({
  instruction: "Navigate through the dashboard, look for the sales chart, and verify if the data matches the table below",
  maxSteps: 25,
  highlightCursor: true // Draws the agent's trail (ideal for debug)
});
```

---

## 📑 Multi-tab Context Management

V3 allows orchestrating multiple pages under the same browser context.

```typescript
const context = stagehand.context;

// Open tabs to compare data
const [adminPage, userPage] = await Promise.all([
  context.newPage(`${baseUrl}/admin`),
  context.newPage(`${baseUrl}/user`)
]);

// Stagehand will operate on the active page by default
context.setActivePage(adminPage);
await stagehand.act("Approve user");

context.setActivePage(userPage);
await stagehand.act("Reload and verify status");
```

---

## 🕳️ DeepLocator: The Ultimate Solution to Iframes

Don't waste time searching for frames manually. `deepLocator` does it for you.

```typescript
// The '>>' selector indicates boundary jumping (Iframe or Shadow DOM)
await page.deepLocator("iframe#payment-gateway >> input[name='cvv']")
  .fill("123");
```

---

## 💾 Caching Strategy for CI/CD

Caching is what differentiates an experimental script from a professional one.

1.  **Determinism**: Stores DOM captures and LLM decisions.
2.  **Commit to Git**: Uploading the cache folder allows CI tests not to depend on the LLM (Zero cost, zero failure due to model changes).
3.  **Smart Invalidation**:
    ```bash
    # In scripts:
    "test:fresh": "rm -rf ./cache && bun run test
    ```

---

## 🛠️ Senior Pattern Recipe

### 1. Next.js Hydration Pattern
```typescript
await page.goto(targetUrl);
// Wait for JS bundles to execute and the client to take control
await new Promise(r => setTimeout(r, 5000)); 
await stagehand.act("...");
```

### 2. IA/Chat Response Polling
If the application generates dynamic or streaming content:
```typescript
for (let i = 0; i < 10; i++) {
  const status = await stagehand.extract("Has the AI finished writing?", z.object({ finished: z.boolean() }));
  if (status.finished) break;
  await new Promise(r => setTimeout(r, 2000));
}
```

### 3. DOM Cleaning (Inference Optimizer)
Remove "noisy" elements before calling the AI to save thousands of tokens.
```typescript
await page.evaluate(() => {
  document.querySelectorAll('video, iframe, [hidden]').forEach(el => el.remove());
});
```

---

## 🏃 Scripts & Runner (The Bun Standard)

`package.json` structure that every project should have:

```json
{
  "scripts": {
    "e2e": "bun tests/stagehand/runner.ts",
    "e2e:ui": "TEST_HEADLESS=false bun tests/stagehand/runner.ts",
    "e2e:auth": "bun tests/stagehand/runner.ts auth",
    "e2e:ui:auth": "TEST_HEADLESS=false bun tests/stagehand/runner.ts auth",
    "e2e:checkout": "bun tests/stagehand/runner.ts checkout",
    "e2e:ui:checkout": "TEST_HEADLESS=false bun tests/stagehand/runner.ts checkout",
    "e2e:chat": "bun tests/stagehand/runner.ts chat",
    "e2e:ui:chat": "TEST_HEADLESS=false bun tests/stagehand/runner.ts chat",
    "e2e:smoke": "bun tests/stagehand/smoke.spec.ts",
    "e2e:ui:smoke": "TEST_HEADLESS=false bun tests/stagehand/smoke.spec.ts
  }
}
```

---

## 🔄 Migration Guide: V2 ➔ V3 (Checklist)

*   [ ] Change `page.act/extract/observe` to `stagehand.act/extract/observe`.
*   [ ] Unify model configuration in a single `model: { ... }` object.
*   [ ] Remove `iframes: true` flags (now automatic).
*   [ ] Migrate `domSettleTimeoutMs` to `domSettleTimeout`.
*   [ ] Use `stagehand.context` for any page handling.

---

## 🔒 Security and Budget Control
*   **Metrics**: Monitor spending with `await stagehand.metrics`.
*   **Budget Guard**: Implement a spending limit in your CI runners to avoid expensive infinite loops.
*   **Variables**: NEVER pass secrets directly in the instruction string. Use the `variables` object.

---
*Reference: Gemini Elite & Stagehand V3 Master Docs Automation Architecture (Updated January 2026)*

## ANNEX: Recommended Directory Structure

```text
/tests/stagehand/
├── runner.ts           # Proactive orchestrator
├── config.ts           # Resilient initialization configuration
├── utils/
│   ├── discovery.ts    # Helpers for investigating project code
│   ├── auth.ts         # Persistent session logic
│   └── dom-cleaner.ts  # Token optimizer
├── flows/              # Real tests by domain
│   ├── checkout.spec.ts
│   └── onboarding.spec.ts
└── cache/              # AI decision store (Upload to Git!)
```
