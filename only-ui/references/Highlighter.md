# Highlighter

## Use when

- The design needs a free-floating decorative highlighter shape behind or around content.

## Figma mapping cues

- Scribble/highlighter background accent -> `Highlighter`

## Implementation notes

- Pass a specific highlighter asset via `illustration`.
- Customize with `degree`, `mirror`, `scale`, and optional `color`.
- The docs show using it both behind and in front of text with layered positioning.

## React examples

```tsx
import { Highlighter, Large2Highlighter } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ width: 200, height: 200 }}>
      <Highlighter illustration={Large2Highlighter} degree={80} mirror />
    </div>
  );
}
```

```tsx
import { Highlighter, Large2Highlighter } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ position: 'relative', width: 200, height: 200 }}>
      <div style={{ position: 'relative', zIndex: 1, textAlign: 'center' }}>
        Text to be in front
      </div>
      <Highlighter
        illustration={Large2Highlighter}
        style={{ position: 'absolute', zIndex: 0 }}
      />
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise place decorative SVG highlight shapes manually.

## Avoid when

- The effect should wrap actual text inline. Use `HighlighterElement`.

## Sources

- `packages/oui/src/components/Highlighter/Highlighter.stories.tsx`
