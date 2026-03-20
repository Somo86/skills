# Button

## Use when

- The design shows a primary, secondary, or tertiary click action.
- A CTA should look like a button, not a text link.
- The action may need disabled, loading, icon, or full-width states.

## Figma mapping cues

- Filled CTA button -> `Button variant="primary"`
- Outlined or lower-emphasis action -> `Button variant="secondary"`
- Minimal text-like action that still behaves like a button -> `Button variant="tertiary"`
- Modal footer confirmation actions often use `size="large"` when the design is visually larger.

## Implementation notes

- Primary is the default emphasis and should be used for the main action.
- Secondary is for important but non-primary actions.
- Tertiary is for the lowest emphasis button treatment.
- `color` supports semantic accents such as `info`, `warning`, `success`, and `danger`.
- `loading` disables the button and replaces leading icon content with the loading indicator.
- `fullWidth` is the correct way to stretch the button to its container width.

## React examples

```tsx
import { Button } from '@onlyfyio/oui';

export function Example() {
  return <Button variant="primary">Save changes</Button>;
}
```

```tsx
import { Button, Icon, InfoIcon } from '@onlyfyio/oui';

export function Example() {
  return (
    <>
      <Button variant="primary">
        <Icon icon={InfoIcon} />
        Primary
      </Button>
      <Button variant="secondary">Secondary</Button>
      <Button variant="tertiary" color="danger">
        Delete
      </Button>
    </>
  );
}
```

```tsx
import { Button } from '@onlyfyio/oui';

export function Example() {
  return (
    <Button variant="primary" fullWidth loading>
      Saving...
    </Button>
  );
}
```

## Prefer over raw HTML when

- You would otherwise render a plain `<button>` for a styled action.
- The design calls for emphasis, semantic action color, loading state, or full-width button behavior.

## Avoid when

- The element should navigate like a hyperlink. Use `Link` instead.
- The control is icon-only. Use `IconButton` instead.

## Sources

- `packages/oui/src/components/Button/Button.mdx`
- `packages/oui/src/components/Button/tests/Button.stories.tsx`
