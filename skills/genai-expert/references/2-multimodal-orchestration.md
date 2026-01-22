# Reference: Multimodal Orchestration (2026)

## Overview
Gemini 1.5 is natively multimodal. It doesn't use separate "vision" models; it processes text, images, audio, and video in the same context window.

---

## 📽️ 1. Video Analysis
The SDK treats video as a series of images sampled at 1fps.

### Use Case: UI/UX Audit
"Look at this screen recording of our checkout flow and identify where the 'Confirm' button is missing."

```typescript
const result = await model.generateContent([
  {
    fileData: {
      mimeType: "video/mp4",
      fileUri: "https://storage.googleapis.com/squaads/checkout-bug.mp4"
    }
  },
  "Identify the timestamp where the error message appears."
]);
```

---

## 🎙️ 2. Audio Processing
Gemini can transcribe and analyze audio directly, including tone and background noise.

### Use Case: Meeting Summarization
"Summarize this 2-hour call and extract only the action items for the frontend team."

---

## 📄 3. Document Forensic (PDFs)
While we have a `pdf-pro` skill, Gemini can read PDFs with up to 3,000 pages in one go.

### Best Practice:
For very large PDFs, use **Context Caching** to avoid re-uploading the document on every question.

---

## 🚫 Multimodal Limits
- **Image Size:** Max 20MB.
- **Video Length:** Up to 1 hour for 1.5 Pro.
- **Audio:** Up to 9.5 hours for 1.5 Pro.
- **Tokens:** Remember that 1 minute of video uses ~30,000 tokens.
