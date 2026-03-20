# Table

## Use when

- The design presents structured records in rows and columns.
- Column headers and cell alignment matter more than card-like responsiveness.

## Figma mapping cues

- Grid of repeated rows with a visible header row -> `Table`

## Implementation notes

- The documented structure is `Table -> Table.Header + Table.Body`.
- Render header cells inside `Table.Header`.
- Render data rows with `Table.Row` and data cells with `Table.Cell`.
- Use table layout only for genuinely tabular data, not for generic page layout.

## React examples

```tsx
import { Table } from '@onlyfyio/oui';

export function Example() {
  const heading = ['Date of purchase', 'Name', 'Quantity', 'Expiration date'];
  const rows = [
    ['22 Aug 2022', 'onlyfy one Stellenanzeigen Ultimate', '2', '4 Dec 2022'],
    ['23 Aug 2022', 'onlyfy one Stellenanzeigen Ultimate', '4', '5 Dec 2022'],
  ];

  return (
    <Table>
      <Table.Header>
        {heading.map((title) => (
          <Table.Cell key={title}>{title}</Table.Cell>
        ))}
      </Table.Header>
      <Table.Body>
        {rows.map((row, index) => (
          <Table.Row key={index}>
            {row.map((label) => (
              <Table.Cell key={label}>{label}</Table.Cell>
            ))}
          </Table.Row>
        ))}
      </Table.Body>
    </Table>
  );
}
```

## Prefer over raw HTML when

- You would otherwise write a styled `<table>` for OUI-consistent data display.

## Avoid when

- The content is better expressed as cards, lists, or stacked mobile sections rather than strict tabular data.

## Sources

- `packages/oui/src/components/Table/docs/Table.stories.tsx`
