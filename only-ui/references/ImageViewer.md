# ImageViewer

## Use when

- The design includes a lightbox-style image viewing experience.
- Users should open an image in an overlay with viewer controls.

## Figma mapping cues

- Click-to-open enlarged image viewer -> `ImageViewer`

## Implementation notes

- Compose as `ImageViewer -> Trigger -> Content -> Viewport -> Image`.
- The viewer controls live inside `ImageViewer.Controls`.
- The docs show `ImageViewer.Close`, and the API also exposes `Prev` and `Next` for multiple images.

## React examples

```tsx
import { Button, ImageViewer } from '@onlyfyio/oui';

export function Example() {
  return (
    <ImageViewer>
      <ImageViewer.Trigger>
        <Button variant="primary">Open ImageViewer</Button>
      </ImageViewer.Trigger>
      <ImageViewer.Content>
        <ImageViewer.Viewport>
          <ImageViewer.Image value="image1" src="/image.jpg" />
        </ImageViewer.Viewport>
        <ImageViewer.Controls>
          <ImageViewer.Close />
        </ImageViewer.Controls>
      </ImageViewer.Content>
    </ImageViewer>
  );
}
```

## Prefer over raw HTML when

- You would otherwise create a custom lightbox with viewport, controls, and overlay state.

## Avoid when

- A plain inline image is enough and no viewer interaction is needed.

## Sources

- `packages/oui/src/components/ImageViewer/docs/ImageViewer.stories.tsx`
