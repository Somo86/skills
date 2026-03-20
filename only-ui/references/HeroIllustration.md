# HeroIllustration

## Use when

- The design includes a large branded illustration for empty states, onboarding, or hero sections.

## Figma mapping cues

- Large decorative illustration block -> `HeroIllustration`

## Implementation notes

- Pass a specific illustration asset via the `illustration` prop.
- The docs show `variant` values `positive` and `negative`.
- `color` supports themed illustration palettes such as `default`, `blue`, `green`, `yellow`, and `vibrant_blue`.

## React examples

```tsx
import { BestPracticeHeroIllustration, HeroIllustration } from '@onlyfyio/oui';

export function Example() {
  return (
    <HeroIllustration
      illustration={BestPracticeHeroIllustration}
      variant="positive"
    />
  );
}
```

```tsx
import { HeroIllustration, WelcomeHeroIllustration } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ backgroundColor: '#f2f2f4' }}>
      <HeroIllustration
        illustration={WelcomeHeroIllustration}
        variant="negative"
        color="green"
      />
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise embed large illustration assets without consistent OUI theming.

## Avoid when

- A smaller supporting illustration is enough. Use `SpotIllustration`.

## Sources

- `packages/oui/src/components/HeroIllustration/HeroIllustration.stories.tsx`
