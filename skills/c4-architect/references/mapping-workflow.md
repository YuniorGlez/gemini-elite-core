# Architectural Mapping Workflow

## From Discovery to Diagram
Creating an accurate C4 diagram starts with deep codebase investigation.

### Step 1: Discover Containers
Search for the core deployable units in the workspace.
- **Monorepos**: Check `apps/*` and `packages/*`.
- **Package Managers**: Analyze `package.json` names and dependencies.
- **Infrastructure**: Look for `Dockerfile`, `docker-compose.yml`, or `vercel.json`.

### Step 2: Identify Technologies
Note the primary tech stack for each container.
- *Example*: `api` -> NestJS/NATS, `web` -> Next.js/Tailwind 4.

### Step 3: Map Inter-Container Communication
Look for:
- **HTTP/REST**: `fetch`, `axios`, or API routes.
- **RPC**: `tRPC`, `ConnectRPC`, or `gRPC`.
- **Events**: `NATS`, `Redis`, or `BullMQ`.
- **DB Access**: `Prisma`, `TypeORM`, or `Drizzle` connection strings.

### Step 4: Define External Actors
Identify who uses the system and what external APIs the system depends on (e.g., Stripe, Clerk, Resend).

### Step 5: Synthesize in Mermaid
Draft the `C4Container` code starting with the boundaries, then the containers, then the relationships.
- **Tip**: Start with a simple "L1 Context" to validate the high-level actors before diving into "L2 Container" details.
