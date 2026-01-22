import { AbsoluteFill, interpolate, useCurrentFrame, useVideoConfig } from 'remotion';

export const Main: React.FC<{ title: string }> = ({ title }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  const opacity = interpolate(frame, [0, fps], [0, 1], {
    extrapolateRight: 'clamp',
  });

  return (
    <AbsoluteFill style={{ 
      backgroundColor: '#000', 
      justifyContent: 'center', 
      alignItems: 'center',
      color: '#fff',
      fontFamily: 'sans-serif'
    }}>
      <h1 style={{ opacity, fontSize: 80 }}>{title}</h1>
    </AbsoluteFill>
  );
};
