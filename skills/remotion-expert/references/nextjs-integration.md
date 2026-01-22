# Next.js 16 & Remotion Integration

## SSR Rendering
In 2026, Remotion is often used within Next.js for server-side video generation.

### Server Actions for Video
```tsx
'use server';
import { renderMedia } from '@remotion/renderer';

export async function generateVideo(props: VideoProps) {
  const result = await renderMedia({
    composition: 'Main',
    bundle: './dist/bundle.js',
    inputProps: props,
    codec: 'h264',
  });
  return result.url;
}
```

## `<Player />` in Client Components
```tsx
'use client';
import { Player } from '@remotion/player';

export const VideoPreview = ({ props }) => {
  return (
    <Player
      component={Main}
      durationInFrames={300}
      fps={30}
      compositionWidth={1080}
      compositionHeight={1080}
      inputProps={props}
      controls
    />
  );
};
```

---
*Updated: January 22, 2026 - 20:00*
