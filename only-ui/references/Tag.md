# Tag

## Use when

- The design shows compact labels for status, filters, or selected values.
- Users may need to remove a selected chip-like item.

## Figma mapping cues

- Small pill/chip with text -> `Tag`
- Removable chip -> interactive tag variant with `onRemove`

## Implementation notes

- The documented interactive form is `InteractiveTag`.
- `onRemove` adds a close icon button.
- `removeLabel` is required for accessibility and tooltip text.
- Documented states include `selected` and `disabled`.

## React examples

```tsx
import { InteractiveTag } from '@onlyfyio/oui';

export function Example() {
  return (
    <InteractiveTag removeLabel="Remove tag">Design system</InteractiveTag>
  );
}
```

```tsx
import { InteractiveTag } from '@onlyfyio/oui';

export function Example() {
  return (
    <InteractiveTag
      selected
      removeLabel="Remove selected filter"
      onRemove={() => {}}
    >
      Active filter
    </InteractiveTag>
  );
}
```

## Prefer over raw HTML when

- You would otherwise render custom chips, pills, or removable tags.

## Avoid when

- The element should behave like a button with standard CTA emphasis.

## Sources

- `packages/oui/src/components/Tag/InteractiveTag.stories.mdx`
