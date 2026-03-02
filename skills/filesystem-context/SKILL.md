---
name: filesystem-context
description: Uso del sistema de archivos como extensión de la ventana de contexto, persistencia de planes, comunicación entre sub-agentes y carga dinámica de habilidades.
---

# 📂 Filesystem as Extended Context

Esta habilidad permite utilizar el sistema de archivos local como una capa de memoria persistente y extendida. El objetivo es descargar información verbosa o estática (logs, planes detallados, documentación masiva) fuera de la ventana de contexto activa, manteniendo solo referencias de alta señal.

> **Mental Model**: El sistema de archivos es el "disco duro" del agente, mientras que el contexto es la "RAM". Optimizar el flujo entre ambos maximiza la capacidad de razonamiento sin saturar la atención.

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Baja**. El sistema de archivos es un medio estable y confiable.
- **Libertad: Muy Alta** en la organización de directorios y formatos de persistencia.

## 🚀 Cuándo Activar
- En sesiones de depuración con salidas de terminal masivas.
- Al coordinar tareas complejas entre múltiples sub-agentes.
- Para mantener planes de ejecución de larga duración que sobrevivan a reinicios de sesión.
- Al implementar sistemas de auto-modificación o aprendizaje de preferencias.

## 🧠 Conceptos Core

### 1. El Patrón Scratchpad
Usa archivos temporales (`.scratch`, `plans/`) para anotar ideas, borradores de código o resultados de investigación antes de integrarlos en la solución final.

### 2. Offloading de Observaciones
Mueve salidas de herramientas verbosas (ej. `npm test` con 1000 líneas) a un archivo y proporciona al modelo un resumen y el path.

### 3. Persistencia de Planes (Stateful Agents)
Guarda el estado actual del plan en un archivo YAML/Markdown para que el agente (o uno nuevo) pueda retomar exactamente donde se quedó.

## 🛠️ Implementación en Gemini Elite Core

### Patrón: Directorio de Trabajo Estructurado
Define una jerarquía clara para que el agente sepa dónde buscar cada tipo de "memoria".

```text
.gemini/
├── scratch/          # Archivos efímeros de trabajo
├── plans/            # Planes de tareas activos
├── agents/           # Workspaces de sub-agentes
└── preferences.yaml  # Preferencias aprendidas
```

### Patrón: Dynamic Skill Loading
No cargues todas las habilidades al inicio. Carga el `SKILL.md` completo solo cuando el agente detecte que es relevante para la tarea actual.

```markdown
<OFFLOADED_CONTEXT>
- Skill: advanced-evaluation (Path: skills/advanced-evaluation/SKILL.md)
- Reason: User requested LLM-as-a-Judge implementation.
</OFFLOADED_CONTEXT>
```

---

## 🔗 Integraciones
- `context-optimization`: El filesystem es la herramienta principal para la "compactación" de contexto.
- `multi-agent-patterns`: Uso de workspaces compartidos para comunicación asíncrona.
- `project-development`: Tracking de hitos y progreso en archivos de proyecto.

## 📚 Referencias Internas
- `references/implementation-patterns.md`: Librería de clases y scripts para ScratchPad, PlanPersistence y Workspaces.
