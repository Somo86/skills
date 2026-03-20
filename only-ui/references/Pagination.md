# Pagination

## Use when

- The design includes page navigation across multiple result pages.

## Figma mapping cues

- Numeric page controls with next/previous affordances -> `Pagination`

## Implementation notes

- The only required documented prop is `totalPages`.
- Use `defaultCurrentPage` for uncontrolled initial state.
- Use `currentPage` and `onCurrentPageChange` for controlled mode.

## React examples

```tsx
import { Pagination } from '@onlyfyio/oui';

export function Example() {
  return <Pagination totalPages={7} defaultCurrentPage={5} />;
}
```

```tsx
import { Pagination } from '@onlyfyio/oui';
import { useState } from 'react';

export function Example() {
  const [currentPage, setCurrentPage] = useState(1);

  return (
    <Pagination
      totalPages={7}
      currentPage={currentPage}
      onCurrentPageChange={setCurrentPage}
    />
  );
}
```

## Prefer over raw HTML when

- You would otherwise implement a paginated page selector manually.

## Avoid when

- The design expects infinite scroll or “load more” behavior instead of explicit pages.

## Sources

- `packages/oui/src/components/Pagination/Pagination.stories.mdx`
