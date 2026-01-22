# Compositions & Props

## The Root Component
Every Remotion project has a root (usually `src/Root.tsx`).

```tsx
import { Composition, Folder } from 'remotion';
import { Main } from './Main';

export const RemotionRoot = () => {
  return (
    <>
      <Folder name="Social Media">
        <Composition
          id="Reel-9-16"
          component={Main}
          durationInFrames={900}
          fps={30}
          width={1080}
          height={1920}
          schema={ZodSchema} // 2026 Standard: Always use schemas
          defaultProps={{
            title: "Remotion 2026",
            theme: "dark"
          }}
        />
      </Folder>
    </>
  );
};
```

## Parameterized Videos
Allowing videos to be changed via props is the key to automation.

### Zod Integration
```tsx
import { z } from 'zod';

export const mySchema = z.object({
  title: z.string(),
  backgroundColor: z.string().startsWith('#'),
});

export type MyProps = z.infer<typeof mySchema>;
```

## `calculateMetadata`
Essential for dynamic content where you don't know the duration until you fetch data.

```tsx
export const calculateMetadata = async ({ props, abortSignal }) => {
  const data = await fetch(`https://api.v2.com/data/${props.id}`, { signal: abortSignal });
  const json = await data.json();
  
  return {
    durationInFrames: json.lengthInSeconds * 30,
    props: {
      ...props,
      dynamicContent: json.text,
    },
  };
};
```

---
*Updated: January 22, 2026 - 20:00*
