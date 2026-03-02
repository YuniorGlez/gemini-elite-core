---
name: context-degradation
description: Diagnóstico y mitigación de problemas de contexto, incluyendo "Lost-in-Middle", envenenamiento de contexto y degradación de atención en sesiones largas.
---

# 📉 Context Degradation Patterns

Esta habilidad permite diagnosticar y mitigar los fallos predecibles en el rendimiento de los LLMs a medida que aumenta la longitud del contexto. La degradación no es un estado binario, sino un continuo que afecta la atención y la precisión del modelo.

> **Mental Model**: El contexto no es un espejo perfecto; es un cubo con fugas. La degradación ocurre cuando el ruido sobrepasa la señal o cuando la atención del modelo se estira demasiado.

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Media**. Identificar el punto exacto de degradación requiere pruebas empíricas.
- **Libertad: Alta** en la implementación de estrategias de recuperación (Truncado vs. Resumen).

## 🚀 Cuándo Activar
- Cuando el rendimiento del agente disminuye inesperadamente en conversaciones largas.
- Al depurar salidas incorrectas o irrelevantes ("Lost-in-Middle").
- Al diseñar sistemas que deben manejar contextos masivos (1M+ tokens).
- Para evaluar decisiones de arquitectura de ingeniería de contexto.

## 🧠 Conceptos Core

### 1. El Fenómeno "Lost-in-Middle"
Los modelos muestran curvas de atención en forma de U. La información al inicio y al final se recuerda con precisión, mientras que la información enterrada en el medio sufre una caída de recall del 10-40%.

### 2. Tipos de Degradación
| Patrón | Causa | Síntoma |
| :--- | :--- | :--- |
| **Context Poisoning** | Errores o alucinaciones previas. | Bucles de retroalimentación de creencias falsas. |
| **Context Distraction** | Exceso de información irrelevante. | El modelo ignora su entrenamiento base. |
| **Context Confusion** | Multiplicidad de tareas en una ventana. | Mezcla de requisitos de diferentes fuentes. |
| **Context Clash** | Información contradictoria. | Descarrilamiento del razonamiento lógico. |

### 3. Umbrales por Modelo (Referencia)
| Modelo | Inicio Degradación | Degradación Severa |
| :--- | :--- | :--- |
| **Gemini 3 Pro** | ~500K tokens | ~800K tokens |
| **Gemini 3 Flash** | ~300K tokens | ~600K tokens |
| **GPT-5.2** | ~64K tokens | ~200K tokens |

## 🛠️ Implementación en Gemini Elite Core

### El Enfoque de las "Cuatro Cubetas" (Four-Bucket)
1. **Write**: Guarda contexto fuera de la ventana (archivos, scratchpads).
2. **Select**: Recuperación selectiva (RAG, filtrado) para excluir ruido.
3. **Compress**: Resumen y enmascaramiento de observaciones (Observation Masking).
4. **Isolate**: Divide tareas entre sub-agentes con ventanas de contexto limpias.

### Patrón: Mitigación Lost-in-Middle
Mueve la información crítica a los bordes del contexto.

```markdown
[INFORMACIÓN CRÍTICA / TAREA ACTUAL] # Inicio (Alta Atención)
...
[DATOS DE APOYO / HISTORIAL LARGO]    # Medio (Baja Atención)
...
[REGLAS FINALES / FORMATO DE SALIDA]  # Final (Alta Atención)
```

---

## 🔗 Integraciones
- `context-fundamentals`: Base para entender la jerarquía.
- `context-optimization`: Técnicas específicas de mitigación.
- `evaluation`: Medición de la salud del contexto mediante sondas (probes).

## 📚 Referencias Internas
- `references/patterns.md`: Referencia técnica sobre distribución de atención y recuperación.
