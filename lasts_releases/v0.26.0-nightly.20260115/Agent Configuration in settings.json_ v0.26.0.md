# Agent Configuration in settings.json: v0.26.0

## Introduction

One of the most powerful features of v0.26.0 is the ability to configure agents directly in `settings.json`. This allows you to customize the behavior of each agent without needing to modify code or use command-line flags.

## Why it Matters

In v0.25.0, agent configuration was limited and global. Now in v0.26.0:

- **Per-agent configuration**: Each agent can have its own configuration.
- **modelConfig override**: Customize temperature, top_p, max_tokens, etc.
- **runConfig override**: Control maxTurns, timeouts, and execution behavior.
- **Enable/Disable**: Activate or deactivate specific agents.
- **Persistence**: Configuration is maintained across sessions.

## Basic Structure

```json
{
  "agents": {
    "agentName": {
      "enabled": true,
      "modelConfig": {
        "temperature": 0.7,
        "topP": 0.95,
        "maxOutputTokens": 2048
      },
      "runConfig": {
        "maxTurns": 50,
        "timeout": 300000
      }
    }
  }
}
```

## Available Agents and Their Configurations

### 1. codebaseInvestigator

**Purpose**: Investigate and understand your codebase.

```json
{
  "agents": {
    "codebaseInvestigator": {
      "enabled": true,
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

**When to use this configuration**:
- **Low temperature (0.3)**: For precise and consistent analysis.
- **High maxOutputTokens (4096)**: For detailed reports.
- **High maxTurns (100)**: For complex investigations.

### 2. codeReviewer

**Purpose**: Review code and suggest improvements.

```json
{
  "agents": {
    "codeReviewer": {
      "enabled": true,
      "modelConfig": {
        "temperature": 0.5,
        "topP": 0.9,
        "maxOutputTokens": 2048
      },
      "runConfig": {
        "maxTurns": 30,
        "timeout": 180000
      }
    }
  }
}
```

**When to use this configuration**:
- **Medium temperature (0.5)**: Balance between creativity and precision.
- **Moderate maxTurns (30)**: Sufficient for deep analysis.
- **3-minute timeout**: Reasonable for reviews.

### 3. bugFixer

**Purpose**: Identify and fix bugs.

```json
{
  "agents": {
    "bugFixer": {
      "enabled": true,
      "modelConfig": {
        "temperature": 0.2,
        "maxOutputTokens": 3000
      },
      "runConfig": {
        "maxTurns": 50,
        "timeout": 300000
      }
    }
  }
}
```

**When to use this configuration**:
- **Very low temperature (0.2)**: For deterministic solutions.
- **Moderate maxTurns (50)**: For iterative debugging.

### 4. skillCreator

**Purpose**: Create and optimize skills.

```json
{
  "agents": {
    "skillCreator": {
      "enabled": true,
      "modelConfig": {
        "temperature": 0.7,
        "maxOutputTokens": 4096
      },
      "runConfig": {
        "maxTurns": 50,
        "timeout": 600000
      }
    }
  }
}
```

**When to use this configuration**:
- **Higher temperature (0.7)**: For creativity in design.
- **High maxOutputTokens**: For complete code.
- **Long timeout**: For complex development.

## modelConfig Parameters

| Parameter | Range | Default | Description |
|-----------|-------|---------|-------------|
| `temperature` | 0.0 - 2.0 | 1.0 | Creativity vs. determinism. 0 = deterministic, 2 = very creative. |
| `topP` | 0.0 - 1.0 | 0.95 | Token diversity. Low values = more focused. |
| `topK` | 1 - 40 | 40 | Number of tokens considered. |
| `maxOutputTokens` | 100 - 8000 | 2048 | Maximum response length. |
| `stopSequences` | Array | [] | Sequences that stop generation. |

## runConfig Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `maxTurns` | number | 30 | Maximum agent-user iterations. |
| `timeout` | ms | 300000 | Timeout in milliseconds (5 min). |
| `retryCount` | number | 3 | Retries in case of error. |
| `autoApprove` | boolean | false | Automatically approve changes. |

## Practical Use Cases

### Case 1: Optimize for Speed

You want Gemini to work fast, even if it sacrifices some precision:

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

**Result**: Responses in 30-60 seconds, less depth.

### Case 2: Optimize for Precision

You want maximum precision, regardless of time:

```json
{
  "agents": {
    "codeReviewer": {
      "modelConfig": {
        "temperature": 0.1,
        "maxOutputTokens": 4096,
        "topP": 0.8
      },
      "runConfig": {
        "maxTurns": 100,
        "timeout": 600000
      }
    }
  }
}
```

**Result**: Deep and precise analysis, may take 5-10 minutes.

### Case 3: Disable Unused Agents

If you don't use certain agents, disable them to improve performance:

```json
{
  "agents": {
    "bugFixer": {
      "enabled": false
    },
    "codebaseInvestigator": {
      "enabled": true
    }
  }
}
```

### Case 4: Per-Project Configuration

Different projects may need different configurations. Create multiple configurations:

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {
        "temperature": 0.3
      },
      "runConfig": {
        "maxTurns": 50
      }
    },
    "skillCreator": {
      "modelConfig": {
        "temperature": 0.8
      },
      "runConfig": {
        "maxTurns": 100
      }
    }
  }
}
```

## Advanced Configuration

### Allow Automatic Skill Installation

```json
{
  "agents": {
    "skillCreator": {
      "runConfig": {
        "autoApprove": true
      }
    }
  }
}
```

**Warning**: Use only if you fully trust the skills.

### Configure Stop Sequences

```json
{
  "agents": {
    "codeReviewer": {
      "modelConfig": {
        "stopSequences": ["---", "###", "FIN"]
      }
    }
  }
}
```

### Limit Tokens to Save Costs

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {
        "maxOutputTokens": 1000
      }
    }
  }
}
```

## Migration from v0.25.0

If you have v0.25.0 configuration, here is how to migrate:

### Before (v0.25.0):
```bash
gemini --agent codebaseInvestigator --temperature 0.3
```

### Now (v0.26.0):
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

**Advantage**: Configuration persists across sessions.

## Configuration Validation

To verify that your configuration is valid:

```bash
gemini > Validate my agents configuration
```

Or manually:

```bash
gemini config validate
```

## Troubleshooting

### Problem: Changes in settings.json are not applied

**Solution**: Restart Gemini CLI.

```bash
gemini quit
gemini
```

### Problem: Agent behaves differently than expected

**Solution**: Verify current configuration.

```bash
gemini > Show my agents configuration
```

### Problem: Timeout too short

**Symptom**: "Timeout exceeded" frequently.

**Solution**: Increase timeout.

```json
{
  "agents": {
    "agentName": {
      "runConfig": {
        "timeout": 900000
      }
    }
  }
}
```

## Best Practices

### 1. Document Your Configuration

Add comments explaining why each agent has that configuration:

```json
{
  "agents": {
    "codebaseInvestigator": {
      "modelConfig": {
        "temperature": 0.3
      },
      "runConfig": {
        "maxTurns": 100
      }
    }
  }
}
```

### 2. Use Profiles by Task Type

Create different configurations for different tasks:

- **Analysis**: low temperature, high maxTurns.
- **Generation**: high temperature, moderate maxTurns.
- **Debugging**: low temperature, high maxOutputTokens.

### 3. Monitor Performance

Record which configurations work best:

```bash
gemini > Show agents performance statistics
```

### 4. Update Gradually

Don't change everything at once. Adjust one parameter at a time and observe results.

## Integration with Skills

Skills can access agent configuration:

```typescript
// In your skill
const agentConfig = await gemini.getAgentConfig('codebaseInvestigator');
const temperature = agentConfig.modelConfig.temperature;
```

## Next Steps

1. **Review your current configuration**: `gemini config show`.
2. **Identify agents you use**: Which ones are your favorites?
3. **Optimize for your workflow**: Adjust temperature and maxTurns.
4. **Document your configuration**: Explain why each parameter.
5. **Share with your team**: Use standard configuration.

---

**Author**: Manus AI  
**Version**: v0.26.0-nightly.20260115  
**Last update**: January 2026
