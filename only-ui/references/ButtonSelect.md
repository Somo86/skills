# ButtonSelect

## Use when

- The design shows a button-like trigger that opens a single-select menu.
- The selected value should feel more like an action button than a form field.

## Figma mapping cues

- CTA-style dropdown button with one selected option -> `ButtonSelect`

## Implementation notes

- Compose with `ButtonSelect.Placeholder`, `ButtonSelect.Content`, and `ButtonSelect.Option`.
- `ButtonSelect.Icon` is supported only at `position="start"`.
- Group items with `ButtonSelect.Group`, `ButtonSelect.GroupLabel`, and `ButtonSelect.Separator`.
- If options include extra content, wrap the text in `ButtonSelect.OptionText` so trigger truncation works correctly.
- Supports controlled and uncontrolled usage.

## React examples

```tsx
import { ButtonSelect } from '@onlyfyio/oui';

export function Example() {
  return (
    <ButtonSelect defaultValue="tutti-frutti">
      <ButtonSelect.Placeholder>Placeholder</ButtonSelect.Placeholder>
      <ButtonSelect.Content>
        <ButtonSelect.Option value="tutti-frutti">Tutti Frutti</ButtonSelect.Option>
        <ButtonSelect.Option value="apple">Apple</ButtonSelect.Option>
        <ButtonSelect.Option value="banana">Banana</ButtonSelect.Option>
      </ButtonSelect.Content>
    </ButtonSelect>
  );
}
```

```tsx
import { ArrowUpIcon, ButtonSelect, Icon, StarIcon } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ width: 260 }}>
      <ButtonSelect defaultValue="up">
        <ButtonSelect.Icon icon={StarIcon} position="start" />
        <ButtonSelect.Placeholder>Placeholder</ButtonSelect.Placeholder>
        <ButtonSelect.Content>
          <ButtonSelect.Option value="up">
            <Icon icon={ArrowUpIcon} />
            <ButtonSelect.OptionText>Arrow pointing up</ButtonSelect.OptionText>
          </ButtonSelect.Option>
        </ButtonSelect.Content>
      </ButtonSelect>
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise combine a styled button and single-select dropdown manually.

## Avoid when

- The control should behave like a standard form select. Use `Select`.

## Sources

- `packages/oui/src/components/ButtonSelect/ButtonSelect.mdx`
- `packages/oui/src/components/ButtonSelect/tests/ButtonSelect.stories.tsx`
