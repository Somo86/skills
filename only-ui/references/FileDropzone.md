# FileDropzone

## Use when

- The design supports drag-and-drop file upload with visible drop-area messaging.

## Figma mapping cues

- Large dashed upload area with drag-and-drop instructions -> `FileDropzone`

## Implementation notes

- Compose with `FileDropzone.DropArea` and `FileDropzone.List`.
- The drop area commonly contains `Illustration`, `Title`, `UploadLink`, `Info`, and `ErrorMessage`.
- Validation is handled with `validator`, `invalid`, `onInvalidChange`, `value`, and `onValueChange`.
- `removeLabel` is required for accessible removal controls.

## React examples

```tsx
import { FileDropzone } from '@onlyfyio/oui';

export function Example() {
  return (
    <FileDropzone removeLabel="Remove button">
      <FileDropzone.DropArea>
        <FileDropzone.Illustration illustration="document" />
        <FileDropzone.Title>
          <FileDropzone.UploadLink>Click to upload</FileDropzone.UploadLink> or drag and drop
        </FileDropzone.Title>
        <FileDropzone.Info>JPG, JPEG, PNG, max 2MB</FileDropzone.Info>
        <FileDropzone.ErrorMessage>Generic error message</FileDropzone.ErrorMessage>
      </FileDropzone.DropArea>
      <FileDropzone.List />
    </FileDropzone>
  );
}
```

## Prefer over raw HTML when

- You would otherwise build a drag-and-drop upload surface and file list manually.

## Avoid when

- The design only needs a simple button-based picker. Use `FileUpload`.

## Sources

- `packages/oui/src/components/FileDropzone/FileDropzone.stories.mdx`
