# Text

## Use when

- The design contains body copy, helper text, descriptive paragraphs, or labels that are not headings.

## Figma mapping cues

- Paragraphs or supporting copy -> `Text`
- Truncated content previews -> `Text` with `lineClamp`

## Implementation notes

- Use `Heading` for document structure and section titles; use `Text` for body content.
- `lineClamp` is the documented solution for multi-line truncation.
- The docs show `bold` as a standard emphasis prop.

## React examples

```tsx
import { Text } from '@onlyfyio/oui';

export function Example() {
  return <Text>Example text</Text>;
}
```

```tsx
import { Text } from '@onlyfyio/oui';

export function Example() {
  return <Text bold>Important supporting text</Text>;
}
```

```tsx
import { Text } from '@onlyfyio/oui';

export function Example() {
  return (
    <Text lineClamp={3}>
      Long descriptive content that should be truncated after a few lines in a
      card, list item, or compact preview.
    </Text>
  );
}
```

## Prefer over raw HTML when

- You would otherwise use styled `<p>`, `<span>`, or `<div>` text blocks for body copy.

## Avoid when

- The content is a semantic page heading. Use `Heading`.

## Sources

- `packages/oui/src/components/Text/Text.stories.mdx`
