---
name: evaluation
description: Métodos y frameworks para evaluar el rendimiento de agentes, creación de rúbricas multidimensionales y validación de estrategias de ingeniería de contexto.
---

# 📊 Evaluation Methods for Agent Systems

Esta habilidad permite evaluar sistemáticamente el rendimiento de agentes autónomos. A diferencia del software tradicional, los agentes son no-deterministas y pueden alcanzar un objetivo por múltiples caminos válidos. La evaluación debe centrarse en los resultados (**Outcomes**) y la eficiencia del proceso.

> **Mental Model**: La evaluación no es binaria (pasa/falla); es una medición multidimensional de la probabilidad de éxito y la calidad del razonamiento.

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Baja**. Estos principios son robustos y fundamentales.
- **Libertad: Alta** en el diseño de rúbricas específicas para cada proyecto.

## 🚀 Cuándo Activar
- Al construir frameworks de tests para agentes.
- Para validar si un cambio en la ingeniería de contexto mejora o empeora el rendimiento.
- Al comparar diferentes modelos (ej. Flash vs Pro) para una tarea específica.
- Para establecer "Quality Gates" en pipelines de producción.

## 🧠 Conceptos Core

### 1. Los Tres Pilares del Rendimiento (95% de Varianza)
Estudios demuestran que tres factores explican casi todo el rendimiento de un agente:
1. **Presupuesto de Tokens (80%)**: Más tokens (dentro del límite de señal) suelen permitir una exploración más profunda.
2. **Llamadas a Herramientas (10%)**: La capacidad de interactuar y observar el entorno es crítica.
3. **Elección del Modelo (5%)**: Modelos superiores (ej. Gemini 3 Ultra) multiplican la eficiencia de los otros dos factores.

### 2. Desafíos de Evaluación
- **No-Determinismo**: Dos ejecuciones idénticas pueden producir caminos diferentes pero igualmente válidos.
- **Fallos dependientes del contexto**: Un agente puede fallar solo cuando el contexto es muy largo o ruidoso.
- **Dimensiones Compuestas**: La calidad incluye precisión factual, tono, brevedad y eficiencia de herramientas.

## 🛠️ Implementación en Gemini Elite Core

### Patrón: Rúbrica Multidimensional
Define criterios con pesos específicos según la importancia para el proyecto.

| Dimensión | Peso | Descripción |
| :--- | :--- | :--- |
| **Precisión Factual** | 0.35 | Los hechos coinciden con la fuente de verdad. |
| **Completitud** | 0.25 | Cubre todos los aspectos solicitados. |
| **Eficiencia** | 0.20 | Usa el número mínimo de herramientas necesarias. |
| **Formato** | 0.20 | Sigue el esquema JSON/Markdown esperado. |

### Patrón: Estratificación de Complejidad
Divide tu set de tests en niveles:
- **Simple**: Una sola llamada a herramienta, búsqueda factual.
- **Medio**: Múltiples herramientas, lógica de comparación.
- **Complejo**: Razonamiento multi-paso, ambigüedad significativa.
- **Estratégico**: Interacción extendida, síntesis profunda de datos.

---

## 🔗 Integraciones
- `context-fundamentals`: Evaluación de cómo el modelo usa el contexto proporcionado.
- `context-degradation`: Detección de caídas de rendimiento en contextos largos.
- `advanced-evaluation`: Implementación técnica de "LLM-as-a-Judge".

## 📚 Referencias Internas
- `references/metrics.md`: Definiciones detalladas de métricas, implementación de rúbricas y runners de evaluación.
