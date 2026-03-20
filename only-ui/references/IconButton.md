# IconButton

## Use when

- The design shows a button with only an icon and no visible text label.
- The action is compact, repeated, or secondary, such as close, edit, or remove.

## Figma mapping cues

- Icon-only circular or square action -> `IconButton`

## Implementation notes

- Always provide an accessible label such as `aria-label`.
- Variants include `primary`, `secondary`, `tertiary`, and `ghost`.
- The docs note that `type="button"` is the default, even inside forms.
- Put the icon inside the button with the `Icon` component.

## React examples

```tsx
import { CrossIcon, Icon, IconButton } from '@onlyfyio/oui';

export function Example() {
  return (
    <IconButton variant="secondary" aria-label="Close dialog">
      <Icon icon={CrossIcon} />
    </IconButton>
  );
}
```

```tsx
import { CrossIcon, Icon, IconButton } from '@onlyfyio/oui';

export function Example() {
  return (
    <>
      <IconButton variant="primary" aria-label="Primary action">
        <Icon icon={CrossIcon} />
      </IconButton>
      <IconButton variant="ghost" aria-label="Dismiss">
        <Icon icon={CrossIcon} size="large" />
      </IconButton>
    </>
  );
}
```

## Prefer over raw HTML when

- You would otherwise render a styled icon-only `<button>`.

## Avoid when

- The action needs a visible text label. Use `Button`.

## Sources

- `packages/oui/src/components/IconButton/IconButton.stories.mdx`
