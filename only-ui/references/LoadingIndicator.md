# LoadingIndicator

## Use when

- The design needs an indeterminate loading spinner.
- Content is pending and no determinate progress value exists.

## Figma mapping cues

- Spinner or circular loading glyph -> `LoadingIndicator`

## Implementation notes

- The docs mention three sizes: `small`, `medium`, and `large`.
- Typical use cases are React `Suspense` fallbacks or conditional loading states.

## React examples

```tsx
import { LoadingIndicator } from '@onlyfyio/oui';

export function Example() {
  return <LoadingIndicator />;
}
```

```tsx
import { LoadingIndicator } from '@onlyfyio/oui';
import { Suspense } from 'react';

export function Example({ children }: { children: React.ReactNode }) {
  return <Suspense fallback={<LoadingIndicator />}>{children}</Suspense>;
}
```

## Prefer over raw HTML when

- You would otherwise use a custom spinner component or ad hoc loading glyph.

## Avoid when

- You know the progress percentage. Use `ProgressBar`.

## Sources

- `packages/oui/src/components/LoadingIndicator/LoadingIndicator.stories.tsx`
