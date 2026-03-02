---
name: advanced-evaluation
description: Implementación de "LLM-as-a-Judge", comparación de outputs, creación de rúbricas de evaluación y mitigación de sesgos en sistemas de IA.
---

# ⚖️ Advanced Evaluation (LLM-as-a-Judge)

Esta habilidad permite implementar sistemas de evaluación de grado de producción utilizando LLMs como jueces. Cubre desde la taxonomía de evaluación hasta la mitigación de sesgos sistemáticos (posición, longitud, auto-mejora).

> **Mental Model**: La evaluación no es un evento, es un pipeline. El "LLM-as-a-Judge" no es una técnica única, sino un framework de decisiones basado en la naturaleza del dato (objetivo vs. subjetivo).

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Media**. La definición de rúbricas requiere alineación con los objetivos del negocio/proyecto.
- **Libertad: Alta** en la implementación técnica de los pipelines de validación.

## 🚀 Cuándo Activar
- Al construir pipelines de evaluación automática para outputs de LLM.
- Para comparar respuestas de múltiples modelos (A/B testing de prompts).
- Al establecer estándares de calidad consistentes en equipos de desarrollo.
- Para depurar sistemas de evaluación con resultados inconsistentes.

## 🧠 Conceptos Core

### 1. Taxonomía de Evaluación
| Enfoque | Mejor para... | Fiabilidad | Fallo Común |
| :--- | :--- | :--- | :--- |
| **Direct Scoring** | Criterios Objetivos (Factualidad, Formato) | Alta | Deriva de escala (calibration drift) |
| **Pairwise Comparison** | Criterios Subjetivos (Tono, Estilo, Creatividad) | Muy Alta | Sesgo de posición (Position Bias) |

### 2. El Paisaje de Sesgos (Mitigación)
- **Position Bias**: Tendencia a preferir la primera respuesta.
  - *Mitigación*: Evaluar dos veces intercambiando posiciones (Swap) y verificar consistencia.
- **Length Bias**: Preferencia por respuestas largas.
  - *Mitigación*: Instrucciones explícitas de ignorar longitud y penalizar verborrea irrelevante.
- **Self-Enhancement**: Modelos que puntúan mejor sus propios outputs.
  - *Mitigación*: Usar modelos diferentes para generación y evaluación.

## 🛠️ Implementación en Gemini Elite Core

### Patrón: Direct Scoring (Gemini 3 + Thinking)
Utiliza `thinking-pro` para razonar sobre la evidencia antes de emitir el score.

```markdown
## Task
Evalúa la calidad de la respuesta según los criterios.

## Criterios
- Precisión Factual (Peso: 1.0)
- Concisión (Peso: 0.5)

## Instrucciones
1. Busca evidencia específica en la respuesta.
2. Razona sobre cómo la evidencia cumple o no el criterio.
3. Asigna un score (1-5).
4. Sugiere una mejora atómica.

## Formato de Salida (JSON)
{ "score": number, "reasoning": string, "improvement": string }
```

### Patrón: Pairwise con Swap
Es obligatorio realizar el "Swap Test" para asegurar la integridad de la evaluación.

1. **Pass 1**: Modelo evalúa [Respuesta A, Respuesta B].
2. **Pass 2**: Modelo evalúa [Respuesta B, Respuesta A].
3. **Consistencia**: Si el ganador cambia, se marca como EMPATE con confianza baja.

## 📏 Generación de Rúbricas
Una rúbrica bien definida reduce la varianza en un 40-60%.
- **Nivel 1 (Pobre)**: Sin evidencia, logicamente inconsistente.
- **Nivel 3 (Adecuado)**: Cumple la instrucción, tono correcto, logicamente pasable.
- **Nivel 5 (Excelente)**: Supera expectativas, insights profundos, formato perfecto.

---

## 🔗 Integraciones
- `context-fundamentals`: Estructura de prompts de evaluación.
- `tool-design`: Creación de herramientas de validación programática.
- `debug-master`: Identificación de fallos sistémicos en la lógica del modelo.

## 📚 Referencias Internas
- `references/bias-mitigation.md`: Técnicas avanzadas de Swap y PoLL (Panel of LLMs).
- `references/implementation-patterns.md`: Patrones técnicos de "Reasoning-First" y "Swap Test".
- `references/metrics-guide.md`: Selección de métricas (Factualidad, Tono, Formato).
