# Sequencing & Series

## `<Sequence>`
Offsets the timeline for its children.

```tsx
<Sequence from={30} durationInFrames={60}>
  <SceneOne />
</Sequence>
```
*Note: Inside `SceneOne`, `useCurrentFrame()` will start at 0 when the global frame is 30.*

## `<Series>`
Plays children one after another.

```tsx
<Series>
  <Series.Sequence durationInFrames={40}>
    <Intro />
  </Series.Sequence>
  <Series.Sequence durationInFrames={100} offset={-10}>
    <MainContent /> {/* Overlaps intro by 10 frames */}
  </Series.Sequence>
</Series>
```

---
*Updated: January 22, 2026 - 20:00*
