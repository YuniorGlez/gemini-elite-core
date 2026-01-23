# Plan de Importación de Nuevas Skills (Skills.sh -> Gemini Elite Core)

Este documento detalla la estrategia para integrar 20 nuevas capacidades provenientes del ecosistema `skills.sh`, adaptándolas a los estándares de **Squaads AI Core** (Next.js 16, React 19, Bun, Tailwind 4).

## 🧠 Aclaración: "Strict Typing" en Skills
Cuando hablo de **Strict Typing** aplicado a una Skill, me refiero a que la Skill no solo contiene texto descriptivo, sino que define **herramientas (tools)** con validación de tipos rigurosa.

1.  **Validación de Herramientas (Zod/Pydantic):** Si una skill (como `stripe-expert`) incluye un script en `/scripts` para validar una API Key o crear un producto, los argumentos que el LLM pasa a ese script deben estar definidos mediante un esquema (Zod en TypeScript o Pydantic en Python). Esto evita que el modelo envíe parámetros inventados o con formatos incorrectos.
2.  **Output Estructurado:** Garantizar que cuando la skill genera código, este siga una interfaz de tipos estricta (`interface`, `type`, `z.infer`) para que el resto del sistema pueda consumirlo sin errores de runtime.
3.  **Contratos de Datos:** Definir "contratos" entre lo que el usuario pide y lo que el agente ejecuta, eliminando la ambigüedad.

---

## 📋 Listado de 20 Skills a Importar

| ID | Skill Name | URL de Referencia (GitHub Source) | Prioridad |
| :--- | :--- | :--- | :--- |
| 1 | `threejs-expert` | [vercel-labs/agent-skills/.../threejs-fundamentals](https://github.com/vercel-labs/agent-skills/tree/main/skills/threejs-fundamentals) | Alta |
| 2 | `convex-pro` | [vercel-labs/agent-skills/.../convex-best-practices](https://github.com/vercel-labs/agent-skills/tree/main/skills/convex-best-practices) | Alta |
| 3 | `tanstack-query-expert` | [vercel-labs/agent-skills/.../tanstack-query](https://github.com/vercel-labs/agent-skills/tree/main/skills/tanstack-query) | Media |
| 4 | `nestjs-pro` | [vercel-labs/agent-skills/.../nestjs-best-practices](https://github.com/vercel-labs/agent-skills/tree/main/skills/nestjs-best-practices) | Media |
| 5 | `stripe-expert` | [vercel-labs/agent-skills/.../stripe-best-practices](https://github.com/vercel-labs/agent-skills/tree/main/skills/stripe-best-practices) | Alta |
| 6 | `shadcn-ui-expert` | [vercel-labs/agent-skills/.../shadcn-ui](https://github.com/vercel-labs/agent-skills/tree/main/skills/shadcn-ui) | Alta |
| 7 | `monorepo-master` | [vercel-labs/agent-skills/.../monorepo-management](https://github.com/vercel-labs/agent-skills/tree/main/skills/monorepo-management) | Media |
| 8 | `github-actions-pro` | [vercel-labs/agent-skills/.../github-actions-templates](https://github.com/vercel-labs/agent-skills/tree/main/skills/github-actions-templates) | Media |
| 9 | `subagent-orchestrator` | [vercel-labs/agent-skills/.../subagent-driven-development](https://github.com/vercel-labs/agent-skills/tree/main/skills/subagent-driven-development) | Alta |
| 10 | `c4-architect` | [vercel-labs/agent-skills/.../c4-architecture](https://github.com/vercel-labs/agent-skills/tree/main/skills/c4-architecture) | Baja |
| 11 | `openapi-pro` | [vercel-labs/agent-skills/.../openapi-to-typescript](https://github.com/vercel-labs/agent-skills/tree/main/skills/openapi-to-typescript) | Media |
| 12 | `mermaid-diagram-pro` | [vercel-labs/agent-skills/.../mermaid-diagrams](https://github.com/vercel-labs/agent-skills/tree/main/skills/mermaid-diagrams) | Media |
| 13 | `marketing-expert` | [vercel-labs/agent-skills/.../marketing-psychology](https://github.com/vercel-labs/agent-skills/tree/main/skills/marketing-psychology) | Baja |
| 14 | `programmatic-seo-pro` | [vercel-labs/agent-skills/.../programmatic-seo](https://github.com/vercel-labs/agent-skills/tree/main/skills/programmatic-seo) | Media |
| 15 | `e2e-testing-expert` | [vercel-labs/agent-skills/.../e2e-testing-patterns](https://github.com/vercel-labs/agent-skills/tree/main/skills/e2e-testing-patterns) | Media |
| 16 | `security-audit-pro` | [vercel-labs/agent-skills/.../convex-security-audit](https://github.com/vercel-labs/agent-skills/tree/main/skills/convex-security-audit) | Media |
| 17 | `humanizer-pro` | [vercel-labs/agent-skills/.../humanizer](https://github.com/vercel-labs/agent-skills/tree/main/skills/humanizer) | Baja |
| 18 | `scrum-conductor` | [vercel-labs/agent-skills/.../daily-meeting-update](https://github.com/vercel-labs/agent-skills/tree/main/skills/daily-meeting-update) | Baja |
| 19 | `code-review-pro` | [vercel-labs/agent-skills/.../code-review-excellence](https://github.com/vercel-labs/agent-skills/tree/main/skills/code-review-excellence) | Alta |
| 20 | `design-system-pro` | [vercel-labs/agent-skills/.../design-system-patterns](https://github.com/vercel-labs/agent-skills/tree/main/skills/design-system-patterns) | Media |

---

## 🛠️ Subpasos para la Importación y Adaptación

Para cada skill, seguiré este flujo de trabajo para garantizar que no solo importamos, sino que mejoramos y unificamos el conocimiento:

1.  **Análisis de Similitud (Merge Check):** Antes de crear nada, verificaré si ya existe una skill similar en `skills/`. Si existe, el objetivo será una **fusión (merge)**: extraer lo mejor de la nueva fuente y añadirlo a nuestra base existente, manteniendo nuestros estándares de "Pro/Expert".
2.  **Exploración Exhaustiva de la Fuente:** No me limitaré al `SKILL.md`. Revisaré el repositorio de origen completo buscando archivos de referencia, ejemplos de código (`examples/`), scripts de automatización o plantillas que podamos adaptar.
3.  **Extracción y Refactorización:** Descargar y adaptar el contenido a nuestra estructura (references, scripts, templates).
4.  **Expansión de Contenido (Recency Check):** Búsqueda web para actualizar a **Enero 2026** (Next.js 16.2, React 19.3, etc.).
5.  **Inyección de Stack Moderno y Strict Typing:** Asegurar que todo el código sea Type-safe y use herramientas con esquemas Zod/Pydantic.
6.  **Registro y Verificación:** Actualizar `SKILLS_REGISTRY.md` y verificar con `tsc`.

---

## 📝 Progress Tracking (To-Do List)

- [x] **1. `threejs-expert`**
    - [x] Análisis de similitud y búsqueda exhaustiva en fuente.
    - [x] Actualización a WebGPU/WebGL 2026.
    - [x] Creación de estructura y merge de contenidos.
- [x] **2. `convex-pro`**
    - [x] Análisis de similitud y búsqueda exhaustiva en fuente.
    - [x] Actualización a Convex v2+ (RLS y Auth dinámico).
    - [x] Creación de estructura y merge de contenidos.
- [x] **3. `tanstack-query-expert`**
    - [x] Análisis de similitud (¿mezclar con `react-expert`?).
    - [x] Optimización de caché y Server Actions integration.
    - [x] Creación de estructura.
- [x] **4. `nestjs-pro`**
    - [x] Análisis de similitud y búsqueda en fuente.
    - [x] Adaptación a microservicios con Bun.
    - [x] Creación de estructura.
- [x] **5. `stripe-expert`**
    - [x] Análisis de similitud y búsqueda en fuente.
    - [x] Implementación de flujos de pago 2026 (Tax, Billing).
    - [x] Creación de estructura.
- [x] **6. `shadcn-ui-expert`**
    - [x] Análisis de similitud (mezclar con `ui-ux-pro`).
    - [x] Adaptación a Tailwind 4 y Radix 2026.
    - [x] Creación de estructura.
- [x] **7. `monorepo-master`**
    - [x] Análisis de similitud y búsqueda en fuente.
    - [x] Optimización para Turborepo + Bun.
    - [x] Creación de estructura.
- [x] **8. `github-actions-pro`**
    - [x] Análisis de similitud y búsqueda en fuente.
    - [x] Seguridad OIDC y Hardened Runners.
    - [x] Creación de estructura.
- [x] **9. `subagent-orchestrator`**
    - [x] Análisis de similitud (mezclar con `conductor-pro`).
    - [x] Protocolos de comunicación inter-agente.
    - [x] Creación de estructura.
- [x] **10. `c4-architect`**
    - [x] Análisis de similitud y búsqueda en fuente.
    - [x] Generación automática de diagramas C4.
    - [x] Creación de estructura.
- [x] **11. `openapi-pro`**
    - [x] Análisis de similitud y búsqueda en fuente.
    - [x] Generación de clientes Type-safe (Zod/Fetch).
    - [x] Creación de estructura.
- [x] **12. `mermaid-diagram-pro`**
    - [x] Análisis de similitud y búsqueda en fuente.
    - [x] Soporte para diagramas de secuencia complejos.
    - [x] Creación de estructura.
- [ ] **13. `marketing-expert`**
    - [ ] Análisis de similitud y búsqueda en fuente.
    - [ ] Estrategias de CRO y analítica 2026.
    - [ ] Creación de estructura.
- [ ] **14. `programmatic-seo-pro`**
    - [ ] Análisis de similitud (mezclar con `seo-pro`).
    - [ ] Generación de contenido con IA y Schema.org.
    - [ ] Creación de estructura.
- [ ] **15. `e2e-testing-expert`**
    - [ ] Análisis de similitud y búsqueda en fuente.
    - [ ] Playwright con visual testing y tracing.
    - [ ] Creación de estructura.
- [ ] **16. `security-audit-pro`**
    - [ ] Análisis de similitud (mezclar con `auditor-pro`).
    - [ ] Auditoría de RLS y dependencias.
    - [ ] Creación de estructura.
- [ ] **17. `humanizer-pro`**
    - [ ] Análisis de similitud y búsqueda en fuente.
    - [ ] Refinamiento de tono y estilo natural.
    - [ ] Creación de estructura.
- [ ] **18. `scrum-conductor`**
    - [ ] Análisis de similitud (mezclar con `track-master`).
    - [ ] Gestión de tickets y sprints automáticos.
    - [ ] Creación de estructura.
- [ ] **19. `code-review-pro`**
    - [ ] Análisis de similitud y búsqueda en fuente.
    - [ ] Auditoría de performance y deuda técnica.
    - [ ] Creación de estructura.
- [ ] **20. `design-system-pro`**
    - [ ] Análisis de similitud y búsqueda en fuente.
    - [ ] Gestión de Tokens de Diseño y documentación.
    - [ ] Creación de estructura.

---
*Ultima actualización: 23 de enero, 2026*
