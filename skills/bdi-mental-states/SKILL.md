---
name: bdi-mental-states
description: Modelado cognitivo de agentes basado en Creencias (Beliefs), Deseos (Desires) e Intenciones (Intentions) usando ontologías RDF/Turtle.
---

# 🧠 BDI Mental States (Cognitive Modeling)

Esta habilidad permite modelar el estado interno de agentes autónomos utilizando el framework BDI (Belief-Desire-Intention). Utiliza representaciones formales (RDF/Turtle) para asegurar que el agente actúe con coherencia lógica y propósito.

> **Mental Model**: El agente no es reactivo, es deliberativo. Sus acciones (Intenciones) deben estar justificadas por sus objetivos (Deseos) y su percepción del mundo (Creencias).

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Alta**. Las inconsistencias entre creencias y deseos pueden llevar a parálisis lógica o bucles infinitos.
- **Libertad: Media** en la definición de estados mentales, pero **Baja** en la estructura de la ontología base.

## 🚀 Cuándo Activar
- Al diseñar agentes que requieren razonamiento complejo a largo plazo.
- Para formalizar la toma de decisiones en sistemas multi-agente.
- Al depurar comportamientos de agentes que parecen "perder el hilo" de su misión.
- Para implementar una capa de "Conciencia de Contexto" robusta.

## 🧠 Conceptos Core (BDI)

### 1. Beliefs (Creencias)
Representan lo que el agente "sabe" o "percibe" sobre el mundo.
- **Formato**: Tripletas RDF que describen hechos (ej. `agent_a believes sky_is_blue`).
- **Dinámica**: Se actualizan mediante la percepción.

### 2. Desires (Deseos)
Representan los estados finales que el agente "querría" alcanzar.
- **Formato**: Objetivos potenciales (ej. `agent_a desires target_location_reached`).
- **Dinámica**: Motivados por creencias.

### 3. Intentions (Intenciones)
Representan los deseos a los que el agente se ha "comprometido".
- **Formato**: Planes ejecutables o compromisos de acción.
- **Dinámica**: Una intención persiste hasta que se cumple o se vuelve imposible (basado en creencias).

## 🛠️ Implementación en Gemini Elite Core

### Patrón: Representación Turtle
Gemini 3 es excelente generando Turtle RDF. Úsalo para mantener un estado mental rígido.

```turtle
@prefix bdi: <https://w3id.org/fossr/ontology/bdi/> .
@prefix ex: <http://example.org/> .

ex:AgentG1 a bdi:Agent ;
    bdi:hasBelief ex:ServerIsDown ;
    bdi:hasDesire ex:ServerIsUp ;
    bdi:hasIntention ex:RebootServer .

ex:RebootServer bdi:fulfils ex:ServerIsUp ;
    bdi:isSupportedBy ex:ServerIsDown .
```

### Flujo de Deliberación
1. **Percepción**: Actualiza el grafo de Creencias.
2. **Generación de Deseos**: Identifica discrepancias entre Creencias y el Ideal.
3. **Compromiso**: Selecciona el Deseo más prioritario y conviértelo en Intención.
4. **Planificación**: Genera los pasos técnicos para cumplir la Intención.

---

## 🔗 Integraciones
- `context-fundamentals`: Base para las descripciones de estados mentales.
- `multi-agent-patterns`: Coordinación de intenciones entre varios agentes.
- `project-development`: Aplicación de BDI a ciclos de vida de software.

## 📚 Referencias Internas
- `references/bdi-ontology-core.md`: Definición formal de clases y propiedades.
- `references/rdf-examples.md`: Librería de ejemplos en Turtle para diversos escenarios.
- `references/sparql-competency.md`: Consultas para verificar la integridad mental.
- `references/framework-integration.md`: Conexión con JADE/Python/LAG.
