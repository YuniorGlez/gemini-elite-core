# Plan Mode Mejorado: Seguridad y Control en v0.26.0-nightly.20260119

## Introducción

La versión v0.26.0-nightly.20260119 introduce mejoras significativas al Plan Mode experimental. El cambio más importante es la **aplicación de políticas read-only estrictas** que previenen que el plan ejecute operaciones peligrosas sin aprobación explícita.

## ¿Qué ha Cambiado?

### v0.26.0-nightly.20260115

```
Plan Mode:
├─ Genera planes
├─ Muestra al usuario
├─ Ejecuta si aprueba
└─ Sin restricciones de operaciones
```

**Problema**: El plan podría ejecutar operaciones peligrosas (escritura de archivos, eliminación, etc.)

### v0.26.0-nightly.20260119

```
Plan Mode:
├─ Genera planes
├─ Muestra al usuario
├─ Valida contra políticas read-only
├─ Detiene si viola políticas
└─ Requiere aprobación explícita para operaciones peligrosas
```

**Mejora**: Mayor seguridad y control

## Políticas Read-Only Estrictas

### Qué es Read-Only Policy?

Una política que define qué operaciones son "seguras" (read-only) y cuáles requieren aprobación:

**Operaciones Permitidas (Read-Only)**:
- Leer archivos
- Analizar código
- Ejecutar tests
- Generar reportes
- Consultar APIs (GET)

**Operaciones Restringidas (Write)**:
- Escribir archivos
- Modificar código
- Eliminar archivos
- Cambiar configuración
- Hacer commits

### Halt on Violation

Si el plan intenta una operación restringida, se detiene automáticamente:

```
📋 PLAN GENERADO

Fase 1: Análisis (5 min) ✓ READ-ONLY
├─ Escanear archivos
├─ Analizar estructura
└─ Generar reporte

Fase 2: Refactoring (10 min) ⚠️ WRITE OPERATION
├─ Modificar componentes
├─ Actualizar imports
└─ Reformatear código

❌ HALT: Violación de política read-only en Fase 2

La Fase 2 requiere operaciones de escritura.
¿Apruebas que el plan continúe con operaciones de escritura? (y/n)
```

## Configuración de Plan Mode Mejorado

### Configuración Básica

```json
{
  "experimental": {
    "plan": true,
    "planningMode": "auto",
    "planVisualization": true,
    "requirePlanApproval": false,
    "enforceReadOnlyPolicy": true,
    "haltOnPolicyViolation": true
  }
}
```

### Parámetros Nuevos

| Parámetro | Tipo | Predeterminado | Descripción |
|-----------|------|----------------|-------------|
| `enforceReadOnlyPolicy` | boolean | true | Aplicar políticas read-only |
| `haltOnPolicyViolation` | boolean | true | Detener si viola política |
| `allowedWriteOperations` | array | [] | Operaciones de escritura permitidas |
| `readOnlyTimeout` | number | 60000 | Timeout para operaciones read-only |

## Cambios en Operaciones Permitidas

### Antes (v0.26.0-nightly.20260115)

```json
{
  "plan": {
    "allowedOperations": [
      "read_files",
      "read_many_files",
      "analyze_code",
      "run_tests",
      "write_files",
      "delete_files",
      "execute_commands"
    ]
  }
}
```

### Ahora (v0.26.0-nightly.20260119)

```json
{
  "plan": {
    "readOnlyOperations": [
      "read_files",
      "analyze_code",
      "run_tests",
      "generate_reports"
    ],
    "restrictedOperations": [
      "write_files",
      "delete_files",
      "execute_commands",
      "read_many_files"
    ]
  }
}
```

**Cambio importante**: `read_many_files` ahora es operación restringida, no read-only.

## Ejemplos de Planes con Nuevas Políticas

### Ejemplo 1: Análisis Seguro

```bash
gemini > Analiza mi proyecto y genera un reporte
```

**Resultado**:

```
📋 PLAN: Análisis de Proyecto

Fase 1: Escaneo (5 min) ✓ READ-ONLY
├─ Leer estructura de directorios
├─ Analizar archivos
└─ Generar estadísticas

Fase 2: Análisis (10 min) ✓ READ-ONLY
├─ Analizar dependencias
├─ Detectar patrones
└─ Identificar problemas

Fase 3: Reporte (5 min) ✓ READ-ONLY
├─ Generar reporte
├─ Crear visualizaciones
└─ Guardar en memoria

✅ Plan completamente read-only
Puedes ejecutar sin riesgos.

¿Ejecutar? (y/n):
```

### Ejemplo 2: Refactoring con Aprobación

```bash
gemini > Refactoriza mi código para usar TypeScript
```

**Resultado**:

```
📋 PLAN: Refactoring a TypeScript

Fase 1: Análisis (5 min) ✓ READ-ONLY
├─ Analizar código actual
├─ Identificar tipos
└─ Planificar cambios

Fase 2: Refactoring (15 min) ⚠️ WRITE OPERATION
├─ Crear archivos .ts
├─ Modificar código
└─ Actualizar imports

Fase 3: Testing (10 min) ✓ READ-ONLY
├─ Ejecutar tests
├─ Validar tipos
└─ Generar reporte

⚠️ WRITE OPERATIONS DETECTED

Fase 2 requiere operaciones de escritura:
- Crear 12 archivos
- Modificar 8 archivos
- Eliminar 0 archivos

¿Apruebas estas operaciones? (y/n):
```

## Flujo de Aprobación Mejorado

### Paso 1: Plan Generation

```
Usuario: "Refactoriza mi código"
    ↓
Generalist Agent genera plan
    ↓
Valida contra políticas
```

### Paso 2: Validation

```
Plan validado:
├─ Fases read-only: ✓ Seguras
├─ Fases write: ⚠️ Requieren aprobación
└─ Fases peligrosas: ❌ Bloqueadas
```

### Paso 3: Presentation

```
Mostrar al usuario:
├─ Resumen del plan
├─ Operaciones read-only (✓ seguras)
├─ Operaciones write (⚠️ requieren aprobación)
└─ Operaciones bloqueadas (❌ no permitidas)
```

### Paso 4: Approval

```
Usuario aprueba:
├─ Fases read-only: Ejecutan automáticamente
├─ Fases write: Requieren confirmación
└─ Fases peligrosas: Bloqueadas
```

## Configuración por Nivel de Seguridad

### Nivel 1: Máxima Seguridad (Empresas)

```json
{
  "experimental": {
    "plan": true,
    "planningMode": "strict",
    "enforceReadOnlyPolicy": true,
    "haltOnPolicyViolation": true,
    "requirePlanApproval": true,
    "allowedWriteOperations": []
  }
}
```

**Comportamiento**: Todos los planes requieren aprobación, operaciones write bloqueadas.

### Nivel 2: Balance (Equipos)

```json
{
  "experimental": {
    "plan": true,
    "planningMode": "manual",
    "enforceReadOnlyPolicy": true,
    "haltOnPolicyViolation": true,
    "requirePlanApproval": true,
    "allowedWriteOperations": [
      "write_files",
      "create_files"
    ]
  }
}
```

**Comportamiento**: Planes requieren aprobación, algunas operaciones write permitidas.

### Nivel 3: Confianza (Individuos)

```json
{
  "experimental": {
    "plan": true,
    "planningMode": "auto",
    "enforceReadOnlyPolicy": true,
    "haltOnPolicyViolation": false,
    "requirePlanApproval": false,
    "allowedWriteOperations": [
      "write_files",
      "create_files",
      "delete_files"
    ]
  }
}
```

**Comportamiento**: Planes se ejecutan automáticamente si pasan validación.

## Casos de Uso

### Caso 1: Auditoría de Seguridad

```bash
gemini > Audita mi aplicación para vulnerabilidades de seguridad
```

**Plan generado**:
- Todas las operaciones read-only
- Se ejecuta automáticamente
- Genera reporte detallado

### Caso 2: Refactoring Controlado

```bash
gemini > Refactoriza mi código para usar async/await
```

**Plan generado**:
- Fase 1: Análisis (read-only)
- Fase 2: Refactoring (write, requiere aprobación)
- Fase 3: Testing (read-only)

**Usuario aprueba Fase 2**, se ejecuta con confirmación.

### Caso 3: Migración de Base de Datos

```bash
gemini > Migra mi base de datos de MongoDB a PostgreSQL
```

**Plan generado**:
- Fase 1: Análisis (read-only)
- Fase 2: Preparación (write, requiere aprobación)
- Fase 3: Migración (write, requiere aprobación)
- Fase 4: Validación (read-only)

**Usuario aprueba cada fase** antes de ejecutar.

## Mejoras de Seguridad

### 1. Prevención de Operaciones Peligrosas

```bash
# Antes: Podría ejecutar sin confirmación
gemini > Elimina todos los archivos .log

# Ahora: Requiere aprobación explícita
gemini > Elimina todos los archivos .log
# ⚠️ OPERACIÓN PELIGROSA DETECTADA
# ¿Realmente quieres eliminar 150 archivos? (y/n)
```

### 2. Auditoría de Cambios

```bash
gemini > Muestra qué cambios hará el plan
```

**Resultado**:

```
CAMBIOS PLANIFICADOS:

Archivos a crear: 5
├─ src/components/Login.tsx
├─ src/components/Register.tsx
├─ src/hooks/useAuth.ts
├─ src/types/auth.ts
└─ src/utils/auth.ts

Archivos a modificar: 8
├─ src/App.tsx
├─ src/index.tsx
├─ package.json
└─ ...

Archivos a eliminar: 2
├─ src/old-auth.js
└─ src/old-login.js

¿Continuar? (y/n):
```

### 3. Rollback Automático

Si algo sale mal durante ejecución:

```bash
❌ Error en Fase 2: Fallo al escribir archivo

Ejecutando rollback...
✓ Revertido: src/components/Login.tsx
✓ Revertido: src/hooks/useAuth.ts
✓ Revertido: src/types/auth.ts

Estado anterior restaurado.
```

## Integración con Admin Controls

Los administradores pueden forzar políticas:

```json
{
  "admin": {
    "enforcedPolicies": {
      "planMode": "strict",
      "readOnlyPolicy": true,
      "requireApproval": true
    }
  }
}
```

Esto sobrescribe configuración individual del usuario.

## Troubleshooting

### Problema: Plan bloqueado por política read-only

**Causa**: Intenta operación no permitida

**Solución**: Aprueba operaciones write

```bash
gemini > Aprueba operaciones write en el plan
```

### Problema: Demasiadas confirmaciones

**Causa**: Configuración muy restrictiva

**Solución**: Ajusta allowedWriteOperations

```json
{
  "experimental": {
    "allowedWriteOperations": [
      "write_files",
      "create_files"
    ]
  }
}
```

### Problema: Plan se ejecuta sin confirmación

**Causa**: requirePlanApproval es false

**Solución**: Actívalo

```json
{
  "experimental": {
    "requirePlanApproval": true
  }
}
```

## Migración desde v0.26.0-nightly.20260115

Si usas la versión anterior:

```bash
# Actualizar
gemini update --nightly

# Revisar configuración
gemini config show

# Ajustar según necesidades
nano ~/.gemini/settings.json
```

**Cambios recomendados**:

```json
{
  "experimental": {
    "plan": true,
    "enforceReadOnlyPolicy": true,
    "haltOnPolicyViolation": true
  }
}
```

## Próximos Pasos

1. **Actualiza a v0.26.0-nightly.20260119**
2. **Prueba Plan Mode** con nuevas políticas
3. **Configura según tu nivel de seguridad**
4. **Documenta políticas** para tu equipo
5. **Entrena al equipo** en nuevas aprobaciones

---

**Autor**: Manus AI  
**Versión**: v0.26.0-nightly.20260119.20580d754  
**Última actualización**: Enero 2026
