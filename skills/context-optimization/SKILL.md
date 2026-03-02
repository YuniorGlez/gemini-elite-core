---
name: context-optimization
description: Técnicas avanzadas para extender la capacidad efectiva del contexto mediante compactación, enmascaramiento, optimización de caché KV y particionamiento.
---

# 🚀 Context Optimization Techniques

Esta habilidad permite maximizar la utilidad de la ventana de contexto mediante estrategias de compresión, enmascaramiento y particionamiento. El objetivo es duplicar o triplicar la capacidad efectiva sin necesidad de modelos más grandes, reduciendo latencia y costo.

> **Mental Model**: La calidad del contexto importa más que la cantidad. Optimizar es preservar la señal mientras se elimina el ruido técnico y conversacional.

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Media**. Un enmascaramiento excesivo puede ocultar dependencias críticas de razonamiento.
- **Libertad: Alta** en la implementación de disparadores (triggers) de optimización.

## 🚀 Cuándo Activar
- Cuando los límites de contexto restringen la complejidad de la tarea.
- Para reducir costos operativos (menos tokens = menor costo).
- Al notar aumentos significativos en la latencia de respuesta.
- Al implementar sistemas de agentes de larga duración o monorepos masivos.

## 🧠 Conceptos Core

### 1. Las Cuatro Palancas de Optimización
| Estrategia | Método | Impacto |
| :--- | :--- | :--- |
| **Compaction** | Resumen estructurado cerca de límites. | Reducción del 50-70%. |
| **Observation Masking** | Reemplazo de outputs verbosos por referencias. | Reducción del 60-80% en tool logs. |
| **KV-Cache Opt** | Reordenamiento para maximizar prefijos estables. | Latencia -40%, Costo -50%. |
| **Partitioning** | División de tareas en sub-agentes aislados. | Aislamiento total de ruido. |

### 2. El Problema de la Observación
Las salidas de herramientas (tool outputs) pueden representar el 80% del uso de tokens. Una vez procesadas, mantener el log completo tiene un valor decreciente y un costo creciente.

## 🛠️ Implementación en Gemini Elite Core

### Patrón: Masking con Referencia Atómica
Sustituye salidas largas por un resumen y un ID de referencia.

```markdown
[OBSERVATION MASKED: output_log_42]
Key Findings: Error 404 in /api/auth.
Full log stored in artifacts/logs/auth_error.log
```

### Patrón: Cache-Friendly Ordering
Ordena el contexto para maximizar los "cache hits" del motor Gemini.

1. **System Prompt** (Estatico - Inicio)
2. **Tool Definitions** (Estatico)
3. **Project Context** (Semi-Estatico)
4. **Current Task State** (Dinámico - Final)

### Umbrales de Disparo (Triggers)
- **70% Utilización**: Alerta de proximidad.
- **80% Utilización**: Disparo de compactación iterativa.
- **90% Utilización**: Compactación agresiva y particionamiento forzado.

---

## 🔗 Integraciones
- `context-fundamentals`: Base para la jerarquía de información.
- `multi-agent-patterns`: Particionamiento como método de aislamiento.
- `memory-systems`: Descarga de contexto a sistemas de memoria externa.

## 📚 Referencias Internas
- `references/optimization_techniques.md`: Guía técnica de presupuestos de tokens, patrones de enmascaramiento y benchmarks de rendimiento.
