# Modal

## Use when

- The design is a blocking overlay that requires immediate attention or action.
- The UI contains a dialog with title, body content, and footer actions.

## Figma mapping cues

- Centered overlay with dimmed backdrop -> `Modal`
- Dialog CTA row with confirm/cancel actions -> `Modal.Footer`, `Modal.Action`, `Modal.Cancel`
- Title and description inside overlay -> `Modal.Header`, `Modal.Title`, `Modal.Description`

## Implementation notes

- `Modal` supports both uncontrolled and controlled usage.
- Use `Modal.Trigger` when the modal is opened by an internal trigger element.
- Use `open` and `onOpenChange` for programmatic control.
- Wrap complex full-width content in an extra container so the modal content gap does not separate every child.
- If the modal has no visual header but still needs a close affordance, render an empty `Modal.Header`.

## React examples

```tsx
import { Button, Modal } from '@onlyfyio/oui';

export function Example() {
  return (
    <Modal>
      <Modal.Trigger>
        <Button variant="primary">Open Modal</Button>
      </Modal.Trigger>
      <Modal.Content>
        <Modal.Header>
          <Modal.Title>Title</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Modal.Description>
            Confirm this action before continuing.
          </Modal.Description>
        </Modal.Body>
        <Modal.Footer>
          <Modal.Cancel>Cancel</Modal.Cancel>
          <Modal.Action>Accept</Modal.Action>
        </Modal.Footer>
      </Modal.Content>
    </Modal>
  );
}
```

```tsx
import { Button, Modal } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [open, setOpen] = useState(false);

  return (
    <>
      <Button onClick={() => setOpen(true)}>Trigger outside Modal</Button>
      <Modal open={open} onOpenChange={setOpen}>
        <Modal.Content>
          <Modal.Header>
            <Modal.Title>Controlled modal</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Modal.Description>Controlled programmatically.</Modal.Description>
          </Modal.Body>
          <Modal.Footer>
            <Modal.Cancel>Cancel</Modal.Cancel>
            <Modal.Action>Accept</Modal.Action>
          </Modal.Footer>
        </Modal.Content>
      </Modal>
    </>
  );
}
```

## Prefer over raw HTML when

- You would otherwise hand-build a dialog, portal, overlay, title, close logic, and focus behavior.

## Avoid when

- The content is non-blocking or lightweight. Consider `Popover`, `Tooltip`, or `DropdownMenu`.

## Sources

- `packages/oui/src/components/Modal/Modal.stories.mdx`
