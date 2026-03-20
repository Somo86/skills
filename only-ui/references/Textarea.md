# Textarea

## Use when

- The design contains a multiline free-text field.
- The user is expected to type comments, notes, descriptions, or message bodies.

## Figma mapping cues

- Large text input area with multiple lines -> `Textarea`

## Implementation notes

- `Textarea` is documented as a controlled multiline input.
- The examples wire `onChange` and keep the current value in local state.
- `invalid`, `disabled`, and `resize` are documented states.
- The component also reports `onValueChange` in addition to the raw `onChange`.

## React examples

```tsx
import { Textarea } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [value, setValue] = useState('');

  return (
    <div style={{ width: 500 }}>
      <Textarea
        value={value}
        onChange={(event) => setValue(event.target.value)}
        placeholder="Fill me!"
      />
    </div>
  );
}
```

```tsx
import { Textarea } from '@onlyfyio/oui';

export function Example() {
  return <Textarea disabled value="Read only example" resize={false} />;
}
```

## Prefer over raw HTML when

- You would otherwise use a styled `<textarea>`.

## Avoid when

- The field is single-line. Use `Input`.

## Sources

- `packages/oui/src/components/Textarea/Textarea.stories.mdx`
