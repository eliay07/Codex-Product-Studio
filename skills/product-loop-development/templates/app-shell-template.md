# App Shell Template

Use this to define navigation before building screens. Keep labels generic until the project domain is known.

## Shell Decisions

```text
Product: <ProductName>
Primary user role: <UserRole>
Main object: <Entity>
Primary task: <PrimaryTask>
Navigation model: <sidebar | top nav | bottom tabs | command palette | hybrid>
Density: <low | medium | high>
Primary interaction shape: <single column | guided flow | split view | resizable workspace | canvas>
```

## Navigation Map

| Route | Surface type | User task | Frequency | Default action | Secondary actions |
|---|---|---|---|---|---|
| `/` | `<SurfaceType>` | `<PrimaryTask>` | high | `<PrimaryAction>` | `<SecondaryAction>` |
| `/<entity>` | management | Manage `<Entity>` | medium | Create/import/search | Filter/sort/export |
| `/<entity>/:id` | reader/editor | Review or edit `<Entity>` | medium | Save/confirm | Comment/export |
| `/settings` | settings | Configure workspace | low | Save changes | Reset/cancel |

## Header Pattern

```text
Left: location / breadcrumb / current object
Center: optional status or progress
Right: page-level secondary actions + one primary action
```

## Content Pattern

```text
Primary region: the task the user came to complete
Secondary region: context, history, filters, references, or status
Feedback region: toast, inline validation, empty state, error state
```

## Workbench Shell Pattern

Use this when the product behaves like an editor, creator studio, AI workbench, canvas, IDE-like tool, or multi-panel workspace.

```text
Activity rail: global modules and restore triggers
Sidebar/object list: objects to open, recent items, search/filter
Main editor/canvas: current object, empty state before explicit open
Inspector/drawer: details, source, parameters, versions, risks
Bottom panel: logs, generation progress, errors, uploads
Floating/command layer: AI assistant, command palette, low-frequency tools
```

```text
Default state:
Object selected state:
Editing active state:
Focus mode:
Collapsed panels and restore triggers:
Mobile fallback:
```

## Interaction Depth

Use this for every non-trivial product surface, not only workbenches.

```text
L0 fixed shell:
L1 default task layer:
L2 collapsible context:
L3 temporary floating layer:
L4 deep detail layer:
Default open:
Default collapsed:
Recover trigger:
Command menu entries:
Drawer / sheet entries:
Popover / dropdown entries:
Danger zone:
```

## Panel Rules

| Region | Default | Can collapse | Recover trigger | Mobile replacement | Content |
|---|---|---|---|---|---|
| Left nav | open/collapsed | yes/no | `<Trigger>` | drawer/top tabs | `<Navigation>` |
| Object list | open/collapsed/hidden | yes/no | `<Trigger>` | drawer | `<Objects>` |
| Main task | open | no | n/a | full width | `<PrimaryTask>` |
| Inspector | open/collapsed/hidden | yes/no | `<Trigger>` | sheet | `<Context>` |
| Bottom panel | collapsed/hidden | yes/no | `<Trigger>` | drawer | `<LogsPreviewHistory>` |

## Responsive Rule

```text
Desktop:
Tablet:
Mobile:
Keyboard/focus:
Floating layers:
Collapsed recovery:
```
