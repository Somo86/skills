---
name: only-ui
description: Use only when turning Figma designs into React code for projects that use the Onlyfy OUI component library (`@onlyfyio/oui`, also called only-ui, OUI, or oui). Do not use for non-React design tasks, generic Figma work, or projects that do not use OUI as their design system.
---

# Only UI

Use this skill when the user wants React code generated from a Figma design and
the implementation should use OUI components wherever they fit better than raw
HTML elements.

Do not use this skill when:

- The task is only about design analysis, design critique, copywriting, or
  other non-implementation Figma work.
- The requested output is not React code.
- The target project does not use `@onlyfyio/oui` or does not want OUI
  components.
- The user wants framework-agnostic markup or a different design system.

This skill is about component choice and implementation strategy, not visual
copying alone. The main goal is to translate a design into idiomatic React that
prefers `@onlyfyio/oui` primitives and patterns.

## Clarify First

Before generating code, try to clarify project-specific implementation choices
with the user when they are not already clear from context.

Ask about:

- whether the target project uses React with TypeScript or plain JavaScript
- whether the project already uses `styled-components`
- whether there are local router link wrappers or existing project conventions
  that should be preserved

If the user does not know, does not answer, or the context stays unclear, use
the defaults below.

## Default Implementation Assumptions

Unless the user explicitly says otherwise, generate code with:

- React
- TypeScript
- `styled-components` for styling
- assume `OUIProvider` already exists at the app level

Default styling rules:

- Do not use inline styles.
- Do not create external `.css` files.
- When component-specific styling is needed, create a dedicated styles file
  next to the component implementation.
- Use a `.ts` styles file by default.
- If the user explicitly asks for no TypeScript, use a `.js` styles file
  instead.

Default file organization:

- Keep the implementation in a single component file unless complexity clearly
  justifies splitting it into more files.
- Keep styles in a separate local styles file.
- Prefer a small file set by default: one component file plus one styles file.

Default layout strategy:

- Use OUI components first for all actual UI elements and interaction patterns.
- When OUI does not provide the needed layout primitive, use simple semantic
  React elements styled with `styled-components`.
- Add the minimum number of layout wrappers needed.
- Do not invent complex custom layout abstractions unless the user asks for
  them.

Provider rule:

- Do not add `OUIProvider` to generated code by default.
- Add `OUIProvider` only if the user explicitly asks for it.
- If the user later reports broken rendering, missing styles, or an error that
  points to OUI setup, suggest checking or adding `OUIProvider`.

## Workflow

1. Inspect the Figma design with Figma MCP.
2. Break the UI into semantic roles: headings, body text, actions, inputs,
   selection controls, navigation, overlays, feedback, media, data display.
3. Map each role to OUI before considering raw HTML.
4. Read the relevant component references in `references/` to confirm usage.
5. Generate React code using OUI imports from `@onlyfyio/oui`.
6. Use plain semantic HTML only for layout wrappers or when OUI does not have a
   suitable component.

## Figma To React Rules

- Start from Figma MCP context when the user provides a Figma file, frame, or
  node.
- Preserve the design intent, but prefer semantic and accessible React
  structure over literal layer-for-layer translation.
- Do not recreate standard UI primitives with raw HTML if an OUI component
  exists.
- Favor composition of multiple OUI components over custom one-off widgets.
- If the design implies a known interaction pattern such as modal, tabs,
  dropdown, tooltip, notification, table, pagination, accordion, empty state,
  form field, or tags, use the corresponding OUI component instead of building
  it from scratch.

## OUI Preference Rules

OUI components are preferred over raw React/HTML elements whenever an OUI
component can represent the intended UI correctly.

Prefer OUI for:

- Typography: `Heading`, `Text`
- Actions: `Button`, `ButtonSelect`, `IconButton`, `SplitButton`, `Link`
- Form inputs: `Input`, `Textarea`, `Checkbox`, `Switch`, `RadioGroup`,
  `Select`, `MultiSelect`, `ComboBox`, `DatePicker`, `DateRangePicker`,
  `TimePicker`, `ColorPicker`, `Slider`, `TagInput`, `TextEditor`,
  `FileUpload`, `FileDropzone`, `ImageDropzone`
- Structure and navigation: `Accordion`, `Tabs`, `SecondLevelTabs`, `Stepper`,
  `SidebarNav`, `Pagination`, `Panel`, `CardBase`, `Collapsible`
- Overlays and menus: `Modal`, `Popover`, `DropdownMenu`, `Tooltip`
- Feedback and status: `Banner`, `Notification`, `SystemNotification`,
  `Infobox`, `Badge`, `ProgressBar`, `LoadingIndicator`, `Skeleton`
- Data and option display: `Table`, `Tag`, `Rating`, `Avatar`, `AvatarList`,
  `AvatarShape`
- Branding and illustration: `BrandLogo`, `ProductLogo`, `HeroIllustration`,
  `SpotIllustration`, `Highlighter`, `HighlighterElement`, `Icon`, `confetti`
- App shell and provider utilities: `AppHeader`, `OUIProvider`,
  `OUISSRSupport`

Special case:

- `AppHeader` is a very specific component and should generally not be used by
  default.
- Use `AppHeader` only when the user explicitly asks for it.

Use raw HTML only when one of these is true:

- The element is purely structural layout like `div`, `section`, `header`,
  `main`, `aside`, `footer`, list wrappers, or grid wrappers.
- The required behavior is not represented by any exported OUI component.
- The design calls for semantics that OUI does not replace directly.

Do not default to raw React/HTML primitives for buttons, inputs, tabs, menus,
dialogs, badges, typography, or other standard UI patterns when OUI already
provides a matching component.

## Imports

- Import OUI components from `@onlyfyio/oui`.
- Do not import from internal monorepo paths when generating code for external
  projects unless the user explicitly asks for monorepo-internal code.
- When custom styling is needed, prefer local `styled-components` definitions
  over inline `style` props.

## Fallback Behavior

- If no OUI component is a clear fit, use semantic React/HTML and keep the
  custom surface area small.
- If multiple OUI components could fit, prefer the one whose Storybook or MDX
  examples match the interaction pattern most closely.
- State assumptions briefly when a Figma design is ambiguous.

## Reference Files

- Start with `references/components.md` to find the right OUI component.
- Then open the specific component reference file in `references/`.
- Treat the skill-local reference files as the primary knowledge source for OUI
  usage inside this skill.

## Output Expectations

Produce React code first. Keep explanations short unless the user asks for more.

When helpful, briefly note:

- which OUI components replaced raw HTML/native primitives
- any ambiguous mappings you had to infer
- any places where no OUI component was a good fit
