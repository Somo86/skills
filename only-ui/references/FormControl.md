# FormControl

## Use when

- A field needs a label, error text, required state, disabled state, or invalid state.
- The design shows a form row that wraps an input plus supporting text.

## Figma mapping cues

- Labeled field with helper or error area -> `FormControl` around the field component

## Implementation notes

- `FormControl` is the field wrapper, not the input itself.
- Typical composition is `FormControl.Label + field component + FormControl.ErrorText`.
- Pass `required`, `invalid`, and `disabled` to the `FormControl` wrapper so the grouped field state stays consistent.
- Pair `FormControl.Label htmlFor` with the wrapped field `id`.

## React examples

```tsx
import { FormControl, Input } from '@onlyfyio/oui';

export function Example() {
  return (
    <FormControl required invalid>
      <FormControl.Label htmlFor="email">Email</FormControl.Label>
      <Input id="email" />
      <FormControl.ErrorText>Email is required</FormControl.ErrorText>
    </FormControl>
  );
}
```

```tsx
import { FormControl, Input } from '@onlyfyio/oui';

export function Example() {
  return (
    <FormControl disabled>
      <FormControl.Label htmlFor="company">Company</FormControl.Label>
      <Input id="company" />
      <FormControl.ErrorText>Disabled example</FormControl.ErrorText>
    </FormControl>
  );
}
```

## Prefer over ad hoc wrappers when

- You would otherwise manually align labels, inputs, and error text with custom markup.

## Avoid when

- The field has no label or validation framing and is intentionally standalone.

## Sources

- `packages/oui/src/components/FormControl/docs/FormControl.stories.tsx`
