# 🏛️ Multi-Agent Frameworks Reference

Referencia técnica de frameworks y patrones de implementación para Gemini Elite Core.

## 1. LangGraph (State Machine Orchestration)
Basado en grafos de estados y flujos acíclicos dirigidos (DAG).

- **Fortaleza**: Control estricto, persistencia nativa, soporte humano-en-el-bucle.
- **Patrón**: Ciclo de vida `Nodo -> Edge -> Estado`.

## 2. AutoGen (Conversational / Swarm)
Basado en diálogos entre agentes y GroupChats.

- **Fortaleza**: Flexibilidad extrema, agentes que pueden pedir ayuda de forma autónoma.
- **Patrón**: Handoff mediante retorno de función (`transfer_to_agent_b`).

## 3. CrewAI (Role-Based Hierarchy)
Basado en procesos secuenciales o jerárquicos con roles definidos.

- **Fortaleza**: Facilidad de uso para tareas que imitan equipos humanos.
- **Patrón**: `Crew(agents=[...], tasks=[...], process=Process.hierarchical)`.

## 4. Protocolos de Consenso (Evitar Sicofancia)

| Protocolo | Mecanismo | Cuándo Usar |
| :--- | :--- | :--- |
| **Weighted Voting** | Votos pesados por confianza/expertise. | Clasificación de alta precisión. |
| **Adversarial Debate** | Agentes critican mutuamente sus planes. | Razonamiento estratégico complejo. |
| **Consensus Trigger** | Detecta cuando los agentes se limitan a copiar. | Evitar bucles de acuerdo inútiles. |

## 5. Mitigación de Fallos Comunes

- **Supervisor Bottleneck**: Implementar checkpoints y resúmenes estructurados de las salidas de los trabajadores.
- **Coordination Overhead**: Minimizar la comunicación entre agentes; usar el sistema de archivos como medio de intercambio masivo.
- **Telephone Game**: Permitir que los agentes pasen sus respuestas directamente al usuario o al siguiente agente sin paráfrasis.

## 📏 Métricas de Orquestación

| Métrica | Objetivo |
| :--- | :--- |
| **Token Multiplier** | < 15x comparado con single-agent. |
| **Handoff Fidelity** | > 98% de información crítica preservada. |
| **Parallelization Gain** | Reducción de tiempo real (Wall-clock time). |
| **Convergence Rate** | % de tareas que terminan sin bucles infinitos. |
