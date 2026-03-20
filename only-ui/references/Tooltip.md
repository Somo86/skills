# Tooltip

## Use when

- The design shows a small informational hint on hover or focus.
- The content is short and supplemental.

## Figma mapping cues

- Small hover/focus hint bubble -> `Tooltip`

## Implementation notes

- Compose as `Tooltip -> Tooltip.Trigger -> Tooltip.Content`.
- `Tooltip.Trigger` itself is not accessible, so wrap a keyboard-accessible child such as a `Button` or `Link`.
- Use for lightweight explanatory content, not rich interactive panels.

## React examples

```tsx
import { Button, Tooltip } from '@onlyfyio/oui';

export function Example() {
  return (
    <Tooltip>
      <Tooltip.Trigger asChild>
        <Button variant="secondary">Hover me</Button>
      </Tooltip.Trigger>
      <Tooltip.Content>Tooltip content</Tooltip.Content>
    </Tooltip>
  );
}
```

## Prefer over raw HTML when

- You would otherwise hand-build a hover/focus info popup.

## Avoid when

- The overlay contains richer or interactive content. Use `Popover`.

## Sources

- `packages/oui/src/components/Tooltip/Tooltip.stories.mdx`
