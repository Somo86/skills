# DatePicker

## Use when

- The design shows a single date field with calendar selection.
- Users should be able to type or pick a date.

## Figma mapping cues

- Single date input with calendar affordance -> `DatePicker`

## Implementation notes

- The docs pair `DatePicker` with `FormControl`.
- It supports controlled `value` / `onValueChange` and open-state control with `open` / `onOpenChange`.
- `min` and `max` are documented bounds.
- `onClear` is available when the date should be reset.

## React examples

```tsx
import { DatePicker, FormControl } from '@onlyfyio/oui';

export function Example() {
  return (
    <FormControl style={{ width: 250 }}>
      <FormControl.Label>Date</FormControl.Label>
      <DatePicker />
      <FormControl.ErrorText>Invalid date</FormControl.ErrorText>
    </FormControl>
  );
}
```

```tsx
import { DatePicker, FormControl } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [value, setValue] = useState('');
  const [open, setOpen] = useState(false);

  return (
    <FormControl style={{ width: 250 }}>
      <FormControl.Label>Date</FormControl.Label>
      <DatePicker
        value={value}
        onValueChange={setValue}
        open={open}
        onOpenChange={setOpen}
      />
      <FormControl.ErrorText>Invalid date</FormControl.ErrorText>
    </FormControl>
  );
}
```

## Prefer over raw HTML when

- You would otherwise combine a text input and calendar picker manually.

## Avoid when

- The design requires a date range. Use `DateRangePicker`.

## Sources

- `packages/oui/src/components/DatePicker/DatePicker.stories.mdx`
