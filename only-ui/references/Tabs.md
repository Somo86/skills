# Tabs

## Use when

- The design separates related content into peer sections within the same page or panel.
- Users switch between views without leaving the current context.

## Figma mapping cues

- Horizontal tab strip -> `Tabs` with `layout="horizontal"`
- Vertical side tabs -> `Tabs` with `layout="vertical"`
- Tab trigger with badge or accent marker -> compose content inside `Tabs.Trigger`, optionally with `Tabs.Indicator`

## Implementation notes

- Compose tabs as `Tabs -> Tabs.List -> Tabs.Trigger + Tabs.Content`.
- Every trigger and content pane must share the same `value`.
- The docs show support for horizontal and vertical layouts.
- `Tabs.Trigger` can include icons or `Tabs.Indicator`.
- `disabled` is a documented state on individual triggers.

## React examples

```tsx
import { Tabs } from '@onlyfyio/oui';

export function Example() {
  return (
    <Tabs defaultValue="tab1">
      <Tabs.List>
        <Tabs.Trigger value="tab1">One</Tabs.Trigger>
        <Tabs.Trigger value="tab2">Two</Tabs.Trigger>
        <Tabs.Trigger value="tab3">Three</Tabs.Trigger>
      </Tabs.List>
      <Tabs.Content value="tab1">Tab Content One</Tabs.Content>
      <Tabs.Content value="tab2">Tab Content Two</Tabs.Content>
      <Tabs.Content value="tab3">Tab Content Three</Tabs.Content>
    </Tabs>
  );
}
```

```tsx
import { AddPersonIcon, Icon, Tabs } from '@onlyfyio/oui';

export function Example() {
  return (
    <Tabs defaultValue="tab1">
      <Tabs.List>
        <Tabs.Trigger value="tab1">
          <span>One</span>
          <Icon icon={AddPersonIcon} />
        </Tabs.Trigger>
        <Tabs.Trigger value="tab2" disabled>
          Two
        </Tabs.Trigger>
      </Tabs.List>
      <Tabs.Content value="tab1">First panel</Tabs.Content>
      <Tabs.Content value="tab2">Second panel</Tabs.Content>
    </Tabs>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a custom tablist, tab buttons, active state, and panel switching.

## Avoid when

- The sections should behave like navigation to separate pages. Consider route navigation or `SidebarNav`.

## Sources

- `packages/oui/src/components/Tabs/Tabs.stories.mdx`
