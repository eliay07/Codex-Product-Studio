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

## Responsive Rule

```text
Desktop:
Tablet:
Mobile:
Keyboard/focus:
```
