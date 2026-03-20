# SecondLevelTabs

## Use when

- The design uses a lighter-weight secondary tab navigation inside a section or card.

## Figma mapping cues

- Secondary tab strip under a primary navigation level -> `SecondLevelTabs`

## Implementation notes

- Compose as `SecondLevelTabs -> List -> Trigger + Content`.
- The docs show `Trigger.Indicator`, `Trigger.Badge`, `GroupSeparator`, and `ItemSeparator`.
- `disabled` is supported on triggers.
- Use `defaultValue` for the initial active tab.

## React examples

```tsx
import { SecondLevelTabs } from '@onlyfyio/oui';

export function Example() {
  return (
    <SecondLevelTabs defaultValue="one">
      <SecondLevelTabs.List>
        <SecondLevelTabs.Trigger value="one">One</SecondLevelTabs.Trigger>
        <SecondLevelTabs.Trigger value="two">Two</SecondLevelTabs.Trigger>
        <SecondLevelTabs.Trigger value="three">Three</SecondLevelTabs.Trigger>
      </SecondLevelTabs.List>
      <SecondLevelTabs.Content value="one">First tab</SecondLevelTabs.Content>
      <SecondLevelTabs.Content value="two">Second tab</SecondLevelTabs.Content>
      <SecondLevelTabs.Content value="three">Third tab</SecondLevelTabs.Content>
    </SecondLevelTabs>
  );
}
```

```tsx
import { CardBase, SecondLevelTabs } from '@onlyfyio/oui';

export function Example() {
  return (
    <SecondLevelTabs defaultValue="all">
      <CardBase style={{ marginBottom: '1rem' }}>
        <SecondLevelTabs.List>
          <SecondLevelTabs.Trigger value="all">
            <span>A Separated tab</span>
          </SecondLevelTabs.Trigger>
          <SecondLevelTabs.GroupSeparator />
          <SecondLevelTabs.Trigger value="one">
            <SecondLevelTabs.Trigger.Indicator />
            <span>One</span>
          </SecondLevelTabs.Trigger>
          <SecondLevelTabs.ItemSeparator />
          <SecondLevelTabs.Trigger value="four">
            <span>Four</span>
            <SecondLevelTabs.Trigger.Badge value="11" />
          </SecondLevelTabs.Trigger>
        </SecondLevelTabs.List>
      </CardBase>
      <SecondLevelTabs.Content value="all">Separated tab content</SecondLevelTabs.Content>
      <SecondLevelTabs.Content value="one">First tab content</SecondLevelTabs.Content>
      <SecondLevelTabs.Content value="four">Fourth tab content</SecondLevelTabs.Content>
    </SecondLevelTabs>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a secondary tab pattern with separators, badges, and active-state logic yourself.

## Avoid when

- The design calls for primary tabs or route navigation. Consider `Tabs` or app navigation.

## Sources

- `packages/oui/src/components/SecondLevelTabs/SecondLevelTabs.stories.mdx`
