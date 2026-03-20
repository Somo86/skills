# ProductLogo

## Use when

- The design shows a product-specific logo lockup rather than the general brand logo.

## Figma mapping cues

- Product-area logo graphic -> `ProductLogo`

## Implementation notes

- The docs show a width-constrained usage.
- `color` supports at least `default`, and is intended to adapt to light or dark backgrounds.

## React examples

```tsx
import { ProductLogo } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ width: 250 }}>
      <ProductLogo color="default" />
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise use product SVG assets directly.

## Avoid when

- The design is for the overall platform/company logo. Use `BrandLogo`.

## Sources

- `packages/oui/src/components/ProductLogo/ProductLogo.stories.tsx`
