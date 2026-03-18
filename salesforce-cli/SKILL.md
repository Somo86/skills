---
name: salesforce-cli
description: >
  Salesforce CLI overview for safe org data access and maintenance.
  TRIGGER when: the user needs to retrieve Salesforce data, inspect custom objects,
  run SOQL through the Salesforce CLI, or update existing Salesforce records from an
  org using `sf`. Use this skill whenever the task is about reading or modifying
  existing Salesforce object data with the CLI, even if the user only says "check
  Salesforce", "query an object", or "update a record".
  DO NOT TRIGGER when: the task requires creating records, deleting records, creating
  objects, deleting objects, schema or metadata discovery, metadata deployment, or a
  deeper specialized workflow already covered by `sf-data`, `sf-soql`, or
  `sf-metadata`.
---

# Salesforce CLI Overview

Use this skill as the entry point for Salesforce CLI work in this repository.

This skill is intentionally narrow:
- retrieve Salesforce data from an org
- inspect existing objects through SOQL
- update existing records when the user explicitly wants a modification

This skill is not a general guide to every `sf` command. It only covers the CLI usage needed for reading and updating existing Salesforce data safely.

The allowed command surface is intentionally restricted to this allowlist:
- `sf org list`
- `sf org login web`
- `sf data get record`
- `sf data update record`
- `sf data search`
- `sf data query --query` only when the query contains `SELECT` or `UPDATE`

All other `sf` and `sf data` commands are not allowed.

The broader `sf data` command set is documented in [salesforce-cli/sf-data/README.md](sf-data/README.md). Use that as the reference for available commands, but apply the restrictions in this skill first.
For specific `sf data` command patterns, see [salesforce-cli/sf-data/references/sf-cli-data-commands.md](sf-data/references/sf-cli-data-commands.md).

## Execution Environment Requirement

Salesforce CLI work in Codex should be run outside the sandbox.

Before starting any real `sf` CLI workflow, recommend that the user open a Codex session with full command access:
- in Codex CLI, use `--yolo`
- in Codex Desktop, give the agent full access

This recommendation should be given before trying to use the Salesforce CLI, because org login and interactive CLI workflows are expected to run outside sandbox restrictions.

## Core Intent

Use the Salesforce CLI when the user needs to work with existing Salesforce data in the organization, especially custom objects, through SOQL-backed workflows.

The default operating mode is:
- read data first
- confirm the target object and records
- apply updates only to existing records

Prefer specific built-in `sf data` commands first:
- `sf data get record` for retrieving a known record
- `sf data search` for search-style lookup
- `sf data update record` for direct record updates

Use `sf data query --query` only when the built-in commands cannot accomplish what the user asked for.

Examples:
- `sf data get record ...`
- `sf data update record ...`
- `sf data query --query "SELECT ..."`
- `sf data query --query "UPDATE ..."`

If using `sf data query --query`, only these direct query intents are allowed:
- `SELECT`
- `UPDATE`

Do not use other direct query types from `sf data query --query`.

## Hard Safety Boundary

Never use this skill to delete anything.

Forbidden actions:
- create records
- delete records
- create objects
- delete objects
- run any command or script that performs delete, purge, or object creation at the metadata level
- use forbidden `sf data` commands such as:
  - `sf data create record`
  - `sf data delete record`
  - `sf data delete bulk`
  - `sf data import tree`
- use non-allowed direct queries through `sf data query --query`

If the user asks for creation, deletion, or object creation, stop and hand off to a more specific skill. Do not execute those actions from this skill.

## When This Skill Owns The Task

Use `salesforce-cli` when the user needs:
- a high-level Salesforce CLI workflow for org data access
- to query existing Salesforce data
- to inspect custom objects or existing records
- to update fields on existing records with the CLI
- to understand whether a task should stay at the overview level or move to a specialized Salesforce CLI skill

## Required Context To Gather First

Ask for or infer:
- org alias or target org
- target object name
- whether the task is read or update
- record selection criteria
- fields that must be queried or updated
- whether the user needs a query or an actual update

If any of that is unclear, clarify before suggesting commands.

## Target Organization Selection

Most Salesforce CLI commands allow the target org to be specified with:
- `--target-org`
- `-o`

Use this rule consistently:
- if the user does not specify a target org, do not pass `--target-org`; let the CLI use the default org
- if the user specifies a target org, pass it with `--target-org <alias>`

The value for `--target-org` must be an organization alias. Validate that alias with `sf org list` before using it.

If the alias is missing, unclear, or not found in `sf org list`, stop and clarify instead of guessing.

Before running a command, remind the user which org alias is currently active in context:
- the explicit alias from `--target-org`, or
- the default org if no target flag will be used

## Authentication Prerequisite

Before interacting with Salesforce data, verify that the CLI already has at least one authenticated org.

Use:

```bash
sf org list
```

Interpret the result this way:
- if the command returns at least one org with organization details such as an Org Id and the status `Connected`, CLI access is available and work may proceed
- if no org is connected, stop and guide the user through connecting an org before attempting any query or update

The user may connect a new organization at any time. Re-check with `sf org list` after any login step before proceeding with data access.

## Login Workflow For A New Organization

If `sf org list` is empty, or the user explicitly wants to log a new organization, collect these three inputs before running any login command:
- organization URL
- alias name
- whether the org should be the default org

Ask for all three first. Do not run `sf org login web` until the user has provided them.

Use this command shape:

```bash
sf org login web --instance-url <organization-url> --alias <alias>
```

Add `--set-default` in either of these cases:
- the user explicitly says the new org should be the default
- `sf org list` returns no existing organizations, even if the user said the new org should not be the default

That default override is mandatory for the first authenticated organization.

Example when no orgs are currently logged in:

```bash
sf org login web --instance-url https://xing-e-recruiting--fullcopy.sandbox.my.salesforce.com --alias salesforce-preview --set-default
```

Example when another org is already connected and the user said the new org should not be the default:

```bash
sf org login web --instance-url https://xing-e-recruiting--fullcopy.sandbox.my.salesforce.com --alias salesforce-preview
```

After running the command:
- the CLI opens a browser window
- the user must manually complete login with username and password
- wait for the CLI to report success before continuing
- re-run `sf org list` to verify the org now appears as connected

## Recommended Workflow

### 1. Confirm access
Run `sf org list` and verify that at least one org is in `Connected` status before attempting any data operation.

### 2. Log in if needed
If no org is connected, or the user wants to add a new org, gather the required login inputs and run `sf org login web` with the correct flags. Wait for browser login completion and CLI success, then verify again with `sf org list`.

### 3. Resolve the target org
Use the alias supplied by the user only if it exists in `sf org list`. Otherwise, rely on the default org by omitting `--target-org`.

### 4. Start with read-only inspection
Prefer a built-in read command first. Use `sf data get record` or `sf data search` when they fit the request. Use `sf data query --query "SELECT ..."` only when those commands cannot express the required retrieval.

### 5. Execute the requested allowed operation
Prefer `sf data update record` for updates when it fits the request. Use `sf data query --query "UPDATE ..."` only when the built-in update command cannot express the required change. In both cases, only modify the records and fields the user explicitly requested.

### 6. Verify after update
Retrieve the affected records again with the most appropriate allowed read command and report the final state.

## Mandatory Update Safety Flow

For every update:
1. get the current value first
2. show or state the current value and the proposed new value
3. make sure the proposed new value is what the user wants
4. only then run the update
5. run a final get/read to verify the stored value changed correctly

Do not update first and verify later. Verification before and after the update is mandatory.

## Specialized Skill Routing

Use this overview skill to orient the task, then move to the specialized skill that best matches the work:

- For SOQL authoring, optimization, relationship queries, or query debugging, use [salesforce-cli/sf-soql](../salesforce-cli/sf-soql/SKILL.md).
- For schema inspection, object or field metadata discovery, or other metadata-oriented org querying, use [salesforce-cli/sf-metadata](../salesforce-cli/sf-metadata/SKILL.md).
- For deeper reference on Salesforce CLI data workflows that still fit these boundaries, use [salesforce-cli/sf-data](../salesforce-cli/sf-data/SKILL.md) selectively and ignore any create/delete-oriented guidance that conflicts with this skill.

Apply the boundary strictly:
- `sf-soql` for query design
- `sf-metadata` for schema and metadata discovery
- this skill for safe execution of allowed read/update `sf data` commands, with `sf data query --query` as fallback only

If a requested action involves create or delete behavior, this skill must not proceed until a more specific skill is chosen.

## Output Expectations

When finishing, report in this order:
1. task type: read or update
2. target org and object
3. query or command used
4. affected records
5. verification result
6. any handoff to `sf-soql`, `sf-data`, or `sf-metadata`

## Notes For Future Expansion

Authentication is a prerequisite for every real org interaction. Login methods and org-connection workflows should be added as a focused extension to this overview skill.
