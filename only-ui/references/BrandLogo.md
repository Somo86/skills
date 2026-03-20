# BrandLogo

## Use when

- The design shows the primary Onlyfy/brand mark.
- A branded header, endorsement, or minimized logo treatment is needed.

## Figma mapping cues

- Company or platform brand mark -> `BrandLogo`

## Implementation notes

- The docs show variants such as `endorsement`, `endorsement_wide`, `minimized`, `simple`, `secondary_endorsement`, and `appheader`.
- `color` supports `default` and `inverted`.
- Use the existing variants rather than recreating branded SVG treatments manually.

## React examples

```tsx
import { BrandLogo } from '@onlyfyio/oui';

export function Example() {
  return <BrandLogo variant="endorsement" color="default" />;
}
```

```tsx
import { BrandLogo } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ background: '#333', padding: 10 }}>
      <BrandLogo variant="appheader" color="inverted" />
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise embed or style brand SVG assets directly.

## Avoid when

- The design needs a product-specific logo. Use `ProductLogo`.

## Sources

- `packages/oui/src/components/BrandLogo/BrandLogo.stories.tsx`
