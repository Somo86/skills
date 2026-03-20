# ToggleGroup

## Use when

- The design groups several mutually related toggle options in one control.

## Figma mapping cues

- Segmented control or grouped icon/text toggle buttons -> `ToggleGroup`

## Implementation notes

- Compose with repeated `ToggleGroup.Item` children.
- Add icons with `ToggleGroup.Icon`.
- The docs show both icon-only and icon-plus-label versions.
- `defaultValue` sets the initially pressed item.
- Individual items can be `disabled`.

## React examples

```tsx
import {
  DesktopIcon,
  Icon,
  MobileIcon,
  StructureIcon,
  ToggleGroup,
} from '@onlyfyio/oui';

export function Example() {
  return (
    <ToggleGroup defaultValue="structure">
      <ToggleGroup.Item value="desktop" disabled>
        <ToggleGroup.Icon icon={DesktopIcon} />
        Desktop
      </ToggleGroup.Item>
      <ToggleGroup.Item value="mobile">
        <ToggleGroup.Icon icon={MobileIcon} />
        Mobile
      </ToggleGroup.Item>
      <ToggleGroup.Item value="structure">
        <ToggleGroup.Icon icon={StructureIcon} />
        Structure
      </ToggleGroup.Item>
    </ToggleGroup>
  );
}
```

## Prefer over raw HTML when

- You would otherwise implement a segmented control with roving focus and pressed-state behavior yourself.

## Avoid when

- The content is a tabbed panel switch with separate content sections. Use `Tabs` or `SecondLevelTabs`.

## Sources

- `packages/oui/src/components/ToggleGroup/ToggleGroup.stories.mdx`
