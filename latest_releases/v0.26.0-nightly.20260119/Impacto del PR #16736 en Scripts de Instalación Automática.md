# Impacto del PR #16736 en Scripts de Instalación Automática

## Resumen Ejecutivo

**SÍ, TE AFECTA.** El PR #16736 cambia la estructura de configuración de Agent Skills de forma que impactará directamente tu script de instalación automática.

## ¿Qué Cambió?

### Antes (v0.26.0-nightly.20260115)

```json
{
  "experimental": {
    "skills": false  // Agent Skills en experimental
  }
}
```

### Ahora (v0.26.0-nightly.20260119)

```json
{
  "skills": {
    "enabled": true  // Agent Skills promovido a top-level
  }
}
```

## Cambios Específicos

### 1. Cambio de Ubicación

| Antes | Ahora | Impacto |
|-------|-------|--------|
| `experimental.skills` | `skills.enabled` | Ruta completamente diferente |
| Experimental toggle | Top-level feature | Ya no es experimental |
| `false` por defecto | `true` por defecto | Habilitado automáticamente |

### 2. Backward Compatibility

El PR mantiene **compatibilidad hacia atrás**:
- Sigue soportando `experimental.skills` para usuarios en versiones antiguas
- Pero la nueva ruta es `skills.enabled`
- Eventualmente `experimental.skills` será deprecado

### 3. Default State

**IMPORTANTE**: Ahora `skills.enabled` es `true` por defecto.

Esto significa:
- Si NO especificas `skills.enabled` en tu settings.json, será `true`
- Si quieres deshabilitar skills, debes explícitamente poner `false`

## Cómo Te Afecta Tu Script

### Escenario 1: Script que Habilita Skills

**Antes**:
```json
{
  "experimental": {
    "skills": true
  }
}
```

**Ahora - Opción A (Recomendado)**:
```json
{
  "skills": {
    "enabled": true
  }
}
```

**Ahora - Opción B (Confiar en default)**:
```json
{
  // No especificar skills.enabled
  // Será true por defecto
}
```

### Escenario 2: Script que Deshabilita Skills

**Antes**:
```json
{
  "experimental": {
    "skills": false
  }
}
```

**Ahora - Opción A (Explícito)**:
```json
{
  "skills": {
    "enabled": false
  }
}
```

**Ahora - Opción B (Confiar en default)**:
```json
{
  // No especificar skills.enabled
  // Será true por defecto, así que NECESITAS especificar false si quieres deshabilitar
}
```

### Escenario 3: Script que Configura Múltiples Opciones

**Antes**:
```json
{
  "experimental": {
    "skills": true,
    "plan": true
  }
}
```

**Ahora**:
```json
{
  "skills": {
    "enabled": true
  },
  "experimental": {
    "plan": true
  }
}
```

## Cambios en la Estructura Interna

### Archivos Afectados

Según el PR, estos archivos fueron modificados:

1. **config.ts**: Lógica de configuración actualizada
2. **settingsSchema.test.ts**: Tests de regresión añadidos
3. Documentación interna actualizada

### Cambios Clave en config.ts

El PR cambió cómo se lee la configuración:

```typescript
// Antes
const skillsEnabled = config.experimental?.skills ?? false;

// Ahora
const skillsEnabled = config.skills?.enabled ?? true;
```

**Impacto**: El default cambió de `false` a `true`.

## Cómo Actualizar Tu Script

### Paso 1: Identificar tu Caso

¿Tu script actualmente:
- [ ] Habilita skills explícitamente?
- [ ] Deshabilita skills explícitamente?
- [ ] No especifica skills (usa default)?

### Paso 2: Actualizar Configuración

**Si habilitas skills**:
```bash
# Antes
jq '.experimental.skills = true' ~/.gemini/settings.json

# Ahora
jq '.skills.enabled = true' ~/.gemini/settings.json
```

**Si deshabilitas skills**:
```bash
# Antes
jq '.experimental.skills = false' ~/.gemini/settings.json

# Ahora
jq '.skills.enabled = false' ~/.gemini/settings.json
```

**Si no especificas (usa default)**:
```bash
# Antes: Necesitabas habilitar explícitamente
jq '.experimental.skills = true' ~/.gemini/settings.json

# Ahora: Ya está habilitado por defecto, no necesitas hacer nada
# Pero si quieres ser explícito:
jq '.skills.enabled = true' ~/.gemini/settings.json
```

### Paso 3: Validar Cambios

```bash
# Ver configuración actual
gemini config show

# Verificar skills
gemini skills list

# Validar que funciona
gemini > @codebaseInvestigator analiza mi proyecto
```

## Script de Migración Automática

Si tienes un script que necesita migrar, aquí te dejo un ejemplo:

```bash
#!/bin/bash
# Script para migrar settings.json de v0.26.0-nightly.20260115 a v0.26.0-nightly.20260119

SETTINGS_FILE="$HOME/.gemini/settings.json"

# Backup
cp "$SETTINGS_FILE" "$SETTINGS_FILE.backup.20260115"

# Si existe experimental.skills, migrar a skills.enabled
if jq -e '.experimental.skills' "$SETTINGS_FILE" > /dev/null 2>&1; then
    SKILLS_VALUE=$(jq '.experimental.skills' "$SETTINGS_FILE")
    
    # Eliminar experimental.skills
    jq 'del(.experimental.skills)' "$SETTINGS_FILE" > "$SETTINGS_FILE.tmp"
    
    # Añadir skills.enabled
    jq ".skills.enabled = $SKILLS_VALUE" "$SETTINGS_FILE.tmp" > "$SETTINGS_FILE"
    
    rm "$SETTINGS_FILE.tmp"
    
    echo "✓ Migración completada"
    echo "  Valor anterior: experimental.skills = $SKILLS_VALUE"
    echo "  Nuevo valor: skills.enabled = $SKILLS_VALUE"
else
    echo "ℹ No se encontró experimental.skills, asumiendo default (true)"
    jq '.skills.enabled = true' "$SETTINGS_FILE" > "$SETTINGS_FILE.tmp"
    mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
fi

# Validar
gemini config validate
```

## Impacto en Diferentes Tipos de Scripts

### Script de Setup Inicial

**Antes**:
```bash
#!/bin/bash
# Setup inicial de Gemini CLI

mkdir -p ~/.gemini

cat > ~/.gemini/settings.json << 'EOF'
{
  "experimental": {
    "skills": true
  },
  "agents": {
    "codebaseInvestigator": {
      "enabled": true
    }
  }
}
EOF
```

**Ahora**:
```bash
#!/bin/bash
# Setup inicial de Gemini CLI

mkdir -p ~/.gemini

cat > ~/.gemini/settings.json << 'EOF'
{
  "skills": {
    "enabled": true
  },
  "agents": {
    "generalist": {
      "enabled": true
    }
  }
}
EOF
```

### Script de Instalación de Skills

**Antes**:
```bash
#!/bin/bash
# Instalar skills

# Asegurar que skills están habilitados
jq '.experimental.skills = true' ~/.gemini/settings.json > ~/.gemini/settings.json.tmp
mv ~/.gemini/settings.json.tmp ~/.gemini/settings.json

# Instalar skills
gemini skills install ./my-skill
```

**Ahora**:
```bash
#!/bin/bash
# Instalar skills

# Skills ya están habilitados por defecto, pero podemos ser explícitos
jq '.skills.enabled = true' ~/.gemini/settings.json > ~/.gemini/settings.json.tmp
mv ~/.gemini/settings.json.tmp ~/.gemini/settings.json

# Instalar skills
gemini skills install ./my-skill
```

### Script de Configuración de Equipo

**Antes**:
```bash
#!/bin/bash
# Configurar Gemini CLI para equipo

for member in dev1 dev2 dev3; do
    ssh $member "mkdir -p ~/.gemini && cat > ~/.gemini/settings.json << 'EOF'
{
  \"experimental\": {
    \"skills\": true
  },
  \"admin\": {
    \"enableAdminControls\": true
  }
}
EOF"
done
```

**Ahora**:
```bash
#!/bin/bash
# Configurar Gemini CLI para equipo

for member in dev1 dev2 dev3; do
    ssh $member "mkdir -p ~/.gemini && cat > ~/.gemini/settings.json << 'EOF'
{
  \"skills\": {
    \"enabled\": true
  },
  \"admin\": {
    \"enableAdminControls\": true
  }
}
EOF"
done
```

## Checklist de Actualización

- [ ] Identificar dónde usas `experimental.skills` en tu script
- [ ] Cambiar a `skills.enabled`
- [ ] Invertir lógica si es necesario (default cambió de false a true)
- [ ] Probar con v0.26.0-nightly.20260119
- [ ] Validar que skills funcionan: `gemini skills list`
- [ ] Actualizar documentación de tu script
- [ ] Comunicar cambios a tu equipo

## Preguntas Frecuentes

**P: ¿Necesito cambiar mi script inmediatamente?**  
R: No urgentemente, pero sí antes de pasar a v0.26.0-stable. El PR mantiene compatibilidad hacia atrás por ahora.

**P: ¿Qué pasa si no cambio mi script?**  
R: Seguirá funcionando por ahora (compatibilidad hacia atrás), pero eventualmente `experimental.skills` será deprecado.

**P: ¿Cuál es el mejor enfoque?**  
R: Usar `skills.enabled` en lugar de `experimental.skills`. Es la nueva forma estándar.

**P: ¿Necesito especificar `skills.enabled = true`?**  
R: No, es el default. Pero es buena práctica ser explícito en scripts de instalación.

**P: ¿Y si quiero deshabilitar skills?**  
R: Ahora NECESITAS especificar `skills.enabled = false` porque el default es true.

## Impacto en Tu Repositorio de Skills

Si tienes un repositorio con múltiples skills y un script de instalación automática:

### Estructura Actual

```
my-skills-repo/
├── install.sh
├── settings.json.template
├── skills/
│   ├── skill-1/
│   ├── skill-2/
│   └── skill-3/
└── README.md
```

### Cambios Necesarios

**install.sh**:
```bash
# Cambiar referencias a experimental.skills
sed -i 's/experimental\.skills/skills.enabled/g' ~/.gemini/settings.json
```

**settings.json.template**:
```json
{
  "skills": {
    "enabled": true
  },
  "agents": {
    "generalist": {
      "enabled": true
    }
  }
}
```

**README.md**:
```markdown
# Instalación

1. Ejecutar: `./install.sh`
2. Verificar: `gemini skills list`
3. Usar: `gemini > @skill-name ...`

## Configuración

Skills están habilitados por defecto en v0.26.0+.
Para deshabilitar: `jq '.skills.enabled = false' ~/.gemini/settings.json`
```

## Próximos Pasos

1. **Revisa tu script actual** y identifica dónde usas `experimental.skills`
2. **Actualiza a la nueva ruta**: `skills.enabled`
3. **Prueba con v0.26.0-nightly.20260119**
4. **Valida que skills funcionan**
5. **Documenta los cambios** para tu equipo

## Recursos

- [PR #16736: Enable agent skills by default](https://github.com/google-gemini/gemini-cli/pull/16736)
- [PR #16734: Update documentation about skills on-by-default](https://github.com/google-gemini/gemini-cli/pull/16734)
- [Gemini CLI Documentation](https://geminicli.com/docs/)

---

**Autor**: Manus AI  
**Versión**: v0.26.0-nightly.20260119.20580d754  
**Última actualización**: Enero 2026

## Resumen Rápido

| Aspecto | Antes | Ahora | Acción |
|--------|-------|-------|--------|
| **Ubicación** | `experimental.skills` | `skills.enabled` | Actualizar ruta |
| **Default** | `false` | `true` | Ajustar lógica si deshabilitas |
| **Compatibilidad** | N/A | Hacia atrás | Funciona por ahora |
| **Urgencia** | N/A | Media | Antes de v0.26.0-stable |
| **Impacto** | Bajo | Bajo-Medio | Cambio simple en scripts |
