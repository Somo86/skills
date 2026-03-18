# Skills

This repository contains reusable Codex skills. It currently includes one top-level skill and is structured to grow with additional skills over time.

## Available Skills

### `salesforce-cli`

Salesforce CLI skill for developers who integrate with Salesforce and want to validate that their work is correctly reflected in connected Salesforce organizations. Its scope is intentionally narrow: reading data, inspecting records, and updating existing data safely.

Docs:

- [salesforce-cli/README.md](salesforce-cli/README.md)
- [salesforce-cli/SKILL.md](salesforce-cli/SKILL.md)

## Notes

- More skills can be added to this repository as new workflows are formalized
- Specialized Salesforce support used by `salesforce-cli` lives under the same directory and complements the top-level skill

## Repository Structure

```text
.
├── README.md
└── salesforce-cli/
    ├── README.md
    ├── SKILL.md
    ├── sf-data/
    ├── sf-metadata/
    └── sf-soql/
```
