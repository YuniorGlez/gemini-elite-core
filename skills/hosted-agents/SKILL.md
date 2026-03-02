---
name: hosted-agents
description: Diseño e implementación de infraestructura para agentes alojados, entornos de ejecución aislados (sandboxes), agentes de fondo y soporte multijugador.
---

# 🌐 Hosted Agent Infrastructure

Esta habilidad permite diseñar y construir la infraestructura necesaria para ejecutar agentes en la nube en lugar de máquinas locales. Los agentes alojados proporcionan concurrencia ilimitada, entornos de ejecución consistentes y colaboración en tiempo real ("multiplayer").

> **Mental Model**: El valor de un agente alojado es la invisibilidad de la infraestructura. La sesión debe estar lista antes de que el usuario termine de escribir su prompt, eliminando la fricción de setup local.

## 🚩 Fragilidad y Autonomía
- **Fragilidad: Alta**. La seguridad del sandbox y la sincronización de estado son críticas y propensas a errores de concurrencia.
- **Libertad: Media** en la elección del proveedor de sandboxing (Modal, Cloudflare, AWS), pero **Baja** en los principios de aislamiento.

## 🚀 Cuándo Activar
- Al construir agentes de programación que deben correr independientemente del dispositivo del usuario.
- Para diseñar entornos de ejecución seguros (sandboxes) para código generado por IA.
- Al implementar sesiones de agentes colaborativas (multi-usuario) con estado compartido.
- Para escalar la capacidad de agentes mediante la creación de sub-agentes en paralelo.

## 🧠 Conceptos Core

### 1. El Desafío del Spin-Up
Levantar un entorno de desarrollo completo (clonado, dependencias, build) toma minutos. Los usuarios esperan segundos.
- **Solución: Image Registry Pattern**. Pre-construye imágenes de entorno cada 30-60 minutos con todo el setup listo.

### 2. Capas de Arquitectura
| Capa | Responsabilidad | Tecnología Típica |
| :--- | :--- | :--- |
| **Sandbox** | Ejecución aislada y segura. | Modal, E2B, Docker. |
| **API/State** | Gestión de sesiones y coordinación. | Cloudflare DO, SQLite. |
| **Client** | Interfaz de usuario y entrada. | Slack, Web, Extensiones. |

### 3. Sincronización Multiplayer
Un único sistema de estado que sincroniza cambios entre múltiples clientes (Web, Slack, VS Code), permitiendo que varios humanos colaboren con el mismo agente en la misma rama.

## 🛠️ Implementación en Gemini Elite Core

### Patrón: Predictive Warm-Up
Comienza a levantar o preparar el sandbox en cuanto detectes actividad de escritura en el cliente, no después de que se envíe el prompt.

### Patrón: Self-Spawning Agents
Crea herramientas para que un agente principal pueda disparar nuevas sesiones de agentes especialistas para tareas paralelas (ej. un agente investiga el frontend mientras otro depura el backend).

```markdown
<TOOL_CALL: spawn_agent>
{
  "objective": "Analizar la tabla 'users' en la DB de staging",
  "context_pointers": ["docs/db_schema.md"]
}
</TOOL_CALL>
```

---

## 🔗 Integraciones
- `multi-agent-patterns`: Coordinación de sub-agentes en entornos alojados.
- `tool-design`: Diseño de herramientas de comunicación entre el sandbox y el usuario.
- `filesystem-context`: Uso de volúmenes persistentes para mantener el estado entre sesiones.

## 📚 Referencias Internas
- `references/infrastructure-patterns.md`: Patrones detallados para Modal, Durable Objects y seguimiento de autoría.
