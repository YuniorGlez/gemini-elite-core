# Media & Assets

## Using `<Video />` and `<Audio />`
Never use plain `<video>` or `<audio>` tags.

```tsx
import { Video, Audio } from '@remotion/media';
import { staticFile } from 'remotion';

export const MediaScene = () => {
  return (
    <>
      <Video 
        src={staticFile('bg.mp4')} 
        volume={0.5}
        playbackRate={1.2}
        trimBefore={30} // 30 frames
      />
      <Audio 
        src="https://example.com/music.mp3" 
        placeholder="music-placeholder.mp3" // 2026: Always provide placeholders
      />
    </>
  );
};
```

## Asset Optimization
- **Lottie**: Use `remotion-lottie` for vector animations.
- **Images**: Use `<Img />` from `remotion` for better handling and caching.
- **Fonts**: Load fonts via `@remotion/google-fonts` or local `@font-face` in `Root.tsx`.

## 2026: Mediabunny Integration
Mediabunny is the standard utility for media analysis in 2026.
```tsx
import { getMetadata } from '@remotion/mediabunny';

const metadata = await getMetadata(staticFile('video.mp4'));
// { width: 1920, height: 1080, duration: 10.5, ... }
```

---
*Updated: January 22, 2026 - 20:00*
