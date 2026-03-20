# TagInput

## Use when

- The design lets users add multiple selected tags from suggestions.
- Selected items should appear as removable interactive tags.

## Figma mapping cues

- Input that turns selected values into chips/tags -> `TagInput`

## Implementation notes

- `TagInput` is composed from `TagInput.InteractiveTags` and `TagInput.ComboBox`.
- `TagInput.ComboBox` is similar to `ComboBox`, but `value`, `defaultValue`, `onValueChange`, `allowFreeText`, and `disabled` are managed by `TagInput`.
- Use `TagInput.Option` for suggestions.
- Async loading is supported with `useTagInputSearch`, `query`, `onQueryChange`, and status-specific message components.

## React examples

```tsx
import { CirclePlusIcon, TagInput } from '@onlyfyio/oui';

const options = ['Banana', 'Apple', 'Mango'];

export function Example() {
  return (
    <div style={{ width: 250 }}>
      <TagInput defaultValue={['Banana']}>
        <TagInput.InteractiveTags />
        <TagInput.ComboBox>
          <TagInput.Icon icon={CirclePlusIcon} position="start" />
          <TagInput.Placeholder>Placeholder</TagInput.Placeholder>
          <TagInput.NoResultsMessage>No results found</TagInput.NoResultsMessage>
          {options.map((option) => (
            <TagInput.Option key={option} value={option} />
          ))}
        </TagInput.ComboBox>
      </TagInput>
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a chips input, removal actions, and suggestion dropdown by hand.

## Avoid when

- Only one value should be selected. Use `ComboBox` or `Select`.

## Sources

- `packages/oui/src/components/TagInput/TagInput.stories.mdx`
