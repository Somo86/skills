# Rating

## Use when

- The design asks users to provide or view a star-style rating.

## Figma mapping cues

- Star rating control or readout -> `Rating`

## Implementation notes

- The docs show `variant` values `static` and `dynamic`.
- `size` includes `small` and `medium`.
- `defaultValue` sets the initial selected value.
- `dynamic` is the interactive mode; `static` is for display.

## React examples

```tsx
import { Rating } from '@onlyfyio/oui';

export function Example() {
  return <Rating variant="dynamic" size="medium" defaultValue={3} />;
}
```

```tsx
import { Rating } from '@onlyfyio/oui';

export function Example() {
  return <Rating variant="static" size="small" defaultValue={2} />;
}
```

## Prefer over raw HTML when

- You would otherwise build a star rating UI and interaction logic manually.

## Avoid when

- The UI needs a numeric slider rather than a discrete star rating.

## Sources

- `packages/oui/src/components/Rating/docs/Rating.stories.tsx`
