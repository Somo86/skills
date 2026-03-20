# SpotIllustration

## Use when

- The design includes a small or medium supporting illustration rather than a full hero image.

## Figma mapping cues

- Compact decorative illustration next to text or empty-state copy -> `SpotIllustration`

## Implementation notes

- Pass a specific illustration asset via `illustration`.
- The docs show `variant` values `positive` and `negative`.
- `size` is configurable, and `color` supports themed palettes such as `default`, `blue`, and `green`.

## React examples

```tsx
import { AddAvatarSpotIllustration, SpotIllustration } from '@onlyfyio/oui';

export function Example() {
  return (
    <SpotIllustration
      illustration={AddAvatarSpotIllustration}
      variant="positive"
      size="large"
    />
  );
}
```

## Prefer over raw HTML when

- You would otherwise place small illustration assets manually.

## Avoid when

- The design needs a large hero illustration. Use `HeroIllustration`.

## Sources

- `packages/oui/src/components/SpotIllustration/docs/SpotIllustration.stories.tsx`
- `packages/oui/src/components/SpotIllustration/tests/SpotIllustration.tests.stories.tsx`
