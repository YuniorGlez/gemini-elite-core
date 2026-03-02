---
name: context-compression
description: Estrategias de compresión y resumen de contexto para sesiones largas, optimizando "Tokens-Per-Task" y manteniendo la integridad de los artefactos.
---

# 📉 Context Compression Strategies

Esta habilidad permite gestionar sesiones de agentes de larga duración que generan millones de tokens. El objetivo no es solo reducir tokens por petición, sino optimizar la eficiencia total de la tarea (**Tokens-Per-Task**), minimizando la pérdida de información crítica.

> **Mental Model**: La compresión es una destilación, no un recorte. Estructurar el resumen fuerza la preservación de detalles técnicos que de otro modo se perderían en resúmenes genéricos.

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Media**. Una compresión agresiva puede causar que el agente "olvide" decisiones previas o cambios en archivos.
- **Libertad: Alta** en la elección del método de compresión según el estado de la sesión.

## 🚀 Cuándo Activar
- Cuando las sesiones exceden los límites prácticos de latencia o costo.
- En codebases masivos (5M+ tokens) donde el contexto relevante debe ser seleccionado quirúrgicamente.
- Al diseñar sistemas de memoria persistente para agentes.
- Para depurar casos donde el agente pierde el rastro de sus propias modificaciones (**Artifact Trail**).

## 🧠 Conceptos Core

### 1. El Indicador Real: Tokens-Per-Task
No optimices para "tokens por petición". Una estrategia que ahorra 1% de tokens pero obliga al agente a re-leer 5 archivos desperdicia recursos. El éxito se mide en tokens totales hasta completar la tarea.

### 2. Estrategias de Compresión
| Método | Ratio | Calidad | Uso Ideal |
| :--- | :--- | :--- | :--- |
| **Anchored Iterative** | 98.6% | **3.70** | Sesiones de código largas, tracking de archivos. |
| **Regenerative Summary** | 98.7% | 3.44 | Cambios de fase claros en el proyecto. |
| **Opaque Compression** | **99.3%** | 3.35 | Ahorro máximo, baja necesidad de recall técnico. |

### 3. El Problema del "Artifact Trail"
Es la dimensión más débil de la compresión. Los agentes suelen olvidar qué archivos modificaron exactamente. 
- *Solución*: Mantener una sección explícita de "Files Modified" en el resumen comprimido.

## 🛠️ Implementación en Gemini Elite Core

### Patrón: Anchored Iterative Summarization
Define secciones rígidas que actúan como "anclas" para la información.

```markdown
## Session Intent
[Propósito original del usuario]

## Files Modified
- path/to/file.ts: [Cambio atómico]

## Decisions Made
- [Razón detrás de la arquitectura elegida]

## Current State & Next Steps
- [Tests pasando/fallando]
- [Siguiente acción inmediata]
```

### Disparadores (Triggers)
- **Umbral Fijo**: Al alcanzar el 70-80% del contexto útil.
- **Ventana Deslizante**: Mantener las últimas N vueltas + Resumen Estructurado.

---

## 🔗 Integraciones
- `context-fundamentals`: Base para la jerarquía de información.
- `evaluation`: Uso de "Probe-Based Evaluation" para medir la calidad del resumen.
- `memory-systems`: Persistencia de resúmenes en sistemas de memoria a largo plazo.

## 📚 Referencias Internas
- `references/evaluation-framework.md`: Framework completo de evaluación (Recall, Artifact, Decision probes).
