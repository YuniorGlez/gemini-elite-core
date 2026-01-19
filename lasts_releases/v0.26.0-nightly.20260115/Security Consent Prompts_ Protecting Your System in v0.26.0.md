# Security Consent Prompts: Protecting Your System in v0.26.0

## Introduction

Security is critical when you install third-party skills. v0.26.0 introduces **Security Consent Prompts**, an informed consent system that shows you exactly what permissions a skill needs before installing it.

## Why is it Important?

Skills can access:

- **Credentials**: API keys, GitHub tokens, etc.
- **Local files**: Read and write on your system.
- **Sensitive data**: Project information, configuration.
- **System resources**: CPU, memory, network.

Without informed consent, you could install a malicious skill without knowing it.

## How it Works

### Secure Installation Flow

```
1. User executes: gemini skills install <skill>
   ↓
2. CLI fetches skill metadata
   ↓
3. System generates Security Consent Prompt
   ↓
4. User reviews required permissions
   ↓
5. User approves or rejects
   ↓
6. If approved: Installs skill
   If rejected: Cancels installation
```

## Security Consent Prompt Example

When you install a skill, you see something like:

```
┌──────────────────────────────────────────────────────────────┐
│ 🔒 SECURITY CONSENT PROMPT                                   │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│ Skill: github-pr-reviewer                                   │
│ Version: 1.2.0                                              │
│ Author: @username                                           │
│ Source: github.com/username/github-pr-reviewer              │
│                                                              │
│ INSTALL DESTINATION                                         │
│ ~/.gemini/skills/github-pr-reviewer/                        │
│                                                              │
│ PERMISSIONS REQUIRED                                        │
│ ✓ Read: GitHub API access                                  │
│ ✓ Read: Repository files                                   │
│ ✓ Write: Comment on PRs                                    │
│ ✓ Read: User credentials                                   │
│                                                              │
│ CAPABILITIES                                                │
│ • Access to GitHub API                                      │
│ • Read local project files                                  │
│ • Create/update GitHub comments                             │
│ • Store configuration locally                               │
│                                                              │
│ ⚠️  SECURITY WARNINGS                                        │
│ • This skill requires GitHub credentials                    │
│ • It can read all files in your projects                    │
│ • It can post comments on your behalf                       │
│                                                              │
│ Do you consent to install this skill? (y/n)                 │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

## Prompt Components

### 1. Skill Information

```
Skill: github-pr-reviewer
Version: 1.2.0
Author: @username
Source: github.com/username/github-pr-reviewer
```

**What to check**:
- Do you recognize the author?
- Is it the expected version?
- Is it the official source?

### 2. Installation Destination

```
INSTALL DESTINATION
~/.gemini/skills/github-pr-reviewer/
```

**What it means**: Where the skill files will be stored.

### 3. Required Permissions

```
PERMISSIONS REQUIRED
✓ Read: GitHub API access
✓ Read: Repository files
✓ Write: Comment on PRs
✓ Read: User credentials
```

**Permission categories**:
- **Read**: Read access.
- **Write**: Write access.
- **Execute**: Run commands.
- **Network**: Network access.

### 4. Capabilities

```
CAPABILITIES
• Access to GitHub API
• Read local project files
• Create/update GitHub comments
• Store configuration locally
```

**What it means**: What the skill can do with the permissions.

### 5. Security Warnings

```
⚠️  SECURITY WARNINGS
• This skill requires GitHub credentials
• It can read all files in your projects
• It can post comments on your behalf
```

**What to do**: Read carefully before approving.

## Risk Levels

Skills are classified by risk level:

### 🟢 LOW

```
Risk: LOW
Permissions: Read public files
Example: Skill that analyzes static code
```

**Safe to install**: Generally safe.

### 🟡 MEDIUM

```
Risk: MEDIUM
Permissions: Read local files, API access
Example: Skill that integrates with GitHub
```

**Review carefully**: Verify that you trust the author.

### 🔴 HIGH

```
Risk: HIGH
Permissions: Write files, command execution
Example: Skill that modifies your code automatically
```

**Maximum caution**: Only install if you trust completely.

## Non-Interactive Installation

For automation, use the `--consent` flag:

```bash
# Install with automatic consent
gemini skills install <skill> --consent

# Install without consent (rejects)
gemini skills install <skill> --no-consent
```

**Note**: Consent is recorded in debug logs.

## Conflict Detection

If a skill tries to overwrite another:

```
⚠️  SKILL CONFLICT DETECTED

The skill 'pr-reviewer' conflicts with 'pr-validator'
Both define the same commands: /review-pr

Options:
1. Replace existing skill (⚠️  WARNING: Will remove pr-validator)
2. Keep existing skill (pr-reviewer won't be installed)
3. Install with different name: pr-reviewer-alt

Choose option (1-3):
```

**What to do**: Generally choose option 2 or 3.

## Security Best Practices

### 1. Verify the Source

```bash
# ✅ Good: Official source
gemini skills install github.com/google-gemini/official-skills/pr-reviewer

# ❌ Bad: Unknown source
gemini skills install github.com/random-user/pr-reviewer
```

### 2. Review Required Permissions

Before installing, ask yourself:

- Does it really need these permissions?
- Does it have access to data it shouldn't?
- Can it modify critical files?

### 3. Use Separate Accounts

For third-party skills, consider:

```bash
# Create separate user for skills
useradd gemini-skills
su - gemini-skills
gemini skills install <skill>
```

### 4. Regularly Review Installed Skills

```bash
# List all skills
gemini skills list

# See skill details
gemini skills info <skill-name>

# See skill permissions
gemini skills permissions <skill-name>
```

### 5. Uninstall Unused Skills

```bash
# Uninstall a skill
gemini skills uninstall <skill-name>

# Uninstall all skills from an author
gemini skills uninstall --author <author>
```

## Security Configuration

### Always Require Approval

```json
{
  "security": {
    "requireSkillApproval": true,
    "allowAutoInstall": false
  }
}
```

### Trusted Authors Whitelist

```json
{
  "security": {
    "trustedAuthors": [
      "google-gemini",
      "username"
    ]
  }
}
```

### Restrict Permissions

```json
{
  "security": {
    "skillPermissions": {
      "allowFileWrite": false,
      "allowNetworkAccess": true,
      "allowCommandExecution": false
    }
  }
}
```

## Skill Audit

### See Recent Installations

```bash
gemini skills audit recent
```

Shows:
- Installed skill
- Installation date
- Author
- Granted permissions

### See Skill Access

```bash
gemini skills audit access
```

Shows:
- Which files each skill accessed.
- Which APIs it called.
- Which commands it executed.

### Generate Security Report

```bash
gemini skills audit report
```

Generates a report with:
- All installed skills.
- Permissions for each.
- Potential risks.
- Recommendations.

## Real Use Cases

### Case 1: Installing Official Skill

```bash
$ gemini skills install github.com/google-gemini/skills/code-reviewer

┌──────────────────────────────────────────────┐
│ Skill: code-reviewer                         │
│ Author: google-gemini (VERIFIED)             │
│ Risk: LOW                                    │
│                                              │
│ Permissions:                                 │
│ • Read: Code files                           │
│ • Read: Project structure                    │
│                                              │
│ Install? (y/n): y                            │
│                                              │
│ ✅ Skill successfully installed              │
└──────────────────────────────────────────────┘
```

### Case 2: Installing Third-Party Skill

```bash
$ gemini skills install github.com/someone/cool-skill

┌──────────────────────────────────────────────┐
│ Skill: cool-skill                            │
│ Author: someone (UNVERIFIED)                 │
│ Risk: MEDIUM                                 │
│                                              │
│ Permissions:                                 │
│ • Read: All files                            │
│ • Write: Project files                       │
│ • Network: GitHub API                        │
│                                              │
│ ⚠️  This skill has broad permissions         │
│ Do you trust the author? (y/n): n            │
│                                              │
│ ❌ Installation canceled                      │
└──────────────────────────────────────────────┘
```

### Case 3: Conflict Detection

```bash
$ gemini skills install github.com/user/pr-reviewer

⚠️  CONFLICT DETECTED
Skill 'pr-reviewer' already exists

Options:
1. Replace (you will lose the previous version)
2. Keep existing
3. Install as 'pr-reviewer-v2'

Choose (1-3): 2
✅ Installation canceled (existing skill kept)
```

## Troubleshooting

### Problem: "Permission Denied" when installing

**Cause**: Insufficient file permissions.

**Solution**: Verify permissions of ~/.gemini/

```bash
chmod 755 ~/.gemini/skills/
```

### Problem: Skill requires permissions I don't want to give

**Cause**: Poorly designed or malicious skill.

**Solution**: Do not install, or install alternative version.

```bash
gemini skills install <alternative-skill>
```

### Problem: Forgot what permissions a skill has

**Solution**: Verify with audit.

```bash
gemini skills permissions <skill-name>
```

## Next Steps

1. **Review installed skills**: `gemini skills list`
2. **Audit permissions**: `gemini skills audit`
3. **Configure security policies**: Add to settings.json
4. **Uninstall unused skills**: Reduce attack surface.
5. **Stay informed**: Read security advisories.

---

**Author**: Manus AI  
**Version**: v0.26.0-nightly.20260115  
**Last update**: January 2026

## References

- [Gemini CLI Security Guide](https://geminicli.com/docs/security)
- [PR #16549: Security Consent Prompts](https://github.com/google-gemini/gemini-cli/pull/16549)
- [Skills Best Practices](https://geminicli.com/docs/skills/best-practices)
