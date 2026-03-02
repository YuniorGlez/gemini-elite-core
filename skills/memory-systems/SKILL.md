---
name: memory-systems
description: Arquitectura de memoria por capas (Working, Episodic, Semantic, Procedural) para agentes, persistencia a largo plazo y estrategias de recuperación híbrida.
---

# 🧠 Memory Systems Architecture

Esta habilidad permite implementar una arquitectura de memoria robusta para agentes autónomos. El objetivo es superar la limitación de la "ventana de contexto volátil" mediante un sistema de capas que organiza la información por su utilidad, relevancia temporal y tipo de conocimiento.

> **Mental Model**: La memoria no es un almacén estático; es un sistema dinámico de recuperación. El agente debe decidir qué "recordar" activamente basándose en la tarea actual, descargando el resto a capas de menor prioridad.

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Media**. Una recuperación de memoria ruidosa puede descarrilar al agente (Context Poisoning).
- **Libertad: Alta** en la elección de backends (Vector DB, Graph, Local JSON).

## 🚀 Cuándo Activar
- Al construir agentes que operan en múltiples sesiones (cross-session continuity).
- Para sistemas que requieren personalización profunda basada en preferencias del usuario.
- Al gestionar bases de conocimiento técnicas masivas que no caben (o no deberían caber) en un solo prompt.
- Para implementar "memoria de trabajo" que sobreviva a compactaciones de contexto.

## 🧠 Conceptos Core: Las Capas de Memoria

### 1. Working Memory (Memoria de Trabajo)
- **Ubicación**: Ventana de contexto activa (Prompt + Historial reciente).
- **Función**: Estado inmediato de la tarea, variables locales, plan actual.
- **Capacidad**: Alta señal, baja latencia, volátil.

### 2. Episodic Memory (Memoria Episódica)
- **Ubicación**: Logs de sesiones previas, bases de datos vectoriales.
- **Función**: "¿Qué hicimos la última vez?", "Cómo resolvimos el error X".
- **Estructura**: Secuencial y temporal.

### 3. Semantic Memory (Memoria Semántica)
- **Ubicación**: RAG, documentación, Knowledge Graphs.
- **Función**: Hechos, reglas de negocio, esquemas de DB, estándares de código.
- **Estructura**: Grafo de conceptos y entidades.

### 4. Procedural Memory (Memoria Procedural)
- **Ubicación**: Habilidades (`SKILL.md`), scripts, plantillas.
- **Función**: "¿Cómo se hace X?", "Pasos para un despliegue exitoso".

## 🛠️ Implementación en Gemini Elite Core

### Patrón: Recuperación Híbrida (Vector + Entity)
No confíes solo en similitud semántica. Usa extracción de entidades para filtrar el ruido.

1. **Extracción**: Identifica entidades en la tarea (ej. `Auth.js`, `Supabase`).
2. **Filtrado**: Recupera solo memorias que contengan esas etiquetas.
3. **Ranking**: Ordena por relevancia semántica y recencia temporal.

### Patrón: Memory Consolidation
Dispara un proceso de "sueño/resumen" después de cada tarea importante para mover descubrimientos de la Memoria de Trabajo a la Episódica.

```markdown
<TASK_COMPLETE>
- Descubrimiento: El endpoint /v2/auth requiere el header 'X-Agent-ID'.
- Acción: Persistir en preferences.yaml y vector_store.
</TASK_COMPLETE>
```

---

## 🔗 Integraciones
- `context-fundamentals`: El contexto es el destino final de la memoria recuperada.
- `filesystem-context`: Uso del disco para la persistencia de las capas 2, 3 y 4.
- `bdi-mental-states`: Uso de memoria episódica para actualizar creencias.

## 📚 Referencias Internas
- `references/implementation.md`: Guía técnica de integración con Mem0, Cognee y Graphiti. Implementación de almacenes vectoriales básicos.
