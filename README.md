# Skills

This repository contains reusable Codex skills. It currently includes multiple top-level skills and is structured to grow with additional skills over time.

## Available Skills

### `salesforce-cli`

Salesforce CLI skill for developers who integrate with Salesforce and want to validate that their work is correctly reflected in connected Salesforce organizations. Its scope is intentionally narrow: reading data, inspecting records, and updating existing data safely.

Docs:

- [salesforce-cli/README.md](salesforce-cli/README.md)
- [salesforce-cli/SKILL.md](salesforce-cli/SKILL.md)

### `only-ui`

React implementation skill for turning Figma designs into production code for projects that use the Onlyfy OUI component library (`@onlyfyio/oui`). It focuses on mapping design intent to idiomatic OUI components instead of raw HTML primitives.

Docs:

- [only-ui/SKILL.md](only-ui/SKILL.md)

### `spec-driven-development`

Spec-Driven Development skill for guiding Codex users through GitHub's Spec-Kit workflow. It is based on the upstream [`SpillwaveSolutions/sdd-skill`](https://github.com/SpillwaveSolutions/sdd-skill), adapted for Codex usage. It covers greenfield and brownfield executable specification flows, translates upstream slash-command guidance into Codex skill usage, and summarizes generated artifacts with feature status tracking.

Docs:

- [spec-driven-development/SKILL.md](spec-driven-development/SKILL.md)

## Notes

- More skills can be added to this repository as new workflows are formalized
- Specialized Salesforce support used by `salesforce-cli` lives under the same directory and complements the top-level skill

## Repository Structure

```text
.
├── README.md
├── only-ui/
│   └── SKILL.md
├── spec-driven-development/
│   ├── SKILL.md
│   └── references/
└── salesforce-cli/
    ├── README.md
    ├── SKILL.md
    ├── sf-data/
    ├── sf-metadata/
    └── sf-soql/
```
