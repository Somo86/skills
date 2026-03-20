# Badge

## Use when

- The design needs a small status or category label.
- A compact semantic color indicator should accompany text.

## Figma mapping cues

- Small pill label with semantic color -> `Badge`
- Badge with inline icon -> `Badge` plus `Badge.Icon`

## Implementation notes

- The docs show semantic `variant` values: `default`, `warning`, `success`, `error`, and `info`.
- `inverted` is available for alternate contrast treatment.
- The label is passed as children.

## React examples

```tsx
import { Badge } from '@onlyfyio/oui';

export function Example() {
  return <Badge variant="success">Published</Badge>;
}
```

```tsx
import { Badge, InfoIcon } from '@onlyfyio/oui';

export function Example() {
  return (
    <Badge variant="info" inverted>
      <Badge.Icon icon={InfoIcon} />
      Info
    </Badge>
  );
}
```

## Prefer over raw HTML when

- You would otherwise create a custom status pill or inline label.

## Avoid when

- The element is removable or behaves like a selected chip. Use `Tag`.

## Sources

- `packages/oui/src/components/Badge/docs/Badge.stories.tsx`
