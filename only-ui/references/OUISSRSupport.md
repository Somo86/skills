# OUISSRSupport

## Use when

- The app renders OUI components on the server and needs style output in SSR to avoid FOUC.

## Figma mapping cues

- Not a visual Figma primitive. This is an SSR integration utility.

## Implementation notes

- Render `OUISSRSupport` inside `<head>`.
- The docs show Next.js usage for both App Router and Pages Router.
- It should be treated as app infrastructure, not local component UI.

## React examples

```tsx
import { OUISSRSupport } from '@onlyfyio/oui';

export function HeadContents() {
  return (
    <head>
      <OUISSRSupport />
    </head>
  );
}
```

```tsx
import { OUISSRSupport } from '@onlyfyio/oui';
import type { ReactNode } from 'react';

export default function RootLayout({
  children,
}: {
  children?: ReactNode;
}) {
  return (
    <html>
      <head>
        <OUISSRSupport />
      </head>
      <body>{children}</body>
    </html>
  );
}
```

## Prefer over raw HTML when

- You need OUI SSR styling support. There is no raw HTML equivalent.

## Avoid when

- The app is purely client-rendered and does not need SSR style extraction.

## Sources

- `packages/oui/src/components/OUISSRSupport/OUISSRSupport.stories.mdx`
