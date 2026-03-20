# ColorPicker

## Use when

- The design lets users pick a color value.

## Figma mapping cues

- Color swatch chooser or color input -> `ColorPicker`

## Implementation notes

- Supports controlled mode with `value` and `onValueChange`.
- The docs show the selected color often displayed alongside the picker.

## React examples

```tsx
import { ColorPicker } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [color, setColor] = useState('#00ff00');

  return (
    <div>
      <p>Selected color: {color}</p>
      <ColorPicker value={color} onValueChange={(value) => setColor(value ?? '')} />
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise style a color input and synchronization logic yourself.

## Avoid when

- The design only displays a fixed color swatch and has no editing.

## Sources

- `packages/oui/src/components/ColorPicker/docs/ColorPicker.stories.tsx`
