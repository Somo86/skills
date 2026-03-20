# Skeleton

## Use when

- The design shows loading placeholders that mimic future content shape.

## Figma mapping cues

- Gray loading placeholder bars, avatars, inputs, or buttons -> `Skeleton`

## Implementation notes

- Base primitive: `Skeleton` with explicit `width` and `height`.
- Specialized placeholders: `Skeleton.Avatar`, `Skeleton.Button`, `Skeleton.Heading`, `Skeleton.Text`, `Skeleton.Input`.
- Some skeleton variants support fixed width or min/max variable widths.
- The docs show composing several skeleton pieces into a full card placeholder.

## React examples

```tsx
import { Skeleton } from '@onlyfyio/oui';

export function Example() {
  return <Skeleton width={541} height={36} />;
}
```

```tsx
import { CardBase, Skeleton } from '@onlyfyio/oui';

export function Example() {
  return (
    <CardBase style={{ display: 'flex', gap: 16, padding: 24 }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
        <Skeleton width="18px" height="18px" />
        <Skeleton.Avatar size="large" />
      </div>
      <div style={{ display: 'flex', flexDirection: 'column', gap: 4 }}>
        <Skeleton.Heading variant="heading3" width="295px" />
        <Skeleton.Text variant="bodyLarge" width={236} />
        <Skeleton.Text variant="bodyMedium" width="194px" />
      </div>
    </CardBase>
  );
}
```

## Prefer over raw HTML when

- You would otherwise fake loading placeholders with ad hoc divs and background colors.

## Avoid when

- An indeterminate spinner communicates loading better. Use `LoadingIndicator`.

## Sources

- `packages/oui/src/components/Skeleton/Skeleton.stories.tsx`
