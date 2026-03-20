# TimePicker

## Use when

- The design shows a time-only input.

## Figma mapping cues

- Time field like `09:30` or `--:--` -> `TimePicker`

## Implementation notes

- The docs wrap `TimePicker` in a width-constrained container.
- If both `value` and `defaultValue` are `undefined`, it initializes with the current time.
- To force an empty initial state, set `value` or `defaultValue` to `''`.

## React examples

```tsx
import { TimePicker } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ width: 260 }}>
      <TimePicker defaultValue="" />
    </div>
  );
}
```

```tsx
import { TimePicker } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [value, setValue] = useState('');

  return (
    <div style={{ width: 260 }}>
      <TimePicker value={value} onValueChange={setValue} />
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a styled time input with custom empty-state behavior.

## Avoid when

- The field should collect a full date or date range.

## Sources

- `packages/oui/src/components/TimePicker/TimePicker.stories.mdx`
