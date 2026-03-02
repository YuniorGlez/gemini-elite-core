# 🏗️ Infrastructure Patterns Reference

Referencia técnica de patrones para agentes alojados y entornos de ejecución en Gemini Elite Core.

## 1. Sandbox Image Registry Pattern

Pre-construye imágenes de entorno cada 30-60 minutos para reducir el tiempo de inicio (cold start).

- **Proceso**:
  1. El sistema de CI/CD dispara un build de imagen con el código y dependencias actuales.
  2. La imagen se etiqueta como `env:latest`.
  3. Al disparar un agente, se usa `env:latest` en lugar de `clone && build`.

## 2. Per-Session State Management (Durable Objects)

Mantener el estado de la sesión aislado y consistente en un entorno distribuido.

- **Durable Object (DO)**: Almacena el historial de chat, la lista de archivos modificados y el estado del plan.
- **Sincronización**: Todos los clientes (Web, CLI, Slack) se conectan al mismo DO para una experiencia multijugador.

## 3. Attribution Pattern (Git Commit Auth)

Asegurar que los cambios hechos por el agente se atribuyan correctamente al usuario humano.

- **Método**: El agente usa un token de instalación de GitHub App, pero configura el `committer` con los detalles del usuario que disparó la sesión.

```bash
git config user.name "Usuario Humano"
git config user.email "usuario@ejemplo.com"
git commit -m "feat: [Agent] Implementar validación de emails"
```

## 4. Multi-Agent Spawning (Self-Spawn Tool)

Permite que un agente principal cree sub-agentes especialistas en paralelo.

```json
{
  "tool": "spawn_agent",
  "arguments": {
    "agent_type": "frontend_expert",
    "objective": "Refactorizar el componente Login.tsx a Tailwind 4",
    "input_files": ["src/components/Login.tsx"]
  }
}
```

## 5. Security Guardrails (Sandbox)

- **Network Isolation**: El sandbox no tiene acceso a la red interna, solo a APIs autorizadas.
- **Resource Limits**: Límites estrictos de CPU (ej. 2 vCPUs) y Memoria (ej. 4GB) por agente.
- **Auto-Termination**: Matar sandboxes inactivos después de 15 minutos.

## 📏 Métricas de Infraestructura

| Métrica | Objetivo |
| :--- | :--- |
| **Spin-up Time** | < 10 segundos. |
| **Commit Success Rate** | > 95% de PRs sin errores de lint/build. |
| **Concurrency Limit** | > 100 agentes en paralelo (según infraestructura). |
| **Aisle Isolation** | 0 fugas de datos entre sesiones de diferentes usuarios. |
