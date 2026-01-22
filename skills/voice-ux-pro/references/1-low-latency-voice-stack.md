# Reference: Low-Latency Voice Stack (2026)

## Overview
The "Sub-300ms" barrier is the threshold where a conversation feels natural. To achieve this, we must optimize every layer of the speech stack.

---

## 🎙️ 1. Streaming STT (Speech-to-Text)
In 2026, we don't send audio files; we send a stream of bytes and receive a stream of words.

- **WebSocket/WebTransport:** Mandatory for low-latency audio transmission.
- **Partial Results:** Use "Stability" scores from the STT engine to decide when to trigger the LLM.
- **VAD (Voice Activity Detection):** Run VAD locally on the device (WebAssembly or Worklet) to stop sending audio as soon as the user stops talking.

---

## 🧠 2. LLM Intent Extraction
For voice, the prompt must be ultra-short to reduce token generation time.

**Squaads Voice Prompt Pattern:**
"Act as a voice assistant. Current screen: [ID]. User said: [TEXT]. Respond in < 15 words. Intent: [JSON]."

---

## 🔊 3. S2S (Speech-to-Speech)
The future is S2S models (like Gemini 1.5 Pro native audio mode), where the model *hears* audio and *speaks* audio without intermediate text conversion.

### Advantages:
- **Zero Jitter:** The emotional tone matches the server-side intent instantly.
- **Prosody:** Natural pauses and emphasis.

---

## 🌍 4. Regional Edge Inference
Standard APIs have too many network hops. 
**Strategy:** Deploy the STT/TTS engine in the same data center as the LLM (e.g., Google Cloud Vertex AI regions).
- **Target:** 150ms for Network + 100ms for Processing + 50ms for Playback.
