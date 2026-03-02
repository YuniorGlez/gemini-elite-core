# 📊 Guía de Métricas para Evaluación de IA

Selección de métricas adecuadas para validar sistemas de IA.

## 1. Métricas de Exactitud (Objetivas)
- **Factual Accuracy**: ¿La respuesta se basa en la fuente de verdad proporcionada?
- **Format Compliance**: ¿La respuesta cumple con el esquema JSON/Markdown/Code esperado?
- **Tool-Call Fidelity**: ¿Los argumentos de la herramienta son válidos y lógicamente coherentes?

## 2. Métricas de Calidad (Subjetivas)
- **Concisión**: ¿La respuesta es eficiente en el uso de palabras?
- **Tono**: ¿El lenguaje es profesional, empático o técnico según lo solicitado?
- **Creatividad/Insights**: ¿Aporta valor más allá de lo evidente?

## 3. Métricas de Robustez
- **Coherencia**: ¿La respuesta es consistente de principio a fin?
- **Persistencia de Instrucción**: ¿Sigue todas las restricciones (ej. "no usar emojis")?

## 4. Selección por Tipo de Tarea
- **RAG**: Factualidad + Relevancia + Ausencia de Alucinaciones.
- **Generación de Código**: Correctitud + Eficiencia + Seguimiento de Estilo.
- **Asistencia de Escritura**: Tono + Fluidez + Concisión.
