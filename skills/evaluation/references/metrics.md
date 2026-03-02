# 📊 Metrics Reference

Referencia detallada de métricas para sistemas de agentes en Gemini Elite Core.

## 1. Métricas de Resultado (Outcome-Focused)

| Métrica | Definición | Uso Recomendado |
| :--- | :--- | :--- |
| **Pass Rate** | Porcentaje de tests que cumplen con los criterios de éxito. | Métrica de salud general. |
| **Partial Pass** | Tests que cumplen solo una parte de los objetivos. | Para tareas complejas. |
| **Accuracy Score** | Grado de precisión (1-5) según una rúbrica. | Medición de calidad subjetiva. |

## 2. Métricas de Eficiencia (Process-Focused)

| Métrica | Definición | Objetivo |
| :--- | :--- | :--- |
| **Token Usage** | Cantidad total de tokens consumidos en la tarea. | Reducir costo y latencia. |
| **Tool Calls** | Número de llamadas a herramientas realizadas. | Minimizar pasos innecesarios. |
| **Tokens-Per-Task** | Eficiencia total de tokens para completar el objetivo. | Maximizar la señal-ruido. |

## 3. Métricas de Robustez (Reliability-Focused)

- **Consistency Score**: Varianza entre múltiples ejecuciones de la misma tarea.
- **Context Awareness**: Capacidad para recordar hechos a diferentes profundidades (Needle-in-a-Haystack).
- **Instruction Persistence**: Seguimiento de restricciones negativas (ej. "No uses emojis").

## 4. Implementación de Rúbricas (Ejemplo JSON)

```json
{
  "rubricName": "Factual_Quality_v1",
  "dimensions": [
    {
      "name": "Accuracy",
      "weight": 0.5,
      "levels": {
        "1": "Información incorrecta o inventada.",
        "3": "Mayormente correcto con omisiones menores.",
        "5": "Perfectamente preciso y respaldado por evidencia."
      }
    },
    {
      "name": "Format",
      "weight": 0.5,
      "levels": {
        "1": "No sigue el esquema JSON.",
        "5": "Esquema JSON válido y tipos correctos."
      }
    }
  ]
}
```

## 5. Estrategias de Validación

- **Unit Tests**: Pruebas atómicas de una sola herramienta o prompt.
- **Integration Tests**: Pruebas de flujo de trabajo multi-paso.
- **End-to-End (E2E)**: Simulación de una sesión de usuario completa desde el inicio hasta la resolución.
