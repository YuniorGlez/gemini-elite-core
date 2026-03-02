# 🛡️ Bias Mitigation in LLM Evaluation

Técnicas esenciales para reducir sesgos sistemáticos cuando se utiliza un LLM como juez.

## 1. Position Bias (Sesgo de Posición)
Los modelos tienden a preferir la primera respuesta que ven.
- **Técnica: Position Swapping**. Ejecuta la evaluación dos veces intercambiando el orden de los candidatos.
- **Validación de Consistencia**: Si el modelo cambia de opinión al rotar, marca el resultado como "Inconsistente" o "Empate".

## 2. Length Bias (Sesgo de Longitud)
Preferencia por respuestas más largas, independientemente de la calidad.
- **Instrucción de Control**: "Ignora la longitud de la respuesta; penaliza la verborrea irrelevante."
- **Normalización**: Extrae métricas de longitud y busca correlación positiva excesiva con el score.

## 3. Self-Enhancement Bias
Modelos que puntúan mejor sus propios outputs.
- **Cross-Model Evaluation**: Usa un modelo (ej. Gemini 3 Ultra) para evaluar outputs de otro (ej. Claude 3.5).
- **Anonymization**: Elimina cualquier firma o estilo que identifique al modelo generador.

## 4. PoLL (Panel of LLM Judges)
Usa múltiples modelos jueces (Gemini, Claude, GPT) y promedia sus scores para una evaluación robusta.
- **Voto Mayoritario**: Para clasificaciones binarias.
- **Mediana de Scores**: Para escalas ordinales (1-5).
