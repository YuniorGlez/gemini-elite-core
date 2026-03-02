# 🏗️ Patrones de Implementación (LLM-as-a-Judge)

Patrones técnicos para integrar evaluación robusta en Gemini Elite Core.

## 1. Patrón: Reasoning-First (Chain-of-Thought)
Obliga al juez a razonar antes de emitir un score.
- **Ventaja**: Reduce alucinaciones en el score y permite depuración del juicio.
- **Uso en Gemini**: Activa `thinking-pro` para este patrón.

```markdown
Razona paso a paso sobre la calidad de la respuesta comparándola con los criterios de la rúbrica.
Finaliza con el JSON: { "score": X, "reasoning": "Y" }
```

## 2. Patrón: Pairwise con Explicación (Swap Test)
Comparación directa entre dos candidatos (A vs B).
- **Proceso**:
  1. Comparar A vs B.
  2. Comparar B vs A.
  3. Si el ganador es el mismo, es confiable. Si cambia, es EMPATE.

## 3. Patrón: Rúbricas Multinivel
Define niveles de calidad atómicos (1-5).
- **Rúbrica de Ejemplo**:
  - **1 (Fallido)**: Respuesta irrelevante o con errores factuales críticos.
  - **3 (Aceptable)**: Respuesta correcta pero genérica, cumple lo básico.
  - **5 (Excepcional)**: Respuesta creativa, precisa, con formato perfecto y insights adicionales.

## 4. Patrón: Evaluación por Componentes
Divide la evaluación en sub-scores (Factualidad, Tono, Formato).
- **Ventaja**: Permite ponderar qué es más importante para el proyecto (ej. Factualidad > Tono).
