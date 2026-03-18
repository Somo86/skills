# salesforce-cli

Salesforce CLI overview skill for safe org data access and maintenance. This skill is intended for developers who integrate with Salesforce and need a simple, controlled way to verify that their work is properly reflected in connected Salesforce organizations. It supports reading and updating data with `sf` without moving into broader data-management, metadata, or application-building workflows.

## Features

- **Non-Developer Friendly Scope**: Designed for operational data access, not Salesforce platform development
- **Safe Salesforce CLI Entry Point**: Guides read-first workflows for existing org data
- **Restricted Command Surface**: Limits usage to a small allowlist of approved `sf` commands
- **Target Org Handling**: Verifies org aliases and default-org behavior before execution
- **Update Safety Flow**: Requires pre-read, explicit value confirmation, update, and post-update verification
- **Skill Routing Guidance**: Directs create/delete/metadata work to more appropriate Salesforce skills

## Quick Start

### 1. Set up Salesforce CLI

- Install Salesforce CLI from the npm package: `https://www.npmjs.com/package/@salesforce/cli`
- Node.js must already be installed on your computer before installing Salesforce CLI from npm

### 2. Add the skill to your agent

- Add this skill to your agent skills folder before trying to use it

### 3. Connect your first Salesforce org

- Before starting to interact with the `sf` CLI, log in to your first organization
- Ask your agent to guide you through that login flow if needed
- You can only start using this skill after at least one organization is connected

### 4. Invoke the skill

```text
Skill: salesforce-cli
Request: "Check the Status__c field on record a01xx0000001234 in org dev"
```

### 5. Typical use cases

- Retrieve an existing record with `sf data get record`
- Search existing data with `sf data search`
- Run a read-only SOQL `SELECT` query when built-in commands are not enough
- Update fields on an existing record after confirming current and new values
- Determine whether a request should stay in this skill or move to `sf-data`, `sf-soql`, or `sf-metadata`

## Intended Use

Use this skill when the goal is to validate integration behavior against data in already connected Salesforce organizations:

- Read existing records
- Search and inspect data
- Update fields on existing records
- Confirm that external or integrated systems wrote the expected values into Salesforce

This is primarily a verification skill for integration developers who want to check whether application behavior is correctly reflected in Salesforce data.

Do not use this skill to build Salesforce features or platform logic:

- No Apex or other custom business logic
- No automation design
- No metadata modeling
- No complex Salesforce development workflows

The purpose of this skill is narrow: read data and update data safely.

## Allowed Commands

This skill is intentionally narrow and only allows these commands:

- `sf org list`
- `sf org login web`
- `sf data get record`
- `sf data update record`
- `sf data search`
- `sf data query --query` only for `SELECT` or `UPDATE`

All other `sf` and `sf data` commands are out of scope for this skill.

## Safety Boundaries

- Do not use this skill to create records
- Do not use this skill to delete records
- Do not use this skill to create or delete objects
- Do not use this skill to implement complex logic in Salesforce
- Do not use import, bulk delete, or other broader data-management commands
- Do not run updates without reading the current value first and verifying the final stored value afterward

## Documentation

- [SKILL.md](SKILL.md) - Full workflow, org selection rules, and update safety requirements
- [sf-data/README.md](sf-data/README.md) - Broader Salesforce data operations, including create/delete/import workflows
- [sf-soql/README.md](sf-soql/README.md) - SOQL generation, optimization, and analysis
- [sf-metadata/README.md](sf-metadata/README.md) - Metadata creation and org metadata querying

## Specialization

This skill acts as the top-level entry point and relies on already created specialized skills for deeper Salesforce work.

Those specialized skills are sourced from the repository:

- `https://github.com/Jaganpro/sf-skills`

Maintainer:

- `https://github.com/Jaganpro`

In this workspace, those specializations are used as supporting skills when a task goes beyond the narrow read/update verification scope of `salesforce-cli`.

## Related Skills

- `sf-data` for bulk operations, record creation, import/export, and cleanup workflows
- `sf-soql` for deeper SOQL authoring and optimization
- `sf-metadata` for objects, fields, permission sets, and metadata changes

## Requirements

- Salesforce CLI (`sf`) installed
- At least one authenticated org, or the ability to log in with `sf org login web`
- A Codex session with full command access for real Salesforce CLI workflows

## License

MIT License. See the repository root [LICENSE](../LICENSE).
