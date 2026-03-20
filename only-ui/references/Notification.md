# Notification

## Use when

- The design shows a temporary toast-like message that can appear and disappear.
- Feedback should be non-blocking and layered above the page.

## Figma mapping cues

- Floating feedback toast with title and description -> `Notification`

## Implementation notes

- Compose content with `Notification.Title` and `Notification.Description`.
- The docs show both controlled and uncontrolled open state via `open`, `defaultOpen`, and `onOpenChange`.
- `duration` controls auto-dismiss timing.
- `variant` controls semantic tone.

## React examples

```tsx
import { Button, Notification } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [open, setOpen] = useState(false);

  return (
    <>
      <Button onClick={() => setOpen((value) => !value)}>
        Toggle Notification
      </Button>
      <Notification
        open={open}
        onOpenChange={setOpen}
        closeLabel="Close"
        variant="info"
        duration={5000}
      >
        <Notification.Title>Hello World</Notification.Title>
        <Notification.Description>Description</Notification.Description>
      </Notification>
    </>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a custom toast with visibility state and semantic styling.

## Avoid when

- The message should stay embedded in the page layout. Use `Banner`.

## Sources

- `packages/oui/src/components/Notification/docs/Notification.stories.tsx`
