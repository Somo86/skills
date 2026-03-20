# AvatarShape

## Use when

- The design needs an avatar-shaped frame for custom image, initials, or icon content.

## Figma mapping cues

- Avatar silhouette or circular frame that should contain arbitrary content -> `AvatarShape`

## Implementation notes

- `AvatarShape` wraps arbitrary children.
- The docs show image, initials text, and icon content variants.
- Sizes include `xSmall`, `small`, `medium`, `large`, and `xLarge`.

## React examples

```tsx
import { AvatarShape } from '@onlyfyio/oui';

export function Example() {
  return (
    <AvatarShape size="large">
      <img width={200} height={200} src="/avatar.jpg" />
    </AvatarShape>
  );
}
```

```tsx
import { AvatarShape, Icon, UserIcon } from '@onlyfyio/oui';

export function Example() {
  return (
    <AvatarShape
      size="medium"
      style={{ color: 'indigo', backgroundColor: 'lightgray' }}
    >
      <Icon size="medium" icon={UserIcon} />
    </AvatarShape>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a custom circular frame for avatar-like content.

## Avoid when

- The higher-level `Avatar` component already fits the use case.

## Sources

- `packages/oui/src/components/AvatarShape/docs/AvatarShape.stories.tsx`
