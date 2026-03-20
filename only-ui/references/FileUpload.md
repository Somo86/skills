# FileUpload

## Use when

- The design shows a file-picker button plus a selected file list.

## Figma mapping cues

- Standard upload control with button and chosen-file display -> `FileUpload`

## Implementation notes

- Compose as `FileUpload -> FileUpload.Button + FileUpload.FileList`.
- Use `FileUpload.Placeholder` when no files are selected.
- The docs show validation with `validator`, `invalid`, and `onInvalidChange`.

## React examples

```tsx
import { FileUpload } from '@onlyfyio/oui';

export function Example() {
  return (
    <FileUpload>
      <FileUpload.Button>Upload Files</FileUpload.Button>
      <FileUpload.FileList>
        <FileUpload.Placeholder>No files chosen</FileUpload.Placeholder>
      </FileUpload.FileList>
    </FileUpload>
  );
}
```

```tsx
import { FileUpload } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [invalid, setInvalid] = useState(false);

  return (
    <FileUpload
      validator={(file) => file.size < 1000}
      invalid={invalid}
      onInvalidChange={setInvalid}
    >
      <FileUpload.Button>Upload Files</FileUpload.Button>
      <FileUpload.FileList>
        <FileUpload.Placeholder>No files chosen</FileUpload.Placeholder>
      </FileUpload.FileList>
    </FileUpload>
  );
}
```

## Prefer over raw HTML when

- You would otherwise style a file input and manually maintain its selected-file UI.

## Avoid when

- The design is drag-and-drop first. Use `FileDropzone` or `ImageDropzone`.

## Sources

- `packages/oui/src/components/FileUpload/FileUpload.stories.mdx`
