import { Composition } from 'remotion';
import { Main } from './Main';
import { z } from 'zod';

export const RemotionRoot: React.FC = () => {
  return (
    <>
      <Composition
        id="Main"
        component={Main}
        durationInFrames={150}
        fps={30}
        width={1080}
        height={1080}
        schema={z.object({
          title: z.string(),
        })}
        defaultProps={{
          title: 'Remotion 2026',
        }}
      />
    </>
  );
};
