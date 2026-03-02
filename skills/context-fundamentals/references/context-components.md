# 🏛️ Context Components Reference

Referencia técnica detallada de cada componente del contexto en Gemini Elite Core.

## 1. System Prompt (La Constitución)
Define la identidad del modelo (ej. "Elite Senior Software Engineer (2026)").
- **Persistencia**: Se mantiene en cada paso.
- **Peso de Atención**: Alto al inicio, pero sufre degradación en sesiones extremadamente largas.
- **Mejor Práctica**: Mantenerlo atómico, basado en principios y no en instrucciones de flujo.

## 2. Tool Definitions (Las Capacidades)
Describe las funciones que el agente puede llamar (ej. `read_file`, `grep_search`).
- **Persistencia**: Se mantiene en cada paso.
- **Impacto**: Cada definición añade ruido. Eliminar herramientas no usadas mejora el recall de las restantes.

## 3. Retrieved Documents (Conocimiento RAG)
Documentación extraída dinámicamente (`browser-use`, `read_file`).
- **Ciclo de Vida**: Just-in-Time.
- **Gestión**: Solo cargar documentos relevantes para el sub-problema actual.

## 4. Message History (La Memoria)
Historial de la conversación entre el usuario y el agente.
- **Ciclo de Vida**: Volátil.
- **Problema**: El historial tiende a ser ruidoso (ej. "gracias", "ok"). Limpiar el historial mejora el rendimiento.

## 5. Tool Outputs (Las Observaciones)
Resultados de las llamadas a herramientas.
- **Volumen**: Pueden ser masivos (ej. un `ls -R` en un monorepo).
- **Tratamiento**: Utilizar `toolOutputMasking` para ocultar salidas largas que ya se han procesado.

## Resumen de Pesos de Atención

| Componente | Peso | Riesgo |
| :--- | :--- | :--- |
| **System Prompt** | ⭐⭐⭐⭐⭐ | Rigidez (Over-fitting) |
| **Tool Definitions** | ⭐⭐⭐⭐ | Alucinación de argumentos |
| **Message History** | ⭐⭐⭐ | Deriva de tarea (Topic Drift) |
| **Tool Outputs** | ⭐⭐ | Distracción por ruido |
