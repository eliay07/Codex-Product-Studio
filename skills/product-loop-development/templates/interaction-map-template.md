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

## Copy Checks

```text
Primary action:
Secondary action:
Empty state action:
Error recovery action:
Destructive confirmation:
```
