# Plan de Actualización: Elite Core v0.33 (Thinking Edition)

Este plan detalla las modificaciones necesarias para elevar el setup de Gemini Elite Core a los estándares de la versión v0.33.0-nightly, optimizando el uso de Gemini 3 y mejorando la eficiencia operativa.

## 1. Actualización de Core Settings (`settings.json`)

### A. Soporte para Thinking (Gemini 3)
Configuraremos un preset de modelo que aproveche las capacidades de razonamiento.
- **`modelConfigs`**: Definir el alias `thinking-pro` con `gemini-3.1-pro-preview`.
- **`generateContentConfig`**: Activar `includeThoughts: true` y establecer un `thinkingBudget: 16000` por defecto.
- **`ui.inlineThinkingMode`**: Establecer en `full` para visibilidad total del proceso de razonamiento.

### B. Eficiencia de Contexto y Tokens
- **`experimental.toolOutputMasking`**: Activar para evitar saturar el contexto con logs de herramientas innecesarios.
- **`tools.truncateToolOutputThreshold`**: Ajustar a `30000` para un equilibrio entre información y ahorro.
- **`experimental.jitContext`**: Activar para optimizar la carga de archivos en repositorios grandes.

### C. Flujo de Trabajo y Seguridad
- **`general.defaultApprovalMode`**: Cambiar a `plan` para forzar la revisión de estrategias antes de la ejecución.
- **`general.checkpointing.enabled`**: Activar para permitir recuperación de sesiones tras fallos o interrupciones.

## 2. Refactor de Scripts de Instalación (`setup.sh` & `setup.cmd`)

- **Modularización**: Separar el JSON de configuración en variables lógicas (MODEL_CONFIG, UI_CONFIG, TOOL_CONFIG) para facilitar el mantenimiento.
- **Detección de Versión**: Añadir un check inicial para alertar si el usuario no tiene instalada al menos la v0.30.
- **Limpieza de Hooks**: Confirmar que los hooks deshabilitados no interfieran con las nuevas capacidades nativas de v0.33.

## 3. Actualización de Documentación y Skills

- **`README.md`**: Actualizar la sección de "Protocolos" para reflejar el uso de Gemini 3.
- **`GEMINI.md` (Contexto Global)**: Actualizar el bloque `<ELITE_CORE_CONTEXT>` con las nuevas capacidades de 2026.

## Pasos de Ejecución Inmediata

1.  **Surgical Edit en `setup.sh`**: Reemplazar el bloque `OPTIMIZED_SETTINGS` con la nueva estructura v0.33.
2.  **Surgical Edit en `setup.cmd`**: Replicar los cambios para usuarios de Windows.
3.  **Validación**: Ejecutar el script localmente y verificar que el `settings.json` resultante es válido y aceptado por la CLI.
4.  **Commit**: `feat(core): upgrade configuration to v0.33 standards with Gemini 3 support`.

---
*Preparado por Gemini Elite Core - Marzo 2, 2026*
