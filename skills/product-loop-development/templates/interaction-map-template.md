# Interaction Map Template

Use this before implementing buttons, menus, tabs, toolbars, and forms.

## Action Hierarchy

| Surface | Object affected | Action | Level | Location | State coverage | Risk |
|---|---|---|---|---|---|---|
| `<SurfaceType>` | `<Entity>` | `<PrimaryAction>` | primary | `<Location>` | default/loading/success/error | low |
| `<SurfaceType>` | `<Entity>` | `<SecondaryAction>` | secondary | `<Location>` | default/disabled/error | medium |
| `<SurfaceType>` | `<Entity>` | `<DestructiveAction>` | destructive | `<Location>` | confirm/loading/success/error/undo | high |

## Placement Checks

```text
Is the action close to the object it affects?
Is there only one primary action in the current view?
Are search/filter/sort controls close to the results they affect?
Are destructive actions visually separated from primary actions?
Does each icon-only action have aria-label or tooltip?
Does loading text/icon keep the same button size?
```

## Interaction Depth Map

Define what is visible by default and what moves deeper.

| Layer | Purpose | Content | Component pattern | Default state | Mobile behavior |
|---|---|---|---|---|---|
| L0 fixed shell | location and continuity | nav, current object, progress, global status | nav/rail/header | visible | compact nav/top entry |
| L1 default task | main work | primary input, current object, main action | form/editor/list/preview | visible | full width |
| L2 context | supporting context | preview, source, history, risk, properties | collapsible panel/inspector | open/collapsed | sheet/drawer |
| L3 temporary layer | transient actions | filter, menu, tooltip, command, quick pick | popover/dropdown/command | closed | full-width sheet if needed |
| L4 deep detail | advanced or risky | settings, logs, version detail, destructive flow | detail route/drawer/modal | closed | route/sheet |

## Disclosure And Panel Map

Use this before building workbenches, editors, dashboards with drawers, or multi-panel tools.

| Layer | Component | Default state | Opens when | Collapses to | Restores from | State memory |
|---|---|---|---|---|---|---|
| entry | `<EntrySurface>` | visible | app load | none | none | n/a |
| object-list | `<Sidebar/List>` | visible or rail | user browses objects | rail/handle | trigger/rail/command | last width |
| editor | `<MainEditor>` | empty or preview | user opens `<Entity>` | focus mode keeps editor | object switcher | selected id |
| inspector | `<Drawer/Inspector>` | closed | user requests details | closed tab/button | detail trigger | last tab |
| bottom-panel | `<Log/OutputPanel>` | closed | run/generate/error | bottom tab | panel trigger | last height |
| floating | `<Assistant/Command>` | minimized | user invokes help/command | button | button/shortcut | last mode |

## Floating Layer Rules

| Pattern | Use for | Do not use for | Required behavior |
|---|---|---|---|
| tooltip | short label or hint | instructions and decisions | hover/focus, readable delay |
| popover | local choice or short context | long forms | close, focus return |
| dropdown | object actions | primary workflow | keyboard navigation |
| command menu | cross-page action/search | main path replacement | search, grouping, shortcut |
| sheet/drawer | contextual detail/config | constant primary content | close, preserve context |
| modal | interruptive confirmation | browsing or long editing | trap focus, clear outcome |

## Workbench Checks

```text
Does the default state avoid auto-opening deep editing?
Can every collapsed panel be restored by a visible control?
Does collapse preserve or restore the previous size?
Does the main editor remain the largest area in editing mode?
Are details in inspector/drawer instead of competing with the editor?
Are logs/progress/errors in a bottom panel or status stream?
Are low-frequency actions in command palette/menu/floating tool instead of button walls?
Does Escape close overlays and return focus to the trigger?
```

## Copy Checks

```text
Primary action:
Secondary action:
Empty state action:
Error recovery action:
Destructive confirmation:
```
