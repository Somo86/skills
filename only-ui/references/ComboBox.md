# ComboBox

## Use when

- The design needs free-form text input with suggestion options.
- Users can type arbitrary text but should get autocomplete help.

## Figma mapping cues

- Search-like input with suggestion dropdown -> `ComboBox`

## Implementation notes

- `ComboBox` combines `Input`-like editing with a suggestion list.
- Compose placeholder and icons with `ComboBox.Placeholder` and `ComboBox.Icon`.
- Options render inside `ComboBox.Content` using `ComboBox.Option`.
- `ComboBox.NoResultsMessage` handles empty search results.
- `allowFreeText` is a documented mode.
- The docs show async search support with `useComboboxSearch` plus loading, failure, and min-character messages.

## React examples

```tsx
import { ComboBox, SearchIcon } from '@onlyfyio/oui';
import { useState } from 'react';

const options = ['Banana', 'Apple', 'Mango', 'Pear'];

export function Example() {
  const [value, setValue] = useState('Banana');

  return (
    <div style={{ width: 250 }}>
      <ComboBox value={value} onValueChange={setValue}>
        <ComboBox.Placeholder>Placeholder</ComboBox.Placeholder>
        <ComboBox.Icon icon={SearchIcon} position="start" />
        <ComboBox.Content>
          <ComboBox.NoResultsMessage>No results found</ComboBox.NoResultsMessage>
          {options.map((option) => (
            <ComboBox.Option key={option} value={option} />
          ))}
        </ComboBox.Content>
      </ComboBox>
    </div>
  );
}
```

```tsx
import { ArrowRightIcon, ComboBox, SearchIcon } from '@onlyfyio/oui';
import { useState } from 'react';

const options = ['Banana', 'Apple', 'Mango', 'Pear'];

export function Example() {
  const [value, setValue] = useState('');

  return (
    <div style={{ width: 250 }}>
      <ComboBox value={value} onValueChange={setValue}>
        <ComboBox.Icon icon={SearchIcon} position="start" />
        <ComboBox.Content>
          <ComboBox.NoResultsMessage>No results found</ComboBox.NoResultsMessage>
          {options.map((option) => (
            <ComboBox.Option key={option} value={option}>
              <ComboBox.Icon icon={ArrowRightIcon} position="start" />
              <ComboBox.MatchingOptionText value={option} />
            </ComboBox.Option>
          ))}
        </ComboBox.Content>
      </ComboBox>
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise combine an input, autocomplete list, filtering logic, and keyboard navigation yourself.

## Avoid when

- The user must choose exactly one predefined option with no free text. Use `Select`.

## Sources

- `packages/oui/src/components/ComboBox/ComboBox.stories.mdx`
