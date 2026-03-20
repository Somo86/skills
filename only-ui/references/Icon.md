# Icon

## Use when

- The design requires one of the OUI icon glyphs inside buttons, links, badges, menus, or standalone decorative/status contexts.

## Figma mapping cues

- Small symbolic glyph from the design system -> `Icon`

## Implementation notes

- Pass the glyph via the `icon` prop, such as `AddIcon`.
- The docs show sizes `small`, `medium`, and `large`.
- Color can use theme token values.
- `Icon` is often composed inside other OUI components rather than used alone.

## React examples

```tsx
import { AddIcon, Icon } from '@onlyfyio/oui';

export function Example() {
  return <Icon icon={AddIcon} size="small" color="$colors$error6" />;
}
```

```tsx
import { AddIcon, Icon, Tooltip } from '@onlyfyio/oui';

export function Example() {
  return (
    <Tooltip>
      <Tooltip.Trigger>
        <Icon icon={AddIcon} color="$colors$error7" />
      </Tooltip.Trigger>
      <Tooltip.Content>my content</Tooltip.Content>
    </Tooltip>
  );
}
```

## Prefer over raw HTML when

- You would otherwise inline SVGs or build an ad hoc icon wrapper.

## Avoid when

- The interaction needs a clickable control. Wrap it in `IconButton`, `Button`, `Link`, or another interactive component.

## Sources

- `packages/oui/src/components/Icon/Icon.stories.tsx`
