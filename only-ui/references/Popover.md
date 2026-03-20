# Popover

## Use when

- The design shows lightweight contextual content anchored to a trigger.
- The overlay is richer than a tooltip but not modal.

## Figma mapping cues

- Small floating panel attached to a button or trigger -> `Popover`

## Implementation notes

- Compose as `Popover -> Popover.Trigger -> Popover.Content`.
- The docs use `Popover.Trigger asChild` to wrap a `Button`.
- Placement is controlled with `side`, including `left`, `right`, `top`, and `bottom`.
- Use for non-blocking contextual UI.

## React examples

```tsx
import { Button, Popover } from '@onlyfyio/oui';

export function Example() {
  return (
    <Popover>
      <Popover.Trigger asChild>
        <Button>Click me</Button>
      </Popover.Trigger>
      <Popover.Content>Popover content</Popover.Content>
    </Popover>
  );
}
```

```tsx
import { Button, Popover } from '@onlyfyio/oui';

export function Example() {
  return (
    <Popover open side="right">
      <Popover.Trigger asChild>
        <Button>Details</Button>
      </Popover.Trigger>
      <Popover.Content>Right-aligned content</Popover.Content>
    </Popover>
  );
}
```

## Prefer over raw HTML when

- You would otherwise hand-build an anchored floating panel.

## Avoid when

- The overlay should block the page. Use `Modal`.
- The overlay is simple text-only hinting. Consider `Tooltip`.

## Sources

- `packages/oui/src/components/Popover/Popover.stories.mdx`
