# Input

## Use when

- The design contains a single-line text field.
- The field may need a leading icon, suffix content, clear action, or invalid state.

## Figma mapping cues

- Email, name, search, title, or short text field -> `Input`
- Leading icon inside text field -> `Input.Icon`
- Unit or trailing fixed content inside field -> `Input.Suffix`

## Implementation notes

- OUI `Input` is width `100%`; control width from a parent wrapper.
- The component supports controlled and uncontrolled patterns.
- In the docs, value changes are handled with `value` and `onValueChange`.
- Compose field adornments as children of `Input`.

## React examples

```tsx
import { Input } from '@onlyfyio/oui';

export function Example() {
  return <Input placeholder="Your name" />;
}
```

```tsx
import { Input, UserIcon } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ width: 260 }}>
      <Input placeholder="Profile name">
        <Input.Icon icon={UserIcon} position="start" />
        <Input.Suffix>%</Input.Suffix>
      </Input>
    </div>
  );
}
```

```tsx
import { Input } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [value, setValue] = useState('');

  return (
    <div style={{ width: 260 }}>
      <Input value={value} onValueChange={setValue} placeholder="Type here" />
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise use a styled `<input type="text">`.
- The design shows built-in adornments, invalid styling, disabled styling, or clearable behavior.

## Avoid when

- The field is multiline. Use `Textarea`.
- The field represents option picking rather than free text. Consider `Select`, `ComboBox`, or `MultiSelect`.

## Sources

- `packages/oui/src/components/Input/Input.stories.mdx`
