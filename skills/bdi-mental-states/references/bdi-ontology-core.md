# 🏛️ BDI Ontology Core Concepts

Definición formal de la ontología para modelado BDI (Belief-Desire-Intention).

## Clases Principales (Classes)

- `bdi:Agent`: Una entidad (ej. Gemini CLI, Bot) capaz de realizar acciones deliberativas.
- `bdi:MentalState`: La clase base para todos los estados internos del agente.
- `bdi:Belief`: Representa información o hechos que el agente asume como verdaderos en su entorno actual.
- `bdi:Desire`: Un estado del mundo que el agente desea lograr o mantener (objetivos potenciales).
- `bdi:Intention`: Un deseo al cual el agente se ha comprometido formalmente a través de un plan de acción.

## Propiedades Clave (Properties)

- `bdi:hasBelief`: Vincula a un `bdi:Agent` con un `bdi:Belief`.
- `bdi:hasDesire`: Vincula a un `bdi:Agent` con un `bdi:Desire`.
- `bdi:hasIntention`: Vincula a un `bdi:Agent` con una `bdi:Intention`.
- `bdi:fulfils`: Indica que una `bdi:Intention` satisface un `bdi:Desire` específico.
- `bdi:isSupportedBy`: Indica que una `bdi:Intention` es lógicamente posible según un conjunto de `bdi:Belief`.

## Jerarquía de Estados Mentales

1. **Estado de Creencia (Belief Set)**: Conjunto de tripletas que describen el mundo (Cerrado por el contexto).
2. **Estado de Deseo (Desire Set)**: Lista de objetivos no necesariamente consistentes entre sí.
3. **Estado de Intención (Intention Set)**: Subconjunto de deseos lógicamente consistentes y con planes de ejecución activos.
