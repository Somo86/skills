# Banner

## Use when

- The design shows a prominent inline message area inside a page or section.
- The message may need semantic styling and dismiss behavior.

## Figma mapping cues

- Full-width message bar inside content flow -> `Banner`

## Implementation notes

- The docs show `variant`, `closeLabel`, and `textAlign`.
- `Banner` is suited for persistent inline messaging rather than toast-like overlays.
- Width should usually be controlled by the container.

## React examples

```tsx
import { Banner } from '@onlyfyio/oui';

export function Example() {
  return (
    <Banner variant="info" closeLabel="Close" textAlign="start">
      Example banner
    </Banner>
  );
}
```

```tsx
import { Banner } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ width: 500 }}>
      <Banner variant="warning" closeLabel="Dismiss">
        Your profile is incomplete.
      </Banner>
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise create a custom in-flow alert or notice bar.

## Avoid when

- The message should float or auto-dismiss. Consider `Notification`.

## Sources

- `packages/oui/src/components/Banner/docs/Banner.stories.tsx`
