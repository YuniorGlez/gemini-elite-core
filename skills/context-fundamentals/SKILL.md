---
name: context-fundamentals
description: Fundamentos de la ingeniería de contexto, anatomía de la ventana de contexto, presupuestos de tokens y el principio de divulgación progresiva.
---

# 🏗️ Context Engineering Fundamentals

Esta habilidad proporciona el marco teórico y práctico para gestionar el estado de los LLMs. El contexto no es solo "memoria", es el conjunto completo de datos (instrucciones, herramientas, documentos, historial) que el modelo puede atender en el momento de la inferencia.

> **Mental Model**: La ingeniería de contexto es la disciplina de curar el conjunto más pequeño de tokens de alta señal que maximiza la probabilidad de éxito en una tarea.

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Baja**. Estos son principios fundamentales aplicables a casi cualquier sistema de IA.
- **Libertad: Media** en la aplicación táctica según la capacidad del modelo (ej. 128K vs 2M tokens).

## 🚀 Cuándo Activar
- Al diseñar nuevas arquitecturas de agentes o flujos de trabajo.
- Para depurar comportamientos inesperados relacionados con el olvido o la distracción.
- Al optimizar el uso de tokens para reducir latencia o costo.
- Al incorporar nuevos miembros al equipo en conceptos de "Context Engineering".

## 🧠 Conceptos Core

### 1. La Anatomía del Contexto
El contexto se compone de cinco bloques distintos con diferentes ciclos de vida:
| Bloque | Función | Persistencia |
| :--- | :--- | :--- |
| **System Prompts** | Identidad y Reglas | Alta (Estatico) |
| **Tool Definitions** | Capacidades (APIs) | Alta (Estatico) |
| **Retrieved Docs** | Conocimiento RAG | Media (Just-in-Time) |
| **Message History** | Estado de la Tarea | Baja (Volátil) |
| **Tool Outputs** | Observaciones | Muy Baja (Ruido alto) |

### 2. El Principio de Divulgación Progresiva (Progressive Disclosure)
No cargues todo a la vez. Carga la información solo cuando sea necesaria para el siguiente paso lógico.
- **Startup**: Carga solo nombres y descripciones de habilidades.
- **Activación**: Carga el contenido completo de la habilidad (`SKILL.md`) solo cuando se activa.

### 3. El Presupuesto de Atención (Attention Budget)
Aunque Gemini soporte 2M de tokens, el "presupuesto de atención" efectiva es menor. La densidad de la señal cae en el medio del contexto (**Lost-in-Middle**).

## 🛠️ Implementación en Gemini Elite Core

### Patrón: Estructura de Prompt Jerárquica
Utiliza encabezados claros y delimitadores XML para separar preocupaciones.

```markdown
<BACKGROUND> Contexto del proyecto y preferencias. </BACKGROUND>
<INSTRUCTIONS> Reglas atómicas y guías de comportamiento. </INSTRUCTIONS>
<TOOL_GUIDANCE> Cuándo usar qué herramienta. </TOOL_GUIDANCE>
<OUTPUT_SCHEMA> Formato de respuesta esperado. </OUTPUT_SCHEMA>
```

### Patrón: Altitude Calibration (Calibración de Altitud)
- **Baja (Frágil)**: "Si pasa X, haz Y, luego Z". (Demasiado rígido).
- **Alta (Vaga)**: "Ayuda al usuario a programar". (Demasiado ambiguo).
- **Óptima (Heurística)**: "Prioriza la legibilidad sobre la brevedad; usa tipos estrictos; verifica tests antes de proponer cambios".

---

## 🔗 Integraciones
- `context-degradation`: Qué pasa cuando fallan estos fundamentos.
- `context-optimization`: Técnicas para estirar el presupuesto de atención.
- `tool-design`: Cómo las herramientas consumen y generan contexto.

## 📚 Referencias Internas
- `references/context-components.md`: Referencia técnica detallada de cada componente del contexto.
