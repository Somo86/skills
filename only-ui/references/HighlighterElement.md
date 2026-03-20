# HighlighterElement

## Use when

- The design highlights specific words or short inline phrases with a decorative marker.

## Figma mapping cues

- Highlight stroke directly under/around inline text -> `HighlighterElement`

## Implementation notes

- Wrap the highlighted text as children of `HighlighterElement`.
- Customize with `illustration`, `color`, `degree`, `mirror`, `scale`, and `fit`.
- The docs show multiple `HighlighterElement` instances within one text block.

## React examples

```tsx
import { HighlighterElement, XLarge4Highlighter } from '@onlyfyio/oui';

export function Example() {
  return (
    <p>
      This text has a{' '}
      <HighlighterElement illustration={XLarge4Highlighter}>
        highlighted phrase
      </HighlighterElement>{' '}
      inside it.
    </p>
  );
}
```

```tsx
import {
  HighlighterElement,
  SmallHighlighter,
  XLarge4Highlighter,
} from '@onlyfyio/oui';

export function Example() {
  return (
    <p>
      You can use a{' '}
      <HighlighterElement illustration={XLarge4Highlighter}>
        HighlighterElement
      </HighlighterElement>{' '}
      more than once and also{' '}
      <HighlighterElement illustration={SmallHighlighter} fit="contain">
        emphasize
      </HighlighterElement>{' '}
      other words.
    </p>
  );
}
```

## Prefer over raw HTML when

- You would otherwise layer decorative background assets around inline text manually.

## Avoid when

- The decoration is standalone and not tied to inline text. Use `Highlighter`.

## Sources

- `packages/oui/src/components/HighlighterElement/HighlighterElement.stories.tsx`
