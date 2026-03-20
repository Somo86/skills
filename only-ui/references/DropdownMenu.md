# DropdownMenu

## Use when

- The design shows an action menu opened from a trigger.
- The menu contains actions, separators, submenus, radio groups, or checkbox items.

## Figma mapping cues

- Action overflow menu, kebab menu, or trigger-opened command list -> `DropdownMenu`

## Implementation notes

- Compose as `DropdownMenu -> Trigger -> Content`.
- The component supports plain items, separators, nested submenus, checkbox items, and radio groups.
- The docs show `DropdownMenu.Sub`, `DropdownMenu.SubTrigger`, and `DropdownMenu.SubContent` for nested menus.
- Use stateful `DropdownMenu.Checkbox` and `DropdownMenu.RadioGroup` when the menu needs toggles or single-choice items.

## React examples

```tsx
import { Button, DropdownMenu } from '@onlyfyio/oui';

export function Example() {
  return (
    <DropdownMenu>
      <DropdownMenu.Trigger>
        <Button variant="tertiary">Trigger</Button>
      </DropdownMenu.Trigger>
      <DropdownMenu.Content>
        <DropdownMenu.Item>Edit</DropdownMenu.Item>
        <DropdownMenu.Item>Duplicate</DropdownMenu.Item>
        <DropdownMenu.Separator />
        <DropdownMenu.Item>Delete</DropdownMenu.Item>
      </DropdownMenu.Content>
    </DropdownMenu>
  );
}
```

```tsx
import {
  Button,
  ChevronRightIcon,
  DropdownMenu,
  Icon,
  UserIcon,
} from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [value, setValue] = useState('option_1');

  return (
    <DropdownMenu>
      <DropdownMenu.Trigger>
        <Button variant="tertiary">Actions</Button>
      </DropdownMenu.Trigger>
      <DropdownMenu.Content>
        <DropdownMenu.Item>
          <Icon icon={UserIcon} />
          Profile
        </DropdownMenu.Item>
        <DropdownMenu.Sub>
          <DropdownMenu.SubTrigger>
            More
            <Icon icon={ChevronRightIcon} />
          </DropdownMenu.SubTrigger>
          <DropdownMenu.SubContent>
            <DropdownMenu.Item>Sub item</DropdownMenu.Item>
          </DropdownMenu.SubContent>
        </DropdownMenu.Sub>
        <DropdownMenu.Separator />
        <DropdownMenu.RadioGroup value={value} onValueChange={setValue}>
          <DropdownMenu.RadioItem value="option_1">
            Option 1
          </DropdownMenu.RadioItem>
          <DropdownMenu.RadioItem value="option_2">
            Option 2
          </DropdownMenu.RadioItem>
        </DropdownMenu.RadioGroup>
      </DropdownMenu.Content>
    </DropdownMenu>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a custom action menu, nested menu, or menu-based option picker.

## Avoid when

- The content is a simple one-level single-select field. Use `Select`.

## Sources

- `packages/oui/src/components/DropdownMenu/docs/DropdownMenu.stories.tsx`
