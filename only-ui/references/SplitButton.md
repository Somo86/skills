# SplitButton

## Use when

- The design combines one primary action with a dropdown of secondary actions.

## Figma mapping cues

- Main CTA plus adjacent chevron/options menu -> `SplitButton`

## Implementation notes

- Compose with `SplitButton.Action` and `SplitButton.Dropdown`.
- Secondary actions live inside the dropdown as `SplitButton.Item`.
- Use `SplitButton.Separator` to group menu items.
- The docs show `variant` and `disabled` on the root component.

## React examples

```tsx
import { SplitButton } from '@onlyfyio/oui';

export function Example() {
  return (
    <SplitButton variant="tertiary">
      <SplitButton.Action>Main Action</SplitButton.Action>
      <SplitButton.Dropdown aria-label="More options">
        <SplitButton.Item>Other Action 1</SplitButton.Item>
        <SplitButton.Item>Other Action 2</SplitButton.Item>
        <SplitButton.Separator />
        <SplitButton.Item>Other Action 3</SplitButton.Item>
      </SplitButton.Dropdown>
    </SplitButton>
  );
}
```

## Prefer over raw HTML when

- You would otherwise combine a button and action menu manually.

## Avoid when

- There is only one action. Use `Button`.

## Sources

- `packages/oui/src/components/SplitButton/docs/SplitButton.stories.tsx`
