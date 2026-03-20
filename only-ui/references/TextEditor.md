# TextEditor

## Use when

- The design requires rich-text editing rather than plain text.

## Figma mapping cues

- Rich text field with formatting toolbar -> `TextEditor`

## Implementation notes

- Basic usage can be as simple as `<TextEditor />`.
- More advanced composition includes `TextEditor.Menu`, `TextEditor.TextArea`, `TextEditor.Separator`, and `TextEditor.Content`.
- `TextEditor.Provider` enables `TextEditor.Counter`.
- `useTextEditor()` exposes helpers like `insert`.
- The docs show integration with `FormControl` for labeling and validation.

## React examples

```tsx
import { TextEditor } from '@onlyfyio/oui';

export function Example() {
  return <TextEditor />;
}
```

```tsx
import { FormControl, TextEditor } from '@onlyfyio/oui';

export function Example() {
  return (
    <TextEditor.Provider>
      <FormControl>
        <FormControl.Label>Label</FormControl.Label>
        <TextEditor characterLimit={20} />
        <div style={{ display: 'flex', alignItems: 'center' }}>
          <FormControl.ErrorText>Error message</FormControl.ErrorText>
          <TextEditor.Counter />
        </div>
      </FormControl>
    </TextEditor.Provider>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a rich text toolbar, editable area, and formatting commands manually.

## Avoid when

- Plain text is enough. Use `Textarea` or `Input`.

## Sources

- `packages/oui/src/components/TextEditor/TextEditor.stories.mdx`
