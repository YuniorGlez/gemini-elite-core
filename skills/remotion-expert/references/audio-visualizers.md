# Audio Visualizers

Creating audio visualizers is a core strength of Remotion.

## Data Analysis
Use `@remotion/media` to analyze audio data.

```tsx
import { useAudioData, visualizeAudio } from '@remotion/media';

export const Visualizer = () => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();
  const audioData = useAudioData(staticFile('music.mp3'));

  if (!audioData) return null;

  const visualization = visualizeAudio({
    fps,
    frame,
    audioData,
    numberOfSamples: 16,
  });

  return (
    <div style={{ display: 'flex', gap: 10 }}>
      {visualization.map((v, i) => (
        <div key={i} style={{ height: v * 200, width: 20, backgroundColor: 'blue' }} />
      ))}
    </div>
  );
};
```

---
*Updated: January 22, 2026 - 20:00*
