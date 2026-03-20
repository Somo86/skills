# RadioGroup

## Use when

- The design presents a single-choice set of mutually exclusive options.

## Figma mapping cues

- Vertical or horizontal list of circular single-select choices -> `RadioGroup`

## Implementation notes

- Compose options as `RadioGroup.Item` with matching `RadioGroup.Item.Label`.
- The docs show an uncontrolled pattern with `defaultValue`.
- Pass `disabled` or `invalid` to the group when the full control shares the same state.

## React examples

```tsx
import { RadioGroup } from '@onlyfyio/oui';

export function Example() {
  const exampleId = 'plan';

  return (
    <RadioGroup defaultValue="pro">
      <RadioGroup.Item id={`${exampleId}-basic`} value="basic">
        <RadioGroup.Item.Label htmlFor={`${exampleId}-basic`}>
          Basic
        </RadioGroup.Item.Label>
      </RadioGroup.Item>
      <RadioGroup.Item id={`${exampleId}-pro`} value="pro">
        <RadioGroup.Item.Label htmlFor={`${exampleId}-pro`}>
          Pro
        </RadioGroup.Item.Label>
      </RadioGroup.Item>
    </RadioGroup>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a styled radio button set by hand.

## Avoid when

- More than one choice may be active. Use `Checkbox`.

## Sources

- `packages/oui/src/components/RadioGroup/docs/RadioGroup.stories.tsx`
