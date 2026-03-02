---
name: project-development
description: Metodología para el desarrollo de proyectos basados en agentes, desde la ideación y validación de "Task-Model Fit" hasta la arquitectura de pipelines de producción.
---

# 🚀 Agentic Project Development

Esta habilidad proporciona una metodología estructurada para construir aplicaciones y sistemas impulsados por agentes de IA. A diferencia del desarrollo tradicional, los proyectos de agentes requieren un enfoque centrado en la gestión de la incertidumbre, la validación de capacidades del modelo y la construcción de pipelines robustos e idempotentes.

> **Mental Model**: No automatices por intuición; automatiza por evidencia. El éxito de un proyecto de agente depende de encontrar el "Task-Model Fit" y construir una infraestructura que permita iterar sobre los prompts y datos sin romper el flujo de ejecución.

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Alta**. La deriva de rendimiento del modelo y la ambigüedad de los datos de entrada pueden invalidar una arquitectura en días.
- **Libertad: Media** en la elección de herramientas, pero **Baja** en la disciplina de validación y estructuración de pipelines.

## 🚀 Cuándo Activar
- Al iniciar un nuevo proyecto que involucre agentes autónomos o flujos de trabajo de LLM.
- Para evaluar si una tarea es apta para ser automatizada con la tecnología actual.
- Al diseñar la arquitectura de un sistema de procesamiento por lotes (batch processing) o análisis de datos masivos.
- Para rescatar proyectos de agentes que han fallado debido a falta de estructura o costes excesivos.

## 🧠 Ciclo de Vida del Proyecto Agentic

### 1. Discovery & Task-Model Fit
¿Es la tarea apta para el modelo actual?
- **Manual Prototyping**: Realiza la tarea manualmente en el chat. ¿Puede el modelo hacerlo consistentemente?
- **Complexity Assessment**: ¿Requiere razonamiento multi-paso, acceso a herramientas o solo síntesis?
- **Boundary Definition**: Define qué NO hará el agente para evitar "scope creep" y fallos catastróficos.

### 2. Pipeline Architecture (The Canonical Flow)
Divide la tarea en etapas deterministas siempre que sea posible:
1. **Acquire**: Obtención de datos crudos (Web, DB, Files).
2. **Prepare**: Limpieza y formateo para el contexto del LLM.
3. **Process**: La única etapa que involucra llamadas al LLM (Gemini 3).
4. **Parse**: Extracción de datos estructurados de la respuesta.
5. **Render**: Generación del output final (UI, Reporte, Código).

### 3. Filesystem as State Machine
Usa el sistema de archivos para mantener el estado de la tarea. Cada etapa debe leer de una carpeta y escribir en otra, permitiendo reinicios y depuración atómica.

## 🛠️ Implementación en Gemini Elite Core

### Patrón: Architectural Reduction
A medida que los modelos (ej. Gemini 3 Ultra) se vuelven más capaces, simplifica la arquitectura.
- *Antes*: Necesitabas 5 agentes y un supervisor para un resumen técnico.
- *Ahora*: Un solo prompt con un buen "Context Engineering" puede lograr lo mismo con menor latencia y coste.

### Patrón: Idempotencia y Caching
Asegura que re-ejecutar el pipeline no desperdicie tokens si los inputs no han cambiado.

```bash
# Ejemplo de flujo de trabajo idempotente
bun run pipeline.ts --stage process --batch-id 2026-03-02
```

---

## 🔗 Integraciones
- `evaluation`: Validación de cada etapa del pipeline.
- `filesystem-context`: Implementación del almacenamiento de estado.
- `context-optimization`: Maximización de la señal en la etapa de 'Process'.

## 📚 Referencias Internas
- `references/case-studies.md`: Análisis de proyectos reales (Análisis de mercado, Refactorización masiva).
- `references/pipeline-patterns.md`: Patrones técnicos de parsing, manejo de errores y estimación de costes.
