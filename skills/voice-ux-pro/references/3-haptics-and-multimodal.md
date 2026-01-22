# Reference: Haptics & Multimodal Feedback

## Overview
Voice interaction is often a "Blind" experience. Haptics provide the "Touch" that confirms the system state.

---

## 📳 1. Tactile Design Language
In 2026, Squaads apps use a standardized "Haptic Alphabet":

| Event | Pattern | Impact |
| :--- | :--- | :--- |
| **Wake-word detected** | Single Soft Pulse | Indicates "Listening". |
| **Success** | Double Sharp Pulse | Action completed. |
| **Error** | Long Vibrato Pulse | Something went wrong. |
| **Progress** | Low-frequency rumble | Working on a long task. |

---

## 📺 2. Visual-Voice Sync
If the user is looking at a screen while talking, the UI must reflect the "Listening" state without obstructing the content.

### Squaads Pattern: The "Pulse Ring"
A subtle glowing ring around the edge of the active UI element or the bottom of the screen that oscillates with the user's voice frequency.

---

## 🚲 3. Hands-Free & Eyes-Free
For mobile users (Walking, Biking), use **TTS for all confirmations**.
"Got it, adding milk to your list."

For web users (Desktop), use **Haptic-Visual confirmations**.
(Pulse + Notification banner).

---

## 🛠️ 4. API Selection
- **Web:** Use the `Navigator.vibrate()` API (Chrome/Android).
- **Mobile (React Native):** Use `expo-haptics` (Core) or `react-native-haptic-feedback` for lower-level control on iOS.
