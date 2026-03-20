# CardBase

## Use when

- The design needs a generic elevated card container without the stronger `Panel` structure.
- You want to compose a custom card layout inside a reusable OUI card shell.

## Figma mapping cues

- Elevated card surface with custom internal layout -> `CardBase`

## Implementation notes

- `CardBase` is a low-level card primitive that you compose with your own inner layout.
- The docs show `elevation` values `small`, `medium`, and `large`.
- It works well as a base for custom cards combining `Avatar`, `Heading`, and `Text`.

## React examples

```tsx
import { CardBase } from '@onlyfyio/oui';

export function Example() {
  return (
    <CardBase elevation="small">
      <div style={{ padding: 24 }}>Example Card</div>
    </CardBase>
  );
}
```

```tsx
import { Avatar, CardBase, Heading, Text } from '@onlyfyio/oui';

export function Example() {
  return (
    <CardBase elevation="medium">
      <div style={{ padding: 24, display: 'flex', gap: 16 }}>
        <Avatar size="large" alt="avatar alt text" src="/avatar.jpg" />
        <div>
          <Heading variant="heading5">Darlene Robertson</Heading>
          <Text>Marketing Manager</Text>
          <Text variant="bodySmall" color="secondary">
            Jan 2021 until today
          </Text>
        </div>
      </div>
    </CardBase>
  );
}
```

## Prefer over raw HTML when

- You would otherwise style a generic elevated card container yourself.

## Avoid when

- The design already matches the opinionated `Panel` structure with heading and actions.

## Sources

- `packages/oui/src/components/CardBase/CardBase.stories.tsx`
