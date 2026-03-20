# Collapsible

## Use when

- The design shows optional inline content that can be revealed or hidden inside a section.

## Figma mapping cues

- “Show more” or expandable inline details region -> `Collapsible`

## Implementation notes

- Compose with `Collapsible.Trigger`, `Collapsible.Arrow`, and `Collapsible.Content`.
- The docs show it often nested inside a `Panel`.
- A trigger can be built with a text-style `Button`.

## React examples

```tsx
import { Button, Collapsible, Panel } from '@onlyfyio/oui';

export function Example() {
  return (
    <Panel style={{ width: 200 }}>
      <Panel.Content style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
        Some content
        <Collapsible open={false}>
          <Collapsible.Trigger>
            <Button variant="text">
              <Collapsible.Arrow />
              Show more
            </Button>
          </Collapsible.Trigger>
          <Collapsible.Content>
            Extra details go here.
          </Collapsible.Content>
        </Collapsible>
      </Panel.Content>
    </Panel>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build custom reveal/hide state and arrow behavior.

## Avoid when

- The pattern is a full accordion with multiple sibling items. Use `Accordion`.

## Sources

- `packages/oui/src/components/Collapsible/Collapsible.stories.tsx`
