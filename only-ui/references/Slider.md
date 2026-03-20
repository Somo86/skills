# Slider

## Use when

- The design lets users select one value or a range along a continuous scale.

## Figma mapping cues

- Horizontal draggable range control -> `Slider`

## Implementation notes

- A single-value slider uses one value in `defaultValue`, such as `[40]`.
- A range slider uses two values, such as `[25, 80]`.
- Labels can be placed in `Slider.Start` and `Slider.End` using `Slider.Label`.
- Inputs can be composed with `Slider.Input` and `Slider.Input.Suffix`.
- `showSteps` displays step marks.
- The docs show using `Slider` inside `FormControl`.

## React examples

```tsx
import { Slider } from '@onlyfyio/oui';

export function Example() {
  return (
    <div style={{ width: 300 }}>
      <Slider defaultValue={[40]} min={0} max={100} step={1}>
        <Slider.Start>
          <Slider.Label>{(value) => `${value} %`}</Slider.Label>
        </Slider.Start>
      </Slider>
    </div>
  );
}
```

```tsx
import { FormControl, Slider } from '@onlyfyio/oui';

export function Example() {
  return (
    <FormControl>
      <FormControl.Label>Label</FormControl.Label>
      <div style={{ width: 300 }}>
        <Slider defaultValue={[25, 85]} step={5}>
          <Slider.Start>
            <Slider.Input>
              <Slider.Input.Suffix>%</Slider.Input.Suffix>
            </Slider.Input>
          </Slider.Start>
          <Slider.End>
            <Slider.Input>
              <Slider.Input.Suffix>%</Slider.Input.Suffix>
            </Slider.Input>
          </Slider.End>
        </Slider>
      </div>
      <FormControl.ErrorText>Error message</FormControl.ErrorText>
    </FormControl>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a range track, thumbs, labels, and input syncing yourself.

## Avoid when

- The value should be typed directly and not manipulated as a continuous range.

## Sources

- `packages/oui/src/components/Slider/Slider.stories.tsx`
