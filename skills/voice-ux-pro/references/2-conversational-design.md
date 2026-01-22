# Reference: Conversational Design (Voice-First)

## Overview
Voice is not "Keyboard via Speech." It is a separate design language that requires handling ambiguity, context, and environment.

---

## 🎭 1. The "Barge-In" Capability
Users should be able to interrupt the AI. 

### Implementation:
- When the device detects user speech while playing audio, it MUST immediately mute the AI voice and start the STT listener.
- Use a "Fade-Out" instead of a "Hard Stop" for a better UX.

---

## 🛠️ 2. Graceful Error Handling
"I didn't understand" is a dead end. Use "Clarification Prompts."

**Wrong:** "Error: Command not found."
**Right:** "I'm not sure if you meant 'Add to Cart' or 'View Details'. Which one would you like?"

---

## ♿ 3. Inclusivity & Accessibility
- **Support for Stuttering:** Tune the "Silence Threshold" so the system doesn't cut off users with speech impediments.
- **Accents:** Use STT models trained on diverse datasets (Whisper v4 excels here).
- **Cognitive Load:** Never read out more than 3 options at a time.

---

## 🌡️ 4. Environmental Awareness
- **Whisper "Voice Separation":** In a restaurant, the AI should only listen to the voice closest to the microphone.
- **Background Noise:** Use haptic feedback if the environment is too loud for the user to hear the AI's response.
