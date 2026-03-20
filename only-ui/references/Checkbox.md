# Checkbox

## Use when

- The design lets users toggle an independent yes/no option.
- Multiple options can be selected in the same group.

## Figma mapping cues

- Square selection box with optional mixed state -> `Checkbox`

## Implementation notes

- The docs support `checked`, `defaultChecked`, and `onCheckedChange`.
- OUI supports the `indeterminate` state in addition to `true` and `false`.
- Use `Checkbox` for multi-select patterns, not single-choice sets.

## React examples

```tsx
import { Checkbox } from '@onlyfyio/oui';

export function Example() {
  return <Checkbox defaultChecked={false} />;
}
```

```tsx
import { Checkbox } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [checked, setChecked] = useState<'indeterminate' | boolean>(
    'indeterminate',
  );

  return <Checkbox checked={checked} onCheckedChange={setChecked} />;
}
```

## Prefer over raw HTML when

- You would otherwise style a native checkbox or need an indeterminate state.

## Avoid when

- Only one option can be active. Use `RadioGroup`.
- The control is a binary setting toggle. Consider `Switch`.

## Sources

- `packages/oui/src/components/Checkbox/docs/Checkbox.stories.tsx`
