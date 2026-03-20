# DateRangePicker

## Use when

- The design collects a start and end date as one coordinated range control.

## Figma mapping cues

- Two adjacent date fields representing a start/end range -> `DateRangePicker`

## Implementation notes

- Compose with `DateRangePicker.StartDateInput` and `DateRangePicker.EndDateInput`.
- The docs pair each input with its own `FormControl` label and error text.
- Treat the range picker as the parent wrapper for both fields.

## React examples

```tsx
import { DateRangePicker, FormControl } from '@onlyfyio/oui';

export function Example() {
  return (
    <DateRangePicker>
      <div
        style={{
          width: 500,
          display: 'grid',
          gridTemplateColumns: '1fr 1fr',
          gap: 8,
        }}
      >
        <FormControl>
          <FormControl.Label>Start date</FormControl.Label>
          <DateRangePicker.StartDateInput />
          <FormControl.ErrorText>Invalid date</FormControl.ErrorText>
        </FormControl>
        <FormControl>
          <FormControl.Label>End date</FormControl.Label>
          <DateRangePicker.EndDateInput />
          <FormControl.ErrorText>Invalid date</FormControl.ErrorText>
        </FormControl>
      </div>
    </DateRangePicker>
  );
}
```

## Prefer over raw HTML when

- You would otherwise stitch together two date fields and range coordination logic yourself.

## Avoid when

- Only one date is needed. Use `DatePicker`.

## Sources

- `packages/oui/src/components/DateRangePicker/DateRangePicker.stories.mdx`
