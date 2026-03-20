# Avatar

## Use when

- The design displays a person or company identity thumbnail.
- The UI needs online or offline presence status.

## Figma mapping cues

- Circular profile image or company logo placeholder -> `Avatar`
- Small status dot on the avatar -> `Avatar.Badge`

## Implementation notes

- The docs show `variant="person"` and `variant="company"`.
- Sizes include `xSmall`, `small`, `medium`, `large`, and `xLarge`.
- `src` is optional; OUI handles avatar rendering even without an image.
- Status is composed with `Avatar.Badge status="online"` or `status="offline"`.

## React examples

```tsx
import { Avatar } from '@onlyfyio/oui';

export function Example() {
  return <Avatar alt="Profile picture" size="large" variant="person" />;
}
```

```tsx
import { Avatar } from '@onlyfyio/oui';

export function Example() {
  return (
    <Avatar
      alt="Company logo"
      size="large"
      variant="company"
      src="/company-logo.png"
    >
      <Avatar.Badge status="online" />
    </Avatar>
  );
}
```

## Prefer over raw HTML when

- You would otherwise implement image fallback, sizing, status badge, and avatar variants manually.

## Avoid when

- The design needs a large illustration or hero image instead of an identity thumbnail.

## Sources

- `packages/oui/src/components/Avatar/Avatar.stories.tsx`
