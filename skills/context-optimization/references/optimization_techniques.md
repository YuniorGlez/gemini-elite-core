# 🏛️ Optimization Techniques Reference

Referencia técnica detallada sobre técnicas de optimización de contexto en Gemini Elite Core.

## 1. Patrones de Enmascaramiento (Observation Masking)

Sustituye salidas de herramientas verbosas por un resumen y un ID de referencia.

- **Ventaja**: Reduce tokens de historial en un 60-80%.
- **Uso**: Úsalo cuando el resultado de una herramienta (ej. un `ls -R` masivo) ya ha sido interpretado por el modelo y no se necesita el log crudo.

```markdown
[OBSERVATION MASKED: ls_recursive_root]
Resumen: Encontrados 152 archivos en 12 directorios.
Archivos de interés: index.ts, main.css, README.md.
```

## 2. Optimización de Caché KV (KV-Cache Optimization)

Reordena el contexto para maximizar los "cache hits" del motor de inferencia.

- **Orden Estándar**:
  1. **System Prompt** (Muy estático).
  2. **Tool Definitions** (Estático).
  3. **Knowledge Base / Project Specs** (Semi-estático).
  4. **Chat History** (Dinámico).
  5. **Current Request** (Muy dinámico).

- **Beneficio**: Reduce la latencia de "Time to First Token" (TTFT) y el costo de procesamiento por petición.

## 3. Particionamiento de Contexto (Context Partitioning)

Divide una tarea compleja en sub-tareas ejecutadas por sub-agentes independientes.

- **Efecto**: Cada sub-agente tiene su propia ventana de contexto de 128K o 1M tokens, aislada del ruido de las otras sub-tareas.
- **Cuándo usar**: Para migraciones masivas, refactorizaciones de todo el proyecto o tareas de investigación profunda.

## 4. Gestión de Presupuesto de Tokens (Budgeting)

| Estado | Token Count | Acción Recomendada |
| :--- | :--- | :--- |
| **Saludable** | < 100K | Sin acción. |
| **Alerta** | 100K - 150K | Enmascaramiento de observaciones previas. |
| **Crítico** | > 150K | Compactación iterativa y resumen del historial. |

## 5. Benchmarks de Rendimiento

- **Sin Optimización**: 100% tokens, 100% latencia, 100% costo.
- **Con Masking**: ~40% tokens, ~60% latencia, ~40% costo.
- **Con Compaction**: ~25% tokens, ~50% latencia, ~25% costo.
- **Con Partitioning**: Variable, pero aislamiento total de ruido.
