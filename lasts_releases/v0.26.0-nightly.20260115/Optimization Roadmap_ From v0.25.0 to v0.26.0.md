# Optimization Roadmap: From v0.25.0 to v0.26.0

## Introduction

If you already have a robust setup in v0.25.0, this document guides you on how to optimize your workflow by taking advantage ONLY of the new features of v0.26.0, without breaking what already works.

## Compatibility Matrix

| v0.25.0 Feature | Status in v0.26.0 | Recommended Action |
|-----------------|-------------------|--------------------|
| Existing Skills | ✅ Compatible | Keep as they are |
| Existing Agents | ✅ Compatible | Migrate configuration to settings.json |
| MCPs            | ✅ Compatible | Update if there are new versions |
| Hooks           | ✅ Compatible | Keep as they are |
| Settings.json   | ✅ Compatible + Improved | Add "agents" section |

## 5-Phase Migration Plan

### Phase 1: Assessment (30 minutes)

**Objective**: Understand your current setup.

```bash
# 1. View current version
gemini --version

# 2. List installed skills
gemini skills list

# 3. View current configuration
gemini config show

# 4. List available agents
gemini agents list

# 5. Review settings.json
cat ~/.gemini/settings.json
```

**Checklist**:
- [ ] Identify critical skills.
- [ ] Identify most used agents.
- [ ] Document current configuration.
- [ ] Backup settings.json.

### Phase 2: Preparation (1 hour)

**Objective**: Prepare the ground for v0.26.0.

```bash
# 1. Configuration backup
cp ~/.gemini/settings.json ~/.gemini/settings.json.backup

# 2. Update to v0.26.0-nightly
gemini update --nightly

# 3. Verify installation
gemini --version

# 4. Validate existing skills
gemini skills validate
```

**Checklist**:
- [ ] Backup completed.
- [ ] Update successful.
- [ ] Skills validated.
- [ ] CLI working correctly.

### Phase 3: Configuration Migration (1 hour)

**Objective**: Migrate agent configuration to settings.json.

**Before (v0.25.0)**:
```bash
gemini --agent codebaseInvestigator --temperature 0.3
```

**After (v0.26.0)**:
```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {
        "temperature": 0.3
      }
    }
  }
}
```

**Steps**:

1. **Open settings.json**:
   ```bash
   nano ~/.gemini/settings.json
   ```

2. **Add agents section** (if it doesn't exist):
   ```json
   {
     "agents": {}
   }
   ```

3. **Migrate each agent**:
   ```json
   {
     "agents": {
       "codebaseInvestigator": {
         "enabled": true,
         "modelConfig": {
           "temperature": 0.3,
           "maxOutputTokens": 2048
         },
         "runConfig": {
           "maxTurns": 50
         }
       }
     }
   }
   ```

4. **Validate configuration**:
   ```bash
   gemini config validate
   ```

**Checklist**:
- [ ] "agents" section added.
- [ ] All agents migrated.
- [ ] Configuration validated.
- [ ] CLI restarted.

### Phase 4: Enable New Features (2 hours)

**Objective**: Activate new v0.26.0 features.

#### 4.1: Enable Skill-Creator

```json
{
  "agents": {
    "skillCreator": {
      "enabled": true,
      "modelConfig": {
        "temperature": 0.7
      }
    }
  }
}
```

**Test**:
```bash
gemini > Create a skill that validates commits
```

#### 4.2: Enable Experimental Plan Flag

```json
{
  "experimental": {
    "plan": true,
    "planningMode": "auto"
  }
}
```

**Test**:
```bash
gemini > Refactor my code to use TypeScript
```

You should see a plan before execution.

#### 4.3: Configure Security Consent

```json
{
  "security": {
    "requireSkillApproval": true
  }
}
```

**Test**:
```bash
gemini skills install <skill>
```

You should see a consent prompt.

**Checklist**:
- [ ] Skill-creator enabled and tested.
- [ ] Plan flag enabled and tested.
- [ ] Security consent working.
- [ ] All new features tested.

### Phase 5: Optimization (1-2 hours)

**Objective**: Optimize configuration for your workflow.

#### 5.1: Optimize Agents

For each agent you use frequently:

```bash
gemini > Analyze my workflow and suggest optimal configuration
```

Then update settings.json:

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {
        "temperature": 0.3,
        "maxOutputTokens": 4096
      },
      "runConfig": {
        "maxTurns": 100,
        "timeout": 600000
      }
    }
  }
}
```

#### 5.2: Create Custom Skills

Use skill-creator to create team-specific skills:

```bash
gemini > Create a skill that validates our code conventions
```

#### 5.3: Document Configuration

Create a documentation file:

```bash
cat > ~/.gemini/CONFIG_NOTES.md << 'EOF'
# Optimized Gemini CLI Configuration

## Configured Agents

### codebaseInvestigator
- Temperature: 0.3 (precise analysis)
- MaxTurns: 100 (complex investigations)
- Use case: Understanding new code

### skillCreator
- Temperature: 0.7 (creativity)
- MaxTurns: 50 (skill development)
- Use case: Creating custom skills

## Enabled Features

- ✅ Experimental Plan Mode
- ✅ Security Consent Prompts
- ✅ Skill-Creator

## Custom Skills

- pr-validator: Validates PRs
- commit-linter: Validates commits
- ...
EOF
```

**Checklist**:
- [ ] Optimized agents.
- [ ] Custom skills created.
- [ ] Configuration documented.
- [ ] Team informed of changes.

## Recommended Configuration for Different Profiles

### Profile 1: Individual Developer

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {"temperature": 0.3},
      "runConfig": {"maxTurns": 50}
    },
    "skillCreator": {
      "modelConfig": {"temperature": 0.7},
      "runConfig": {"maxTurns": 30}
    }
  },
  "experimental": {
    "plan": true,
    "planningMode": "auto"
  }
}
```

### Profile 2: Development Team

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {"temperature": 0.2},
      "runConfig": {"maxTurns": 100}
    },
    "codeReviewer": {
      "modelConfig": {"temperature": 0.5},
      "runConfig": {"maxTurns": 30}
    },
    "skillCreator": {
      "modelConfig": {"temperature": 0.7},
      "runConfig": {"maxTurns": 50}
    }
  },
  "experimental": {
    "plan": true,
    "planningMode": "manual",
    "requirePlanApproval": true
  },
  "security": {
    "requireSkillApproval": true,
    "trustedAuthors": ["google-gemini", "team-username"]
  }
}
```

### Profile 3: Large Enterprise

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {"temperature": 0.1},
      "runConfig": {"maxTurns": 100}
    },
    "codeReviewer": {
      "modelConfig": {"temperature": 0.3},
      "runConfig": {"maxTurns": 50}
    },
    "skillCreator": {
      "modelConfig": {"temperature": 0.5},
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
    "allowAutoInstall": false,
    "trustedAuthors": ["company-official"],
    "skillPermissions": {
      "allowFileWrite": true,
      "allowNetworkAccess": true,
      "allowCommandExecution": false
    }
  }
}
```

## Rollback Plan

If something goes wrong, you can go back to v0.25.0:

```bash
# 1. Restore backup
cp ~/.gemini/settings.json.backup ~/.gemini/settings.json

# 2. Revert to v0.25.0
gemini update --version 0.25.0

# 3. Restart CLI
gemini quit
gemini
```

## Post-Migration Validation

After completing the migration, verify:

```bash
# 1. All skills work
gemini skills list
gemini skills validate

# 2. Agents respond correctly
gemini > Analyze my project

# 3. New features work
gemini > Create a plan to refactor my code

# 4. Security prompts appear
gemini skills install <skill>

# 5. Configuration persists
gemini config show
```

## Success Metrics

After migration, you should see:

| Metric | Before | After |
|--------|--------|-------|
| Time to create skill | 30 min | 5 min |
| Validation errors | Frequent | Rare |
| Transparency in complex tasks | Low | High |
| Security in skill installation | Manual | Automatic |
| Consistent configuration | No | Yes |

## Next Steps

1. **Week 1**: Complete Phases 1-3.
2. **Week 2**: Complete Phases 4-5.
3. **Week 3**: Optimize and document.
4. **Week 4**: Train the team.

## Support and Help

If you have problems:

```bash
# View detailed logs
gemini logs show

# Validate configuration
gemini config validate

# Ask Gemini for help
gemini > I have problems with [feature]
```

---

**Author**: Manus AI  
**Version**: v0.26.0-nightly.20260115  
**Last update**: January 2026
