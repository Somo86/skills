# EmptyState

## Use when

- The design communicates that content is missing, not loaded yet, or requires user action.
- The screen or section needs an illustration, explanation, and next action.

## Figma mapping cues

- Large friendly empty screen with illustration, heading, copy, and CTA -> `EmptyState`

## Implementation notes

- Compose as `EmptyState` with `Illustration`, `Headline`, `Paragraph`, and `Footer`.
- The docs show `size="big"` and `size="small"` variants.
- Footer actions are composed with `EmptyState.Footer.PrimaryActionButton` and `EmptyState.Footer.SecondaryActionLink`.
- The examples pair `EmptyState` with `HeroIllustration` or `SpotIllustration`.

## React examples

```tsx
import {
  CheckSpotIllustration,
  EmptyState,
  SpotIllustration,
} from '@onlyfyio/oui';

export function Example() {
  return (
    <EmptyState size="small">
      <EmptyState.Illustration>
        <SpotIllustration
          illustration={CheckSpotIllustration}
          size="medium"
          variant="positive"
          color="blue"
        />
      </EmptyState.Illustration>
      <EmptyState.Headline>No saved searches yet</EmptyState.Headline>
      <EmptyState.Paragraph>
        Create your first search to start tracking matching jobs.
      </EmptyState.Paragraph>
      <EmptyState.Footer>
        <EmptyState.Footer.PrimaryActionButton>
          Create search
        </EmptyState.Footer.PrimaryActionButton>
        <EmptyState.Footer.SecondaryActionLink>
          Learn more
        </EmptyState.Footer.SecondaryActionLink>
      </EmptyState.Footer>
    </EmptyState>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a custom illustration-plus-message empty screen by hand.

## Avoid when

- The state is better represented as an error banner, inline message, or loading skeleton.

## Sources

- `packages/oui/src/components/EmptyState/EmptyState.stories.tsx`
