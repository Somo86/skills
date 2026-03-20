# ImageDropzone

## Use when

- The design is specifically for image upload with edit/remove affordances.

## Figma mapping cues

- Image upload area with top-right actions and image-specific copy -> `ImageDropzone`

## Implementation notes

- Compose with `ImageDropzone.Actions` and `ImageDropzone.DropArea`.
- The docs include `removeLabel` and `editLabel` for accessible action text.
- The drop area uses `Title`, `UploadLink`, `Info`, and `ErrorMessage`.

## React examples

```tsx
import { ImageDropzone } from '@onlyfyio/oui';

export function Example() {
  return (
    <ImageDropzone removeLabel="Remove image" editLabel="Edit image">
      <div style={{ display: 'flex', justifyContent: 'flex-end', margin: '16px 0' }}>
        <ImageDropzone.Actions />
      </div>
      <ImageDropzone.DropArea>
        <ImageDropzone.Title>
          <ImageDropzone.UploadLink>Click to upload</ImageDropzone.UploadLink> or drag and drop
        </ImageDropzone.Title>
        <ImageDropzone.Info>
          JPG, JPEG, PNG (624x480px), max 2MB
          <ImageDropzone.ErrorMessage>Generic error message</ImageDropzone.ErrorMessage>
        </ImageDropzone.Info>
      </ImageDropzone.DropArea>
    </ImageDropzone>
  );
}
```

## Prefer over raw HTML when

- You would otherwise customize a generic dropzone for image-editing semantics and actions.

## Avoid when

- The upload is not image-specific. Use `FileDropzone`.

## Sources

- `packages/oui/src/components/ImageDropzone/docs/ImageDropzone.stories.mdx`
