# 🏛️ Degradation Patterns Reference

Referencia técnica detallada sobre patrones de degradación de contexto y atención en LLMs.

## 1. Patrones de Distribución de Atención

| Patrón | Descripción | Impacto en el Modelo |
| :--- | :--- | :--- |
| **Recency Bias** | El modelo da mayor peso a la información más reciente. | Ignora instrucciones críticas dadas al inicio. |
| **Primacy Bias** | El modelo se aferra fuertemente a la instrucción inicial. | Ignora correcciones o cambios de rumbo posteriores. |
| **Lost-in-Middle** | La información en el centro de la ventana tiene el menor recall. | Fallo en tareas que dependen de datos situados en el medio. |

## 2. Tipos de Fallos de Recuperación (Recall Failures)

### Sonda de Hechos (Fact Probe)
- **Fallo**: El modelo no recuerda un hecho específico (ej. una variable declarada hace 200 mensajes).
- **Causa**: Distracción o entropía de contexto.

### Sonda de Artefactos (Artifact Probe)
- **Fallo**: El modelo no sabe qué archivos ha modificado.
- **Causa**: Historial de herramientas (tool outputs) demasiado ruidoso.

### Sonda de Razonamiento (Reasoning Probe)
- **Fallo**: El modelo contradice su propia lógica previa.
- **Causa**: Envenenamiento de contexto (context poisoning) por errores anteriores.

## 3. Estrategias Técnicas de Mitigación

- **Observation Masking**: Ocultar salidas de herramientas largas que no son relevantes para la tarea actual.
- **Context Partitioning**: Mover bloques lógicos a archivos separados (`scratchpads`, `reference.md`).
- **Prompt Isolation**: Iniciar una nueva ventana de contexto (sub-agente) para tareas que requieren atención extrema.
- **Contextual Anchoring**: Repetir información crítica al final del prompt.

## 4. Métricas de Salud del Contexto

- **Signal-to-Noise Ratio (SNR)**: Relación entre tokens útiles y tokens de ruido/relleno.
- **Entropy Score**: Nivel de dispersión de la información a través de la ventana.
- **Attention Density**: Concentración de la atención del modelo en las áreas correctas.
