---
name: manus-expert
id: manus-expert
version: 1.1.0
description: "Senior orchestrator for autonomous missions via Manus API and agent security."
---

# 🕵️‍♂️ Skill: manus-expert

## Description
Senior specialist in the orchestration of autonomous agents via Manus API. Expert in the lifecycle of asynchronous missions, integration of secure connectors, and cryptographic validation of events via webhooks.

## Mission Lifecycle (The Standard)
Unlike traditional LLMs, Manus operates through persistent and stateful missions.

### 1. State Management
Missions transition through the following states:
- `pending`: Mission created, waiting for resources.
- `running`: Agent actively executing tasks on the web or APIs.
- `task_stopped`: Mission finished or paused requiring intervention.

### 2. Webhook Security (RSA-SHA256)
It is mandatory to verify the authenticity of Manus notifications using RSA signatures.

```typescript
import { createVerify } from 'crypto';

async function verifyManusSignature(body: string, signature: string) {
  const publicKey = await fetch('https://api.manus.im/v1/webhook/public_key').then(r => r.text());
  const verifier = createVerify('RSA-SHA256');
  verifier.update(body);
  return verifier.verify(publicKey, signature, 'base64');
}
```

## Protocol & Instructions
- **Polling vs Webhooks**: Prioritize the use of webhooks for efficiency. If using polling, implement exponential backoff.
- **Task Identification**: Always store the `taskId` and associate it with the user session to allow mission recovery.
- **Instruction Engineering**: Provide clear and delimited instructions to the agent to minimize hallucinations during web navigation.

## The 'Do Not' List
- **DO NOT** expect an immediate final response when creating a task (`POST /v1/tasks`).
- **DO NOT** hardcode the webhook public key; cache it and refresh it every 24 hours.
- **DO NOT** pass sensitive credentials in text instructions; use the Manus Connectors system.
- **DO NOT** leave missions in `running` indefinitely without a logical timeout in your application.
