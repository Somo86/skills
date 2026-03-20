# MultiSelect

## Use when

- The design allows users to select multiple values from a dropdown-style list.
- The picker may include filtering or grouped options.

## Figma mapping cues

- Multi-select dropdown with selected count or chips -> `MultiSelect`

## Implementation notes

- Compose as `MultiSelect -> Trigger -> Content`.
- The trigger commonly includes `MultiSelect.Placeholder`, `MultiSelect.Icon`, and `MultiSelect.Value`.
- Options are rendered with `MultiSelect.CheckboxItem`.
- The docs show optional search with `MultiSelect.SearchInput`.
- Use controlled values via `value` and `onValueChange`.

## React examples

```tsx
import { MultiSelect, StarIcon } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [selected, setSelected] = useState(['apple', 'banana']);

  return (
    <div style={{ width: 260 }}>
      <MultiSelect value={selected} onValueChange={setSelected}>
        <MultiSelect.Trigger>
          <MultiSelect.Placeholder>Please choose an option</MultiSelect.Placeholder>
          <MultiSelect.Icon icon={StarIcon} />
          <MultiSelect.Value /> selected
        </MultiSelect.Trigger>
        <MultiSelect.Content>
          <MultiSelect.CheckboxItem value="apple">Apple</MultiSelect.CheckboxItem>
          <MultiSelect.CheckboxItem value="banana">Banana</MultiSelect.CheckboxItem>
          <MultiSelect.CheckboxItem value="orange">Orange</MultiSelect.CheckboxItem>
        </MultiSelect.Content>
      </MultiSelect>
    </div>
  );
}
```

```tsx
import { MultiSelect } from '@onlyfyio/oui';
import { useState } from 'react';

const options = ['Apple', 'Banana', 'Orange'];

export function Example() {
  const [selected, setSelected] = useState<string[]>([]);
  const [query, setQuery] = useState('');

  return (
    <div style={{ width: 260 }}>
      <MultiSelect value={selected} onValueChange={setSelected}>
        <MultiSelect.Trigger>
          <MultiSelect.Placeholder>Select fruits</MultiSelect.Placeholder>
          <MultiSelect.Value /> selected
        </MultiSelect.Trigger>
        <MultiSelect.Content>
          <MultiSelect.SearchInput
            placeholder="Type to filter"
            onValueChange={setQuery}
          />
          {options
            .filter((label) => label.toLowerCase().includes(query.toLowerCase()))
            .map((label) => (
              <MultiSelect.CheckboxItem
                key={label}
                value={label.toLowerCase()}
              >
                {label}
              </MultiSelect.CheckboxItem>
            ))}
        </MultiSelect.Content>
      </MultiSelect>
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a custom multi-select dropdown with checkbox options.

## Avoid when

- Only one value may be selected. Use `Select`.

## Sources

- `packages/oui/src/components/MultiSelect/MultiSelect.stories.tsx`
