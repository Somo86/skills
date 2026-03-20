# SidebarNav

## Use when

- The design shows a left-side navigation rail with items, dividers, and expandable groups.

## Figma mapping cues

- Sidebar navigation with active state and nested sections -> `SidebarNav`

## Implementation notes

- Compose top-level entries with `SidebarNav.Item`.
- Add icons with `SidebarNav.Icon`.
- Separate groups with `SidebarNav.Divider`.
- Use `SidebarNav.Group` and `SidebarNav.SubItem` for nested navigation.
- The component supports controlled mode with `active` and `onActiveChange`, and uncontrolled mode with `defaultActive`.

## React examples

```tsx
import { SidebarNav, UserIcon } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ width: 320, border: '1px solid #D8DADF' }}>
      <SidebarNav defaultActive="Overview">
        <SidebarNav.Item value="Overview">
          <SidebarNav.Icon icon={UserIcon} />
          Overview
        </SidebarNav.Item>
        <SidebarNav.Item value="Privacy">
          <SidebarNav.Icon icon={UserIcon} />
          Privacy
        </SidebarNav.Item>
      </SidebarNav>
    </div>
  );
}
```

```tsx
import { SidebarNav, UserIcon, XingJobsIcon } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [active, setActive] = useState('Candidate Center');

  return (
    <div style={{ width: 320, border: '1px solid #D8DADF' }}>
      <SidebarNav active={active} onActiveChange={setActive}>
        <SidebarNav.Item value="Overview">
          <SidebarNav.Icon icon={UserIcon} />
          Overview
        </SidebarNav.Item>
        <SidebarNav.Group defaultOpen>
          <SidebarNav.Icon icon={XingJobsIcon} />
          Integrations
          <SidebarNav.SubItem value="Candidate Center">
            Candidate Center
          </SidebarNav.SubItem>
          <SidebarNav.SubItem value="Job feed">Job feed</SidebarNav.SubItem>
        </SidebarNav.Group>
      </SidebarNav>
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise create a custom sidebar tree or grouped nav list.

## Avoid when

- The design uses tabs or top navigation instead of a persistent side nav.

## Sources

- `packages/oui/src/components/SidebarNav/SidebarNav.stories.tsx`
