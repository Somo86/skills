# Link

## Use when

- The element should navigate to another page, route, or external resource.
- The design shows inline or standalone hyperlink styling.

## Figma mapping cues

- Text link with optional leading icon -> `Link`
- Navigation action that behaves like anchor navigation, not a button click -> `Link`

## Implementation notes

- `Link` takes regular anchor attributes plus OUI props.
- The docs show `size` variants: `small`, `medium`, and `large`.
- `Link.Icon` is the documented way to place an icon inside the link.
- If `target="_blank"` is used, OUI adds `rel="noopener"` by default.

## React examples

```tsx
import { Link } from '@onlyfyio/oui';

export function Example() {
  return <Link href="/settings">Settings</Link>;
}
```

```tsx
import { Link, XingJobsIcon } from '@onlyfyio/oui';

export function Example() {
  return (
    <Link href="https://example.com" target="_blank" size="medium">
      <Link.Icon icon={XingJobsIcon} />
      Documentation
    </Link>
  );
}
```

## Prefer over raw HTML when

- You would otherwise render a styled `<a>` element.

## Avoid when

- The interaction is an in-place action rather than navigation. Use `Button` or another action component.

## Sources

- `packages/oui/src/components/Link/Link.stories.mdx`
