# confetti

## Use when

- The design or flow calls for a celebratory confetti effect after a successful action.

## Figma mapping cues

- Success celebration animation -> `useConfetti`

## Implementation notes

- This is a hook, not a visual component.
- Call `useConfetti()` and then await `show()` to trigger the animation.
- It pairs naturally with a button click or completion callback.

## React examples

```tsx
import { Button, useConfetti } from '@onlyfyio/oui';

export function Example() {
  const { show } = useConfetti();

  const onButtonClick = async () => {
    await show();
  };

  return <Button onClick={onButtonClick}>Confetti</Button>;
}
```

## Prefer over raw HTML when

- You want the built-in OUI celebration helper instead of a custom animation utility.

## Avoid when

- The flow should remain calm or professional without celebratory feedback.

## Sources

- `packages/oui/src/components/confetti/confetti.stories.mdx`
