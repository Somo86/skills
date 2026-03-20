# ProgressBar

## Use when

- The design visually represents task completion or status progress.

## Figma mapping cues

- Horizontal progress track with fill and optional labels -> `ProgressBar`

## Implementation notes

- The required progress value is passed with `progress`.
- `color` includes at least `primary` and `success`.
- `type` supports `duo` and `mono`.
- Labels are composed with `ProgressBar.Label` and can be positioned `left`, `center`, or `right`.
- Multiple labels are supported.

## React examples

```tsx
import { ProgressBar } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ width: 500 }}>
      <ProgressBar progress={50}>
        <ProgressBar.Label>Label</ProgressBar.Label>
      </ProgressBar>
    </div>
  );
}
```

```tsx
import { ProgressBar } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ width: 500 }}>
      <ProgressBar color="success" type="mono" progress={75}>
        <ProgressBar.Label position="left">0%</ProgressBar.Label>
        <ProgressBar.Label position="center">75%</ProgressBar.Label>
        <ProgressBar.Label position="right">100%</ProgressBar.Label>
      </ProgressBar>
    </div>
  );
}
```

## Prefer over raw HTML when

- You would otherwise style progress tracks, labels, and semantic progress behavior yourself.

## Avoid when

- The state is indefinite and should be shown as a spinner. Use `LoadingIndicator`.

## Sources

- `packages/oui/src/components/ProgressBar/ProgressBar.stories.mdx`
