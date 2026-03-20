# NonAccessiblePopover

## Use when

- You explicitly need hover-triggered rich content and accept that it is not accessible.

## Figma mapping cues

- Hover-only rich popover -> `NonAccessiblePopover`

## Implementation notes

- Compose as `NonAccessiblePopover -> Trigger -> Content`.
- The docs explicitly recommend using `Popover` instead when accessibility matters.
- Placement is controlled with `side`.

## React examples

```tsx
import { NonAccessiblePopover } from '@onlyfyio/oui';

export function Example() {
  return (
    <NonAccessiblePopover>
      <NonAccessiblePopover.Trigger asChild>
        <div style={{ margin: '30px 60px' }}>Here</div>
      </NonAccessiblePopover.Trigger>
      <NonAccessiblePopover.Content>
        NonAccessiblePopover content
      </NonAccessiblePopover.Content>
    </NonAccessiblePopover>
  );
}
```

## Prefer over raw HTML when

- You still want OUI’s hover popover behavior and styling despite the accessibility tradeoff.

## Avoid when

- The popover should be accessible. Use `Popover`.

## Sources

- `packages/oui/src/components/NonAccessiblePopover/NonAccessiblePopover.stories.mdx`
