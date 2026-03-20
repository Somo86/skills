# AppHeader

`AppHeader` is a very specific component. Do not choose it by default for a
generic top bar or navigation layout. Use it only when the user explicitly asks
for `AppHeader`.

## Use when

- The design shows the application’s top header with logo, navigation, quick actions, and account/help menus.

## Figma mapping cues

- Full-width app top bar with logo, nav tabs, action icons, and avatar menu -> `AppHeader`

## Implementation notes

- Compose with `AppHeader.Logo`, `AppHeader.Navigation`, `AppHeader.NavigationItem`, `AppHeader.ActionMenu`, and `AppHeader.ActionMenuItem`.
- Use `AppHeader.DropdownMenu` for header menus such as help or user profile.
- `AppHeader.MenuItemBadge` can show counts on action items.
- The docs mark this component as Alpha, so its API may still evolve.

## React examples

```tsx
import { AppHeader, Icon, MessagesIcon, QuestionIcon } from '@onlyfyio/oui';
import { AccessibleIcon } from '@radix-ui/react-accessible-icon';

export function Example() {
  return (
    <AppHeader style={{ width: '100%' }}>
      <AppHeader.Logo />
      <AppHeader.Navigation>
        <AppHeader.NavigationItem active>Candidates</AppHeader.NavigationItem>
        <AppHeader.NavigationItem>Jobs</AppHeader.NavigationItem>
      </AppHeader.Navigation>
      <AppHeader.ActionMenu>
        <AppHeader.ActionMenuItem active>
          <AccessibleIcon label="Messages">
            <Icon icon={MessagesIcon} size="medium" />
          </AccessibleIcon>
        </AppHeader.ActionMenuItem>
        <AppHeader.DropdownMenu>
          <AppHeader.DropdownMenu.Trigger>
            <AppHeader.ActionMenuItem>
              <AccessibleIcon label="Help">
                <Icon icon={QuestionIcon} size="medium" />
              </AccessibleIcon>
            </AppHeader.ActionMenuItem>
          </AppHeader.DropdownMenu.Trigger>
          <AppHeader.DropdownMenu.Content>Help content</AppHeader.DropdownMenu.Content>
        </AppHeader.DropdownMenu>
        <AppHeader.DropdownMenu>
          <AppHeader.DropdownMenu.Trigger role="menuitem" tabIndex={0}>
            <AppHeader.Avatar alt="Profile picture" />
          </AppHeader.DropdownMenu.Trigger>
          <AppHeader.DropdownMenu.Content>User menu</AppHeader.DropdownMenu.Content>
        </AppHeader.DropdownMenu>
      </AppHeader.ActionMenu>
    </AppHeader>
  );
}
```

## Prefer over raw HTML when

- You would otherwise hand-build a branded app shell header with multiple interactive subareas.

## Avoid when

- The design only needs a simple local section header.

## Sources

- `packages/oui/src/components/AppHeader/docs/AppHeader.stories.tsx`
