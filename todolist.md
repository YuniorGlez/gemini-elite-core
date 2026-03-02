# 📋 Plan de Portabilidad: Agent Skills (Claude -> Gemini CLI)

Este documento rastrea la migración y adaptación de las habilidades de ingeniería de contexto desde el repositorio `Agent-Skills-for-Context-Engineering` al ecosistema **Gemini Elite Core**.

## 🎯 Objetivo
Transformar cada habilidad diseñada originalmente para Claude Code en una "Tactical Skill" de Gemini CLI, optimizada para el modelo Gemini 3 y los estándares de 2026.

## 🛠️ Metodología por Skill
1. **Research**: Leer la skill original en el repo de origen.
2. **Analysis**: Traducir conceptos de Claude Code (plugins, mental states) a Gemini CLI (Tactical Skills, Context Engineering).
3. **Generation**: Crear la estructura en `skills/<skill-name>/SKILL.md` y archivos de referencia.
4. **Validation**: Verificar que la longitud y utilidad coincidan con la excelencia del original.
5. **Commit & Push**: Entrega atómica de cada skill.

---

## 📈 Estado de la Misión

- [x] **advanced-evaluation**
- [x] **bdi-mental-states**
- [x] **context-compression**
- [x] **context-degradation**
- [x] **context-fundamentals**
- [x] **context-optimization**
- [x] **evaluation**
- [x] **filesystem-context**
- [x] **hosted-agents**
- [x] **memory-systems**
- [x] **multi-agent-patterns**
- [x] **project-development**
- [ ] **tool-design**

---

##  Learned Context (Contexto Aprendido)
- Las skills originales de Claude Code usan un formato `SKILL.md` con frontmatter simplificado.
- El repo enfatiza el uso de la carpeta `references/` para mantener el archivo principal bajo los 500 líneas.
- Se detectó el uso de ontologías (BDI) y patrones de compresión de contexto que son altamente compatibles con el `Context Engineering` de Gemini Elite Core.
