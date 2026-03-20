# AvatarList

## Use when

- The design shows a compact cluster of multiple avatars.

## Figma mapping cues

- Overlapping or grouped participant avatars -> `AvatarList`

## Implementation notes

- Compose with repeated `AvatarList.Avatar` children.
- `max` limits visible avatars before collapsing overflow.
- `size` controls avatar size across the whole list.
- `total` can represent the total count beyond the visible items.

## React examples

```tsx
import { AvatarList } from '@onlyfyio/oui';

export function Example() {
  return (
    <AvatarList max={4} size="medium" total={0}>
      <AvatarList.Avatar src="/avatar.jpg" alt="alt text" />
      <AvatarList.Avatar src="/avatar.jpg" alt="alt text" />
      <AvatarList.Avatar src="/avatar.jpg" alt="alt text" />
    </AvatarList>
  );
}
```

## Prefer over raw HTML when

- You would otherwise manually stack and clip multiple avatars.

## Avoid when

- Only one avatar is shown. Use `Avatar`.

## Sources

- `packages/oui/src/components/AvatarList/docs/AvatarList.stories.tsx`
