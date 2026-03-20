# Switch

## Use when

- The design shows an immediate on/off toggle for a setting.

## Figma mapping cues

- Pill-shaped binary toggle -> `Switch`

## Implementation notes

- The documented states are `checked` and `disabled`.
- Use it for setting toggles, not for option lists or confirmation checkboxes.

## React examples

```tsx
import { Switch } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [checked, setChecked] = useState(true);

  return <Switch checked={checked} onCheckedChange={setChecked} />;
}
```

```tsx
import { Switch } from '@onlyfyio/oui';

export function Example() {
  return <Switch checked={false} disabled />;
}
```

## Prefer over raw HTML when

- You would otherwise style a toggle switch or need OUI-consistent switch visuals.

## Avoid when

- The choice is part of a checklist. Use `Checkbox`.

## Sources

- `packages/oui/src/components/Switch/docs/Switch.stories.tsx`
