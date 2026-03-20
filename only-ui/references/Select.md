# Select

## Use when

- The design shows a closed trigger that opens a dropdown list with one selected value.
- The user must pick one option from a constrained list.

## Figma mapping cues

- Single-select dropdown -> `Select`
- Trigger with leading icon -> `Select.Icon`
- Placeholder inside closed trigger -> `Select.Placeholder`
- Grouped menu sections -> `Select.Group`, `Select.GroupLabel`, `Select.Separator`

## Implementation notes

- OUI `Select` supports controlled and uncontrolled usage.
- The basic structure is `Select -> Select.Trigger -> Select.Content -> Select.Option`.
- When options include icons or custom content, wrap the text in `Select.OptionText` so truncation in the trigger remains correct.
- In controlled mode, clear the current value with an empty string `''`.

## React examples

```tsx
import { Select, StarIcon } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ width: 260 }}>
      <Select defaultValue="tutti-frutti">
        <Select.Trigger>
          <Select.Icon icon={StarIcon} />
          <Select.Placeholder>Placeholder</Select.Placeholder>
        </Select.Trigger>
        <Select.Content>
          <Select.Option value="tutti-frutti">Tutti Frutti</Select.Option>
          <Select.Option value="apple">Apple</Select.Option>
          <Select.Option value="banana">Banana</Select.Option>
        </Select.Content>
      </Select>
    </div>
  );
}
```

```tsx
import { Icon, Select, ArrowUpIcon } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ width: 260 }}>
      <Select defaultValue="up">
        <Select.Trigger>
          <Select.Placeholder>Direction</Select.Placeholder>
        </Select.Trigger>
        <Select.Content>
          <Select.Option value="up">
            <Icon icon={ArrowUpIcon} />
            <Select.OptionText>Arrow pointing up</Select.OptionText>
          </Select.Option>
        </Select.Content>
      </Select>
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a custom styled dropdown or native `<select>` with richer presentation.

## Avoid when

- Users should type and filter arbitrary text. Consider `ComboBox`.
- Users should pick multiple values. Use `MultiSelect`.

## Sources

- `packages/oui/src/components/Select/Select.stories.mdx`
