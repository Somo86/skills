# OUIProvider

## Use when

- An application needs to initialize OUI context, notifications, theming, or portal-aware components at the root.

## Figma mapping cues

- Not a visual Figma primitive. This is an app setup/provider component.

## Implementation notes

- Wrap your app or a subtree with `OUIProvider`.
- The docs show `ariaNotificationHeader` and `ariaNotificationAreaLabel` as required accessibility labels for notifications.
- A custom theme can be passed via the `theme` prop.

## React examples

```tsx
import { Button, OUIProvider } from '@onlyfyio/oui';

export function Example() {
  return (
    <OUIProvider
      ariaNotificationHeader="Notification"
      ariaNotificationAreaLabel="Notifications ({hotkey})"
    >
      <Button>Button</Button>
    </OUIProvider>
  );
}
```

## Prefer over raw HTML when

- You need OUI runtime setup rather than a visual component.

## Avoid when

- You are writing a leaf UI fragment and the app already has a provider above it.

## Sources

- `packages/oui/src/components/OUIProvider/docs/OUIProvider.stories.tsx`
