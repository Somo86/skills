# Heading

## Use when

- The design contains titles, section headings, or content hierarchy markers.

## Figma mapping cues

- Page title, card title, section title, modal title, or grouped content title -> `Heading`

## Implementation notes

- `Heading` is the OUI typography primitive for structural headings.
- The docs expose heading variants rather than encouraging custom heading styles.
- Choose the variant that matches the hierarchy and scale of the design.

## React examples

```tsx
import { Heading } from '@onlyfyio/oui';

export function Example() {
  return <Heading>Example heading</Heading>;
}
```

```tsx
import { Heading } from '@onlyfyio/oui';

export function Example() {
  return (
    <>
      <Heading variant="headline">Page title</Heading>
      <Heading variant="sectionTitle">Section title</Heading>
    </>
  );
}
```

## Prefer over raw HTML when

- You would otherwise apply custom typography to `h1` through `h6`.

## Avoid when

- The content is paragraph or helper text. Use `Text`.

## Sources

- `packages/oui/src/components/Heading/Heading.stories.mdx`
