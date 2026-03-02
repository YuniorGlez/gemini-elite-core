---
name: multi-agent-patterns
description: Arquitecturas de sistemas multi-agente, patrones de orquestación, swarms, handoffs y protocolos de consenso para superar límites de contexto único.
---

# 🐝 Multi-Agent Architecture Patterns

Esta habilidad permite diseñar y coordinar sistemas compuestos por múltiples instancias de modelos de lenguaje (agentes), cada uno con su propia ventana de contexto. La arquitectura multi-agente es la solución definitiva para tareas cuya complejidad excede la capacidad de razonamiento de un solo contexto saturado.

> **Mental Model**: Los sub-agentes no son solo roles ("investigador", "escritor"); son unidades de aislamiento de contexto. Su propósito principal es particionar el conocimiento para mantener una alta densidad de señal en cada paso del proceso.

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Alta**. La coordinación mal diseñada introduce latencia masiva y pérdida de información (efecto "teléfono descompuesto").
- **Libertad: Muy Alta** en la elección del patrón de orquestación según la naturaleza de la tarea.

## 🚀 Cuándo Activar
- Cuando una tarea requiere manejar múltiples dominios técnicos simultáneamente.
- Para paralelizar sub-tareas independientes (ej. investigar 5 librerías a la vez).
- Al notar que el agente principal se distrae o "alucina" debido al ruido del contexto acumulado.
- Para implementar procesos de revisión y crítica adversarial (Debate Pattern).

## 🧠 Patrones de Arquitectura

### 1. Supervisor / Orchestrator
Un agente central controla el flujo, descompone la tarea y delega a especialistas.
- **Uso**: Tareas con pasos secuenciales claros y necesidad de supervisión humana.
- **Riesgo**: El supervisor se convierte en un cuello de botella de contexto.

### 2. Peer-to-Peer / Swarm
Los agentes se pasan el control directamente entre sí mediante protocolos de "handoff".
- **Uso**: Exploración flexible, soporte al cliente, flujos de trabajo dinámicos.
- **Ventaja**: Elimina el sesgo de paráfrasis del supervisor.

### 3. Hierarchical (Jerárquico)
Estructura de capas: Estratégica -> Planificación -> Ejecución.
- **Uso**: Proyectos masivos, migraciones de código a gran escala, gestión de monorepos.

## 🛠️ Implementación en Gemini Elite Core

### Patrón: The Direct Pass-Through (Fixing the Telephone Game)
Evita que el supervisor resuma la salida del trabajador. Usa una herramienta `forward_to_user` para que el especialista hable directamente.

```markdown
<TOOL_CALL: forward_to_user>
{
  "message": "[Contenido técnico crudo y preciso generado por el especialista]",
  "reason": "Evitar pérdida de fidelidad en la síntesis del supervisor."
}
</TOOL_CALL>
```

### Patrón: Parallel Research Swarm
Dispara N agentes en paralelo y consolida sus hallazgos en un archivo de "findings".

1. **Planner**: Crea N tareas de investigación.
2. **Workers**: Ejecutan en paralelo sobre sandboxes aislados.
3. **Consolidator**: Lee todos los resultados y genera el informe final.

---

## 🔗 Integraciones
- `context-optimization`: El particionamiento multi-agente es la forma más pura de optimización.
- `memory-systems`: Uso de memorias compartidas (Durable Objects, Disk) para la coordinación.
- `evaluation`: Validación de la calidad de la síntesis entre agentes.

## 📚 Referencias Internas
- `references/frameworks.md`: Detalles técnicos de implementación para LangGraph, AutoGen y CrewAI. Patrones de consenso y recuperación de fallos.
