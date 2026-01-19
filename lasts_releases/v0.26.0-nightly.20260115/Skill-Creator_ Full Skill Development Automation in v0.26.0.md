# Skill-Creator: Full Skill Development Automation in v0.26.0

## Introduction

The v0.26.0-nightly version introduces **skill-creator**, a revolutionary built-in skill that completely automates the custom skill creation lifecycle. This is a fundamental change that transforms how you develop and distribute skills in Gemini CLI.

## What is Skill-Creator?

Skill-creator is an integrated system that combines three components:

1. **Procedural Skill**: An expert agent that guides the design and implementation of effective skills.
2. **init_skill.cjs**: Script that automatically generates the structure of a new skill.
3. **validate_skill.cjs**: Validator that ensures quality and consistency.
4. **package_skill.cjs**: Packager that creates distribution-ready `.skill` files.

## Main Advantages vs v0.25.0

| Aspect | v0.25.0 | v0.26.0 |
|--------|---------|---------|
| **Skill Creation** | Manual, error-prone | Automated with scaffolding |
| **Validation** | Manual, inconsistent | Automatic with validate_skill.cjs |
| **Packaging** | Complex, requires knowledge | Automatic with package_skill.cjs |
| **Skill Installation** | Basic | With security consent |
| **Development Guidance** | External documentation | Integrated skill-creator |
| **Agent Proactivity** | Limited | Agent can install skills for you |

## How Skill-Creator Works

### Phase 1: Automatic Initialization

When you run:

```bash
gemini > Create a skill that validates PRs
```

Skill-creator automatically:

1. **Generates the structure** using `init_skill.cjs`:
   - Creates standard directories.
   - Generates file templates.
   - Establishes naming conventions.

2. **Provides procedural guidance**:
   - Explains what the skill should do.
   - Suggests best practices.
   - Validates design decisions.

### Phase 2: Continuous Validation

While you develop, `validate_skill.cjs` verifies:

- **Valid YAML Frontmatter**: Correctly formatted metadata.
- **Resolved TODOs**: No uncompleted placeholders.
- **File Structure**: Complies with standard conventions.
- **Dependencies**: All imports are valid.

### Phase 3: Automatic Packaging

When you finish, `package_skill.cjs`:

- Compresses the skill into a `.skill` file.
- Avoids redundant nesting.
- Prepares for immediate distribution.
- Generates packaging metadata.

### Phase 4: Proactive Installation

The agent can install the skill automatically:

```bash
gemini > Install the skill we just created
```

The skill is installed with:
- Security consent prompts.
- Installation logging.
- Post-installation validation.

## Practical Example: Creating a PR Review Skill

### Step 1: Request Creation

```bash
> Create a skill that automatically reviews GitHub PRs.
> It must check: linting, tests, code coverage, and style.
> Returns a summary in markdown format.
```

### Step 2: Skill-Creator Generates Structure

```
my-pr-reviewer/
├── SKILL.md                 # Metadata and documentation
├── skill.ts                 # Main implementation
├── handlers/
│   ├── lint-check.ts
│   ├── test-check.ts
│   ├── coverage-check.ts
│   └── style-check.ts
├── utils/
│   ├── github-api.ts
│   └── report-formatter.ts
└── tests/
    └── skill.test.ts
```

### Step 3: Automatic Validation

```bash
gemini > Validate that the skill is complete
```

Skill-creator verifies:
- ✅ Correct YAML frontmatter.
- ✅ All functions implemented.
- ✅ No pending TODOs.
- ✅ Tests pass.
- ✅ Complete documentation.

### Step 4: Packaging

```bash
gemini > Package the skill for distribution
```

Generates: `my-pr-reviewer.skill` (compressed file ready to install).

### Step 5: Proactive Installation

```bash
gemini > Install the skill we created
```

Result:
- Consent prompt showing what is being installed.
- Installation in correct location.
- Automatic CLI reload.
- Skill immediately available.

## Configuration in settings.json

To enable and configure skill-creator:

```json
{
  "agents": {
    "skillCreator": {
      "modelConfig": {
        "temperature": 0.7
      },
      "runConfig": {
        "maxTurns": 50
      }
    }
  },
  "experimental": {
    "skillCreator": true
  }
}
```

## New CLI Commands

v0.26.0 introduces specific commands for skills:

```bash
# Install a skill
gemini skills install <path-or-git-url>

# Uninstall a skill
gemini skills uninstall <skill-name>

# List installed skills
gemini skills list

# Validate a skill
gemini skills validate <path>

# Package a skill
gemini skills package <path>
```

## Security Improvements

### Security Consent Prompts

When you install a skill, you see:

```
┌─────────────────────────────────────────────────┐
│ Installing Agent Skill                          │
├─────────────────────────────────────────────────┤
│ Skill: my-pr-reviewer                           │
│ Source: github.com/user/my-pr-reviewer          │
│ Install Destination: ~/.gemini/skills/          │
│                                                 │
│ ⚠️  SECURITY WARNING                            │
│ This skill will have access to:                 │
│ - GitHub API credentials                        │
│ - Repository data                               │
│ - Your local file system                        │
│                                                 │
│ Do you consent to install? (y/n)                │
└─────────────────────────────────────────────────┘
```

### Conflict Detection

If a skill tries to overwrite another:

```
⚠️  Skill Conflict Detected
The skill 'pr-reviewer' conflicts with existing skill 'pr-validator'
Both define the same commands: /review-pr

Options:
1. Replace existing skill
2. Keep existing skill
3. Install with different name
```

## Advantages for your Workflow

### Before (v0.25.0):

1. Manually create skill structure.
2. Write YAML frontmatter.
3. Implement functionality.
4. Manually create tests.
5. Manually validate.
6. Manually package.
7. Manually install.
8. **Total time: 30-60 minutes**

### Now (v0.26.0):

1. Describe what you want the skill to do.
2. Skill-creator generates everything automatically.
3. Automatic validation during development.
4. Automatic packaging.
5. Proactive installation.
6. **Total time: 5-10 minutes**

## Integration with your v0.25.0 Setup

If you already have skills from v0.25.0, you can:

1. **Keep them as they are**: They are fully compatible.
2. **Migrate gradually**: Use skill-creator for new skills.
3. **Refactor existing ones**: Skill-creator can modernize old skills.

```bash
gemini > Refactor my existing skills to use skill-creator
```

## Best Practices with Skill-Creator

### 1. Clear Description

```bash
# ✅ Good
> Create a skill that validates PRs checking:
> - Linting with ESLint
> - Tests with Jest
> - Minimum coverage 80%
> - Commit messages in conventional format

# ❌ Bad
> Create a PR skill
```

### 2. Frequent Validation

```bash
# Validate after each important change
gemini > Validate the skill
```

### 3. Integrated Documentation

Skill-creator generates documentation automatically in SKILL.md:

```markdown
# PR Reviewer Skill

## Description
Automatically reviews GitHub PRs checking...

## Usage
```
/review-pr <pr-url>
```

## Configuration
...
```

### 4. Secure Installation

Always review the consent prompt before installing third-party skills.

## Comparison: Skill-Creator vs Manual

| Task | Manual | Skill-Creator |
|-------|--------|---------------|
| Create structure | 5 min | Automatic |
| Write YAML | 5 min | Automatic |
| Validate | 10 min | Automatic |
| Package | 5 min | Automatic |
| Document | 10 min | Automatic |
| **Total** | **35 min** | **< 1 min** |

## Next Steps

1. **Update to v0.26.0-nightly**
2. **Create your first skill with skill-creator**
3. **Migrate existing skills gradually**
4. **Share skills with your team**

## Resources

- [Official Gemini CLI Documentation](https://geminicli.com/docs/)
- [GitHub: google-gemini/gemini-cli](https://github.com/google-gemini/gemini-cli)
- [PR #16394: Skill-Creator Implementation](https://github.com/google-gemini/gemini-cli/pull/16394)

---

**Author**: Manus AI  
**Version**: v0.26.0-nightly.20260115  
**Last update**: January 2026
