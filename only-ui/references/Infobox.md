# Infobox

## Use when

- The design shows a short, important inline message that should attract attention without interrupting the task.

## Figma mapping cues

- Highlighted message box with heading, text, and optional action -> `Infobox`

## Implementation notes

- Compose with `Infobox.Heading`, `Infobox.Content`, `Infobox.Button`, and `Infobox.Link`.
- The docs show `variant` such as `info`, `warning`, `success`, and `danger`.
- `size="short"` is used for compact infobox layouts.

## React examples

```tsx
import { Infobox } from '@onlyfyio/oui';

export function Example() {
  return (
    <Infobox variant="warning">
      <Infobox.Content>This is a description.</Infobox.Content>
    </Infobox>
  );
}
```

```tsx
import { AddIcon, Icon, Infobox } from '@onlyfyio/oui';

export function Example() {
  return (
    <Infobox variant="danger" size="default">
      <Infobox.Heading>Heading</Infobox.Heading>
      <Infobox.Content>Important information for the user.</Infobox.Content>
      <Infobox.Button>
        <Icon icon={AddIcon} />
        Action
      </Infobox.Button>
    </Infobox>
  );
}
```

## Prefer over raw HTML when

- You would otherwise create a custom highlighted info block with semantic variants.

## Avoid when

- The message should behave like a banner or toast notification.

## Sources

- `packages/oui/src/components/Infobox/Infobox.stories.tsx`
