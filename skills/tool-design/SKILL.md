---
name: tool-design
description: Principios de diseño de herramientas para agentes, consolidación de interfaces, reducción arquitectónica y optimización de mensajes de error y formatos de respuesta.
---

# 🛠️ Tool Design for Agent Systems

Esta habilidad proporciona los principios para diseñar interfaces que los agentes de IA puedan descubrir, comprender y utilizar con alta fidelidad. A diferencia de las APIs tradicionales para humanos, las herramientas de agentes deben priorizar la desambiguación semántica, la composición atómica y la eficiencia de tokens en las observaciones.

> **Mental Model**: Una herramienta es una extensión del razonamiento del modelo. Si un ingeniero humano no puede distinguir claramente cuándo usar la Herramienta A vs la Herramienta B, el agente tampoco podrá. La claridad descriptiva supera a la sofisticación técnica.

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Media**. Una mala descripción de herramienta puede llevar a bucles de llamadas infinitos o argumentos alucinados.
- **Libertad: Alta** en la implementación técnica de la lógica de la herramienta, pero **Baja** en la estructura de su definición.

## 🚀 Cuándo Activar
- Al construir nuevas capacidades para un agente (MCP, Plugins).
- Para depurar fallos recurrentes en las llamadas a herramientas (Tool-Call Failures).
- Al notar que el agente se confunde entre múltiples herramientas similares.
- Para optimizar el uso de tokens en las salidas de herramientas.

## 🧠 Conceptos Core

### 1. El Principio de Consolidación
Evita la proliferación de herramientas pequeñas. Prefiere herramientas más ricas con parámetros opcionales que agrupen flujos de trabajo relacionados.
- *Ejemplo*: En lugar de `list_users`, `get_user_email` y `update_user_role`, crea una herramienta `manage_user` que maneje el ciclo de vida del usuario.

### 2. Architectural Reduction (Reducción Arquitectónica)
A medida que el modelo (ej. Gemini 3 Ultra) mejora su razonamiento, elimina herramientas especializadas en favor de "primitivas" potentes.
- *Patrón*: Sustituye 10 herramientas de exploración de datos por un solo `execute_command` que permita al agente usar `grep`, `find` y `ls` directamente sobre el sistema de archivos.

### 3. Tool Description Engineering
Una descripción efectiva responde a:
1. **¿Qué hace?**: Acción específica y directa.
2. **¿Cuándo usarla?**: Disparadores claros y señales indirectas.
3. **¿Qué acepta?**: Parámetros con tipos, restricciones y valores por defecto.
4. **¿Qué devuelve?**: Formato del output y posibles errores.

## 🛠️ Implementación en Gemini Elite Core

### Patrón: Response Format Selection
Permite que el agente elija la verbosidad de la respuesta para ahorrar tokens.

```json
{
  "name": "get_customer",
  "parameters": {
    "format": "concise | detailed",
    "description": "concise: solo id y status; detailed: registro completo."
  }
}
```

### Patrón: Error-as-Guidance
Los errores no deben ser terminales; deben ser instrucciones de recuperación.

```json
{
  "error": "INVALID_ID",
  "message": "El ID debe empezar por 'CUST-'. Ejemplo: 'CUST-0001'.",
  "resolution": "Verifica el ID del cliente e intenta de nuevo."
}
```

---

## 🔗 Integraciones
- `context-fundamentals`: Relación entre definiciones de herramientas y presupuesto de atención.
- `evaluation`: Tests de efectividad y fidelidad de llamadas a herramientas.
- `filesystem-context`: Uso de herramientas primitivas de sistema de archivos.

## 📚 Referencias Internas
- `references/best_practices.md`: Guía de convenciones de nombres, tipos de parámetros y ejemplos concretos.
- `references/architectural_reduction.md`: Caso de estudio sobre cómo eliminar el 80% de las herramientas mejoró el éxito de la tarea.
