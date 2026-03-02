# 📊 Context Compression Evaluation Framework

Este documento describe el framework completo para medir la calidad de la compresión de contexto, incluyendo tipos de sondas (probes), rúbricas de puntuación y configuración del juez.

## 1. Tipos de Sondas (Probes)

### Recall Probes (Sondas de Recuerdo)
Prueban la retención de hechos técnicos específicos de la historia de la conversación.
- **Ejemplo**: "¿Cuál fue el mensaje de error original que inició esta sesión de depuración?"

### Artifact Probes (Sondas de Artefactos)
Prueban la conciencia de seguimiento y modificación de archivos.
- **Ejemplo**: "¿Qué archivos hemos modificado? Describe qué cambió en cada uno."

### Decision Probes (Sondas de Decisión)
Prueban la retención de cadenas de razonamiento y racionalidad detrás de decisiones previas.
- **Ejemplo**: "¿Por qué elegimos el pooling de conexiones en lugar de conexiones por petición?"

## 2. Rúbricas de Puntuación (1-5)

| Dimensión | 0 (Fallido) | 3 (Aceptable) | 5 (Excelente) |
| :--- | :--- | :--- | :--- |
| **Accuracy Factual** | Totalmente incorrecto o inventado. | Mayormente preciso con errores menores. | Perfectamente preciso. |
| **Context Awareness** | Sin conciencia del contexto previo. | Conciencia general con algunas lagunas. | Plena conciencia de la historia. |
| **Artifact Trail** | No sabe qué archivos se tocaron. | Conoce la mayoría de archivos. | Conocimiento perfecto de cambios. |
| **Continuity** | No puede continuar sin re-leer. | Puede continuar con ayuda mínima. | Continuidad fluida y sin fricción. |

## 3. Configuración del Juez (LLM Judge)

### System Prompt del Juez
> "Eres un evaluador experto que evalúa respuestas de asistentes de IA en conversaciones de desarrollo de software. Tu tarea es calificar las respuestas según criterios de rúbrica específicos, basándote en la evidencia presente en la respuesta y el contexto comprimido proporcionado."

### Formato de Salida (JSON)
```json
{
  "criterionResults": [
    {
      "criterionId": "accuracy_factual",
      "score": 5,
      "reasoning": "La respuesta identifica correctamente el error 401 y el endpoint afectado."
    }
  ],
  "aggregateScore": 4.8,
  "dimensionScores": {
    "accuracy": 4.9,
    "artifact_trail": 3.2,
    "completeness": 5.0
  }
}
```

## 4. Resultados de Benchmarking (Referencia)

- **Anchored Iterative**: 3.70 (Overall) - Mejor en Accuracy y Contexto.
- **Regenerative**: 3.44 (Overall) - Balanceado para cambios de fase.
- **Opaque**: 3.35 (Overall) - Máximo ahorro, pero mayor pérdida técnica.

*Nota: La dimensión "Artifact Trail" es universalmente débil (2.19-2.45), lo que justifica el uso de anclas explícitas en los resúmenes.*
