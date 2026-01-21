# Experimental Plan Flag: The Next Frontier in v0.26.0

## Introduction

The `experimental.plan` flag is a preparatory feature in v0.26.0 that opens the door to a completely new paradigm in how Gemini CLI plans and executes complex tasks. Although it is still in the experimental phase, it is important to understand what it brings and how to prepare.

## What is the Plan Flag?

The `experimental.plan` flag is a boolean toggle that enables all planning-related functionalities, including:

- **Plan Approval Mode**: A new mode where the agent creates a plan before executing.
- **Specialized Planning Tools**: Specific tools for breaking down complex problems.
- **Structured Reasoning**: Structured reasoning before execution.
- **Plan Visualization**: Visualization of plans before executing them.

## Basic Configuration

### Enable the Flag

```json
{
  "experimental": {
    "plan": true
  }
}
```

### Full Configuration

```json
{
  "experimental": {
    "plan": true,
    "planningMode": "auto",
    "planVisualization": true,
    "requirePlanApproval": false
  }
}
```

## How Plan Mode Works

### Traditional Flow (v0.25.0)

```
User Input → Agent Executes → Result
```

**Problem**: The agent may make suboptimal decisions without prior reflection.

### Flow with Plan Mode (v0.26.0)

```
User Input → Agent Creates Plan → User Approves → Agent Executes → Result
```

**Advantage**: Transparency, control, and better quality of results.

## Practical Example: Refactoring a Project

### Without Plan Mode

```bash
> Refactor my Next.js project to strictly use TypeScript
```

The agent simply starts refactoring without showing what it will do.

### With Plan Mode

```bash
> Refactor my Next.js project to strictly use TypeScript
```

The agent first shows:

```
📋 GENERATED PLAN

Phase 1: Analysis (5 min)
  ├─ Scan .js/.jsx files
  ├─ Identify implicit types
  └─ Detect dependencies

Phase 2: Configuration (2 min)
  ├─ Update tsconfig.json
  ├─ Install missing types
  └─ Configure strict mode

Phase 3: Migration (15 min)
  ├─ Convert files to .ts/.tsx
  ├─ Add explicit types
  ├─ Resolve type errors
  └─ Update imports

Phase 4: Validation (5 min)
  ├─ Run type checker
  ├─ Run tests
  └─ Verify build

Estimated time: 27 minutes
Risk: LOW

Do you approve this plan? (y/n)
```

**Advantages**:
- You see exactly what the agent will do.
- You can modify the plan before executing.
- Realistic time estimation.
- Risk assessment.

## Plan Flag Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `plan` | boolean | false | Enables all planning functionalities. |
| `planningMode` | string | "auto" | "auto", "manual", or "strict". |
| `planVisualization` | boolean | true | Show plan visualization. |
| `requirePlanApproval` | boolean | false | Require approval before executing. |
| `maxPlanDepth` | number | 5 | Maximum decomposition depth. |
| `planTimeout` | number | 60000 | Plan generation timeout (ms). |

## Planning Modes

### 1. Auto Mode (Recommended)

```json
{
  "experimental": {
    "plan": true,
    "planningMode": "auto"
  }
}
```

**Behavior**: The agent decides if it needs a plan based on complexity.

- Simple tasks: Direct execution.
- Complex tasks: Generates plan automatically.
- Very complex tasks: Requires approval.

### 2. Manual Mode

```json
{
  "experimental": {
    "plan": true,
    "planningMode": "manual"
  }
}
```

**Behavior**: Always generates a plan, but doesn't execute it until you approve.

```bash
> Refactor my code
[Plan generated, waiting for approval]
> Approve the plan
[Execution starts]
```

### 3. Strict Mode

```json
{
  "experimental": {
    "plan": true,
    "planningMode": "strict"
  }
}
```

**Behavior**: Maximum control and transparency.

- Generates detailed plan.
- Requires explicit approval.
- Shows each step before executing.
- Pause between phases for confirmation.

## Ideal Use Cases

### ✅ Use Plan Mode For:

1. **Large Refactors**
   ```bash
   > Migrate my application from Vue 2 to Vue 3
   ```

2. **Architecture Changes**
   ```bash
   > Convert my monolith into microservices
   ```

3. **Database Migrations**
   ```bash
   > Migrate from MongoDB to PostgreSQL
   ```

4. **Critical Updates**
   ```bash
   > Update all my dependencies while maintaining compatibility
   ```

5. **Multi-Phase Tasks**
   ```bash
   > Implement OAuth authentication across the entire app
   ```

### ❌ You Don't Need Plan Mode For:

- Generating a simple component.
- Fixing a trivial bug.
- Creating a new file.
- Small style changes.

## Integration with Skills

Skills can use the plan flag:

```typescript
// In your skill
if (gemini.config.experimental.plan) {
  // Generate plan before executing
  const plan = await gemini.generatePlan(task);
  
  // Show to user
  console.log(plan.visualization);
  
  // Wait for approval
  const approved = await gemini.requestApproval(plan);
  
  if (approved) {
    // Execute plan
    await executePlan(plan);
  }
}
```

## Generated Plan Examples

### Example 1: Creating a Dashboard

```
📋 PLAN: Create Analysis Dashboard

Phase 1: Design (3 min)
  ├─ Define layout
  ├─ Choose components
  └─ Plan state management

Phase 2: Backend (10 min)
  ├─ Create API endpoints
  ├─ Implement authentication
  └─ Configure database

Phase 3: Frontend (20 min)
  ├─ Create React components
  ├─ Integrate with API
  ├─ Implement charts
  └─ Add responsiveness

Phase 4: Testing (10 min)
  ├─ Unit tests
  ├─ E2E tests
  └─ Performance testing

Total time: 43 minutes
Complexity: MEDIUM
Risk: LOW
```

### Example 2: Optimizing Performance

```
📋 PLAN: Optimize Performance

Phase 1: Analysis (5 min)
  ├─ Run Lighthouse
  ├─ Analyze bundle size
  ├─ Identify bottlenecks
  └─ Profile runtime

Phase 2: Bundle Optimization (10 min)
  ├─ Code splitting
  ├─ Tree shaking
  ├─ Minification
  └─ Compression

Phase 3: Runtime Optimization (15 min)
  ├─ Memoization
  ├─ Lazy loading
  ├─ Virtual scrolling
  └─ Caching

Phase 4: Validation (5 min)
  ├─ Lighthouse recheck
  ├─ Performance budget check
  └─ Load testing

Total time: 35 minutes
Expected improvement: 40-60%
Risk: LOW
```

## Best Practices

### 1. Use Plan Mode for Critical Decisions

```json
{
  "experimental": {
    "plan": true,
    "requirePlanApproval": true
  }
}
```

### 2. Review Plans Before Executing

Always read the generated plan, especially for:
- Database changes.
- Architecture changes.
- Code migrations.

### 3. Adjust Plan Depth

For simple tasks, reduce depth:

```json
{
  "experimental": {
    "plan": true,
    "maxPlanDepth": 2
  }
}
```

For complex tasks, increase:

```json
{
  "experimental": {
    "plan": true,
    "maxPlanDepth": 10
  }
}
```

### 4. Combine with Other Flags

```json
{
  "experimental": {
    "plan": true,
    "skillCreator": true
  }
}
```

This allows skill-creator to generate plans for new skills.

## Troubleshooting

### Problem: Plan is too generic

**Cause**: Unclear task description.

**Solution**: Be more specific.

```bash
# ❌ Bad
> Improve my code

# ✅ Good
> Refactor my LoginForm component to use hooks instead of class components
```

### Problem: Plan takes too long to generate

**Cause**: Very complex task or high timeout.

**Solution**: Reduce depth or increase timeout.

```json
{
  "experimental": {
    "maxPlanDepth": 3,
    "planTimeout": 120000
  }
}
```

### Problem: Plan doesn't execute after approval

**Cause**: Possible validation error.

**Solution**: Check logs.

```bash
gemini > Show plan logs
```

## Future Roadmap

The plan flag paves the way for:

1. **Plan Modification**: Edit plans before executing.
2. **Parallel Execution**: Execute phases in parallel.
3. **Plan Caching**: Reuse similar plans.
4. **Plan Analytics**: Analyze plan effectiveness.
5. **Team Plans**: Share plans with the team.

## Migration from v0.25.0

If you use v0.25.0 without plan mode:

```bash
# Enable plan mode gradually
gemini > Enable plan mode for complex tasks
```

Then in settings.json:

```json
{
  "experimental": {
    "plan": true,
    "planningMode": "auto"
  }
}
```

## Next Steps

1. **Enable the flag**: Add `"plan": true` to experimental.
2. **Test with complex tasks**: Refactors, migrations.
3. **Review generated plans**: Learn what it generates.
4. **Adjust configuration**: Find your ideal balance.
5. **Share feedback**: Help improve the feature.

---

**Author**: Manus AI  
**Version**: v0.26.0-nightly.20260115  
**Status**: Experimental (subject to change)  
**Last update**: January 2026
