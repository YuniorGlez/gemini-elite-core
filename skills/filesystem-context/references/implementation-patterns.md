# 🏗️ Filesystem Context Implementation Patterns

Referencia técnica de patrones para la gestión de contexto basada en archivos en Gemini Elite Core.

## 1. Scratch Pad Manager
Un gestor centralizado para manejar salidas de herramientas masivas y resultados intermedios.

- **Umbral de Offload**: Contenido > 2000 tokens (o ~8000 caracteres).
- **Acción**: Escribir a `.gemini/scratch/source_timestamp.txt` y devolver referencia.

## 2. Plan Persistence
Almacenamiento estructurado de planes con seguimiento de progreso.

```yaml
objective: "Migrar el sistema de autenticación a Auth.js v5"
status: "in_progress"
steps:
  - id: 1
    description: "Analizar dependencias actuales"
    status: "completed"
  - id: 2
    description: "Crear nueva configuración de providers"
    status: "pending"
```

## 3. Sub-Agent Workspace
Comunicación basada en archivos entre agentes independientes.

- **findings.md**: Almacena descubrimientos clave de un agente.
- **status.json**: Indica el progreso y si el agente está bloqueado.
- **activity.log**: Registro detallado de pasos técnicos.

## 4. Dynamic Skill Loader
Carga de contenido de habilidades bajo demanda para no saturar el prompt inicial.

- **Startup**: Carga solo el índice de habilidades (Nombre + Descripción).
- **Activación**: El agente usa `read_file` sobre el `SKILL.md` específico cuando decide activarlo.

## 5. Self-Modification Guard
Patrón seguro para que el agente aprenda y persista sus propias preferencias.

- **Limitación**: Máximo 100 entradas o 1000 caracteres por valor.
- **Validación**: Los cambios en `preferences.yaml` deben ser auditables por el usuario.

## 📏 Métricas de Contabilidad de Tokens (Token Accounting)

| Métrica | Objetivo |
| :--- | :--- |
| **Static Context Ratio** | < 20% del total. |
| **Dynamic Load Rate** | Cuántas veces se cargan archivos por tarea. |
| **Offload Savings** | Tokens ahorrados al escribir a archivos vs mantener en chat. |
| **Retrieval Precision** | % de contenido cargado que realmente se usó. |
