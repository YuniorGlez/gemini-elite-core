# 🏗️ Tool Design Best Practices Reference

Referencia técnica de convenciones y estándares para el diseño de herramientas en Gemini Elite Core.

## 1. Convenciones de Naming (Nombramiento)

- **Acción-Entidad**: `read_file`, `create_user`, `search_logs`.
- **Atomicidad**: Evita nombres vagos como `process_data`. Prefiere `validate_json` o `transform_csv_to_json`.
- **Consistencia**: Usa `snake_case` para nombres de herramientas y parámetros.

## 2. Definición de Parámetros (Typed Arguments)

- **Tipos Estrictos**: Usa `enum`, `number`, `boolean` y `array` siempre que sea posible para evitar alucinaciones.
- **Descripciones Claras**: Cada parámetro debe tener una descripción de máximo 2 líneas explicando su propósito y formato esperado.
- **Valores por Defecto**: Indica explícitamente qué sucede si se omite un parámetro opcional.

## 3. Optimización de la Observación (Observation Design)

La salida de la herramienta es el próximo prompt del modelo.

- **Estructura**: Usa JSON o Markdown estructurado.
- **Resúmenes**: Para colecciones largas, devuelve un resumen (ej. "Mostrando 5 de 150 items") y ofrece paginación.
- **Headers de Señal**: Incluye metadatos útiles como `execution_time_ms`, `source` y `tokens_consumed`.

## 4. El Ciclo de Auto-Optimización (Tool Feedback Loop)

1. **Monitoriza**: Identifica herramientas que el modelo llama con argumentos incorrectos > 20% de las veces.
2. **Refactoriza**: Mejora la descripción del parámetro o divide la herramienta si es ambigua.
3. **Valida**: Ejecuta un benchmark de "Tool-Call Fidelity" para confirmar la mejora.

## 5. Ejemplos de Antes y Después

| Pobre (Ambiguo) | Excelente (Determinista) |
| :--- | :--- |
| `edit_code(file, changes)` | `replace_lines(path, start_line, end_line, new_content)` |
| `search(query)` | `grep_search(pattern, dir_path, include_pattern)` |
| `get_info(id)` | `get_user_metadata(user_id, fields=["email", "role"])` |

## 📏 Métricas de Calidad de Herramientas

| Métrica | Objetivo |
| :--- | :--- |
| **Call Fidelity** | > 98% de llamadas con argumentos válidos. |
| **Observation SNR** | % de tokens de salida que el modelo realmente usa. |
| **Discovery Rate** | Tiempo que tarda el modelo en encontrar la herramienta correcta. |
| **Reasoning Gap** | Número de herramientas llamadas para completar una sola idea lógica. |
