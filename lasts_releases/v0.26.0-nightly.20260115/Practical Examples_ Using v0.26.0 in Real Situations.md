# Practical Examples: Using v0.26.0 in Real Situations

## Introduction

This guide contains practical and ready-to-use examples of how to leverage the new features of v0.26.0 in real development situations.

## Example 1: Creating a Commit Validation Skill

### Situation

Your team needs to validate that all commits follow the "Conventional Commits" format. You want to automate this.

### Solution with v0.26.0

```bash
gemini > Create a skill that validates commits in Conventional Commits format.
> The skill must:
> - Check that the message starts with a type (feat, fix, docs, etc.)
> - Check for a clear description.
> - Check that it does not exceed 100 characters on the first line.
> - Return a detailed report.
> - Be installable in git hooks.
```

**Expected Result**:

Skill-creator automatically generates:

```
commit-validator/
├── SKILL.md
├── skill.ts
├── validators/
│   ├── format-validator.ts
│   ├── length-validator.ts
│   └── message-validator.ts
├── hooks/
│   └── prepare-commit-msg.ts
└── tests/
    └── validator.test.ts
```

### Installation

```bash
gemini > Package the skill and install it
```

The CLI shows:

```
┌─────────────────────────────────────────┐
│ SECURITY CONSENT                        │
│ Skill: commit-validator                 │
│ Permissions: Read/Write git hooks       │
│ Install? (y/n): y                       │
└─────────────────────────────────────────┘

✅ Skill installed
```

### Usage

```bash
git commit -m "feat: add new validation"
# The skill validates automatically

git commit -m "invalid message"
# ❌ Error: Does not follow Conventional Commits format
```

---

## Example 2: Refactoring a Project with Plan Mode

### Situation

You need to migrate your Vue 2 application to Vue 3, but it's a large project and you want to see the full plan before starting.

### Solution with v0.26.0

```bash
gemini > Migrate my Vue 2 application to Vue 3.
> I want to see the full plan before starting.
```

**Expected Result**:

```
📋 GENERATED PLAN: Migration Vue 2 → Vue 3

Phase 1: Analysis (10 min)
├─ Scan Vue 2 components
├─ Identify deprecated APIs
├─ Detect necessary composables
└─ Analyze dependencies

Phase 2: Preparation (5 min)
├─ Update package.json
├─ Install Vue 3 dependencies
├─ Install migration tools
└─ Create work branch

Phase 3: Component Migration (30 min)
├─ Convert Options API → Composition API
├─ Update template syntax
├─ Migrate lifecycle hooks
└─ Update props and emits

Phase 4: Dependency Update (15 min)
├─ Update plugins
├─ Update UI libraries
├─ Update testing tools
└─ Update build configuration

Phase 5: Testing (20 min)
├─ Run unit tests
├─ Run E2E tests
├─ Manual testing
└─ Performance testing

Estimated time: 80 minutes
Complexity: HIGH
Risk: MEDIUM

Do you approve this plan? (y/n):
```

### Approve and Execute

```bash
y
```

The agent executes the plan phase by phase, showing progress:

```
[1/5] Analyzing project...
✅ Completed: 47 components found

[2/5] Preparing environment...
✅ Completed: Dependencies installed

[3/5] Migrating components...
⏳ In progress: 23/47 components migrated...
```

---

## Example 3: Configuring Custom Agents for Your Team

### Situation

Your team has different needs:
- Junior devs need deep analysis.
- Senior devs need speed.
- QA needs maximum precision.

### Solution with v0.26.0

**For Junior Devs** (`~/.gemini/settings.dev-junior.json`):

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {
        "temperature": 0.2,
        "maxOutputTokens": 4096
      },
      "runConfig": {
        "maxTurns": 100
      }
    }
  },
  "experimental": {
    "plan": true,
    "planningMode": "manual",
    "requirePlanApproval": true
  }
}
```

**For Senior Devs** (`~/.gemini/settings.dev-senior.json`):

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {
        "temperature": 0.5,
        "maxOutputTokens": 2048
      },
      "runConfig": {
        "maxTurns": 30
      }
    }
  },
  "experimental": {
    "plan": true,
    "planningMode": "auto"
  }
}
```

**For QA** (`~/.gemini/settings.qa.json`):

```json
{
  "agents": {
    "codeReviewer": {
      "modelConfig": {
        "temperature": 0.1,
        "maxOutputTokens": 4096
      },
      "runConfig": {
        "maxTurns": 100
      }
    }
  },
  "experimental": {
    "plan": true,
    "planningMode": "strict",
    "requirePlanApproval": true
  }
}
```

### Usage

```bash
# Junior Dev
cp ~/.gemini/settings.dev-junior.json ~/.gemini/settings.json
gemini

# Senior Dev
cp ~/.gemini/settings.dev-senior.json ~/.gemini/settings.json
gemini

# QA
cp ~/.gemini/settings.qa.json ~/.gemini/settings.json
gemini
```

---

## Example 4: Creating a Supabase Integration Skill

### Situation

You need a skill that automatically generates Supabase Edge Functions based on specifications.

### Solution with v0.26.0

```bash
gemini > Create a skill that generates Supabase Edge Functions.
> The skill must:
> - Take a specification in YAML.
> - Generate TypeScript function.
> - Configure authentication.
> - Generate tests.
> - Deploy automatically.
```

### Configuration in settings.json

```json
{
  "agents": {
    "skillCreator": {
      "enabled": true,
      "modelConfig": {
        "temperature": 0.6
      }
    }
  },
  "mcp": {
    "servers": {
      "supabase": {
        "enabled": true,
        "command": "npx",
        "args": ["@supabase/mcp-server-supabase@latest"]
      }
    }
  }
}
```

### Skill Usage

```bash
gemini > Use the supabase-function-generator skill to create a function
> that validates emails and returns a JWT token
```

The skill:
1. Accesses Supabase MCP.
2. Generates the function.
3. Deploys it.
4. Returns the function URL.

---

## Example 5: Skill Security Audit

### Situation

You have 10 skills installed and want to audit what permissions each one has.

### Solution with v0.26.0

```bash
# See all skills
gemini skills list

# See permissions for each skill
gemini skills permissions skill-1
gemini skills permissions skill-2
...

# Generate security report
gemini skills audit report
```

**Result**:

```
SECURITY AUDIT REPORT
Generated: 2026-01-18

Skills Installed: 10

HIGH RISK SKILLS:
- github-pr-reviewer (Access to GitHub API, can write comments)
- code-formatter (Can write local files)

MEDIUM RISK SKILLS:
- commit-validator (Access to git hooks)
- documentation-generator (Access to local files)

LOW RISK SKILLS:
- code-analyzer (Read-only)
- test-runner (Controlled execution)

RECOMMENDATIONS:
1. Review permissions for github-pr-reviewer.
2. Consider using code-formatter only when necessary.
3. Keep backup before using code-formatter.
```

---

## Example 6: Full Workflow: Creating and Distributing a Skill

### Step 1: Create the Skill

```bash
gemini > Create a skill that automatically generates README.md
> based on the project structure
```

### Step 2: Validate

```bash
gemini skills validate readme-generator
```

### Step 3: View Packaging Plan

```bash
gemini > Show the plan to package the skill
```

### Step 4: Package

```bash
gemini skills package readme-generator
```

### Step 5: Install Locally

```bash
gemini skills install ./readme-generator.skill
```

### Step 6: Test

```bash
gemini > Use the readme-generator skill in my project
```

### Step 7: Distribute

```bash
# Upload to GitHub
git add readme-generator.skill
git commit -m "feat: add readme-generator skill"
git push

# Share with team
gemini > Install the skill from github.com/team/skills/readme-generator
```

---

## Example 7: Optimizing Performance with Configuration

### Before (Slow)

```bash
gemini > Analyze my project
# Takes 5 minutes, very detailed response
```

### After (Fast)

Update settings.json:

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {
        "temperature": 0.5,
        "maxOutputTokens": 1024
      },
      "runConfig": {
        "maxTurns": 10,
        "timeout": 60000
      }
    }
  }
}
```

```bash
gemini > Analyze my project
# Takes 30 seconds, concise but useful response
```

---

## Example 8: Debugging with Plan Mode

### Situation

Your application has a complex bug and you want Gemini to debug it systematically.

### Solution

```bash
gemini > Debug the error: "TypeError: Cannot read property 'map' of undefined"
> I want to see the plan before starting
```

**Result**:

```
📋 PLAN: TypeError Debugging

Phase 1: Localization (2 min)
├─ Search where the error occurs
├─ Identify stack trace
└─ Locate exact line

Phase 2: Context Analysis (3 min)
├─ Understand what should be 'undefined'
├─ Analyze data flow
└─ Identify breaking point

Phase 3: Identify Cause (5 min)
├─ Verify variable initialization
├─ Review API calls
├─ Analyze data transformations

Phase 4: Generate Fix (5 min)
├─ Create solution
├─ Add validations
└─ Generate tests

Estimated time: 15 minutes
Confidence: HIGH

Do you approve? (y/n):
```

---

## Example 9: Configuration for Different Projects

### Project 1: Startup (Speed)

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {"temperature": 0.7},
      "runConfig": {"maxTurns": 20}
    }
  },
  "experimental": {
    "plan": false
  }
}
```

### Project 2: Enterprise (Security)

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {"temperature": 0.1},
      "runConfig": {"maxTurns": 100}
    }
  },
  "experimental": {
    "plan": true,
    "planningMode": "strict",
    "requirePlanApproval": true
  },
  "security": {
    "requireSkillApproval": true,
    "allowAutoInstall": false
  }
}
```

### Project 3: Research (Precision)

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {
        "temperature": 0.2,
        "maxOutputTokens": 8000
      },
      "runConfig": {"maxTurns": 200}
    }
  }
}
```

---

## Example 10: CI/CD Integration

### GitHub Actions

```yaml
name: Code Review with Gemini

on: [pull_request]

jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Install Gemini CLI
        run: npm install -g @google/gemini-cli
      
      - name: Configure Gemini
        run: |
          mkdir -p ~/.gemini
          echo '${{ secrets.GEMINI_CONFIG }}' > ~/.gemini/settings.json
      
      - name: Review PR
        run: |
          gemini --consent < review-prompt.txt
      
      - name: Comment on PR
        uses: actions/github-script@v6
        with:
          script: |
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: fs.readFileSync('review-output.md', 'utf8')
            })
```

---

## Next Steps

1. **Choose an example**: Select the one that best fits your case.
2. **Adapt to your context**: Modify according to your needs.
3. **Test**: Run in a small project first.
4. **Iterate**: Adjust configuration based on results.
5. **Document**: Share with your team.

---

**Author**: Manus AI  
**Version**: v0.26.0-nightly.20260115  
**Last update**: January 2026
