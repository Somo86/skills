# SystemNotification

## Use when

- The design shows a prominent system-level notification with icon, title, and description.
- The message is toast-like but visually stronger than a regular notification.

## Figma mapping cues

- Floating system alert with semantic icon and title -> `SystemNotification`

## Implementation notes

- Compose content with `SystemNotification.Title` and `SystemNotification.Description`.
- The docs pass an explicit `icon` prop such as `AlertIcon`.
- Open state follows the same controlled/uncontrolled pattern with `open`, `defaultOpen`, and `onOpenChange`.

## React examples

```tsx
import { AlertIcon, Button, SystemNotification } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [open, setOpen] = useState(false);

  return (
    <>
      <Button onClick={() => setOpen((value) => !value)}>
        Toggle Notification
      </Button>
      <SystemNotification
        open={open}
        onOpenChange={setOpen}
        icon={AlertIcon}
        closeLabel="Close"
        variant="info"
      >
        <SystemNotification.Title>Hello World</SystemNotification.Title>
        <SystemNotification.Description>
          Description
        </SystemNotification.Description>
      </SystemNotification>
    </>
  );
}
```

## Prefer over raw HTML when

- You would otherwise create a bespoke system alert toast with iconography and dismissal behavior.

## Avoid when

- The message is a small local toast without the stronger system-notification treatment. Use `Notification`.

## Sources

- `packages/oui/src/components/SystemNotification/docs/SystemNotification.stories.tsx`
