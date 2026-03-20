# Panel

## Use when

- The design shows a bordered or elevated content container.
- The container may have a heading row and action buttons.

## Figma mapping cues

- Card-like container with content and optional header actions -> `Panel`

## Implementation notes

- Compose simple content as `Panel -> Panel.Content`.
- Add `Panel.Header` and `Panel.Heading` when the panel has a title row.
- The docs show action buttons inside the header.
- `elevation` controls the shadow strength with values such as `default`, `small`, `medium`, and `large`.

## React examples

```tsx
import { Panel } from '@onlyfyio/oui';

export function Example() {
  return (
    <Panel>
      <Panel.Content>Basic panel</Panel.Content>
    </Panel>
  );
}
```

```tsx
import { Button, Panel } from '@onlyfyio/oui';

export function Example() {
  return (
    <Panel elevation="medium">
      <Panel.Header>
        <Panel.Heading>Heading</Panel.Heading>
        <Button variant="secondary">Edit</Button>
        <Button variant="tertiary">More</Button>
      </Panel.Header>
      <Panel.Content>Panel with header containing buttons</Panel.Content>
    </Panel>
  );
}
```

## Prefer over raw HTML when

- You would otherwise create a custom card or boxed panel with consistent OUI spacing and elevation.

## Avoid when

- The design is specifically a data table, modal, or accordion section.

## Sources

- `packages/oui/src/components/Panel/Panel.stories.tsx`
