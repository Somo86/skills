# Accordion

## Use when

- The design groups collapsible sections of content.
- Users should expand or collapse one or more content blocks inline.

## Figma mapping cues

- Stacked disclosure rows with expandable bodies -> `Accordion`

## Implementation notes

- Compose as `Accordion -> Accordion.Item -> Accordion.Trigger + Accordion.Body + Accordion.Content`.
- The docs expose `multiple` to allow several items open at once.
- `defaultValue` can pre-open one or more items.
- `type` includes at least `outlined` in the documented examples.

## React examples

```tsx
import { Accordion } from '@onlyfyio/oui';

export function Example() {
  return (
    <Accordion multiple defaultValue={['item-1']}>
      <Accordion.Item value="item-1">
        <Accordion.Trigger>Trigger 1</Accordion.Trigger>
        <Accordion.Body>
          <Accordion.Content>Text content 1</Accordion.Content>
        </Accordion.Body>
      </Accordion.Item>
      <Accordion.Item value="item-2">
        <Accordion.Trigger>Trigger 2</Accordion.Trigger>
        <Accordion.Body>
          <Accordion.Content>Text content 2</Accordion.Content>
        </Accordion.Body>
      </Accordion.Item>
    </Accordion>
  );
}
```

## Prefer over raw HTML when

- You would otherwise hand-build disclosure rows, open state, and body toggling.

## Avoid when

- The content should all stay visible at once.

## Sources

- `packages/oui/src/components/Accordion/docs/Accordion.stories.tsx`
