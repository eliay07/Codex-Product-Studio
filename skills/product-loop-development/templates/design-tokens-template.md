# Design Tokens Template

Use placeholders until the project has real brand decisions. Do not copy names, colors, or page labels from another product.

## Product Context

```text
Product: <ProductName>
User role: <UserRole>
Primary task: <PrimaryTask>
Surface type: <SurfaceType>
Tone: <calm | precise | expressive | trusted | playful | utilitarian>
Density: <low | medium | high>
Mode: <light | dark | both>
```

## Color Roles

| Token | Value | Purpose | Restriction |
|---|---|---|---|
| `--color-bg` | `<hex>` | Page background | Do not use for raised surfaces |
| `--color-surface` | `<hex>` | Cards, panels, menus | Keep contrast against background |
| `--color-border` | `<hex>` | Dividers and subtle outlines | Avoid high contrast unless focused |
| `--color-text` | `<hex>` | Primary text | Must meet contrast target |
| `--color-muted` | `<hex>` | Secondary text and metadata | Not for critical warnings |
| `--color-primary` | `<hex>` | Main action and selected state | Limit to key actions |
| `--color-primary-hover` | `<hex>` | Hover/active primary state | Must be visibly different |
| `--color-success` | `<hex>` | Completed or healthy state | Pair with icon/text |
| `--color-warning` | `<hex>` | Needs attention | Pair with icon/text |
| `--color-danger` | `<hex>` | Destructive or failed state | Never use for decoration |
| `--color-info` | `<hex>` | Neutral informative state | Pair with label |

## Type Scale

| Token | Size | Line height | Weight | Use |
|---|---:|---:|---:|---|
| `display` | `<size>` | `<line-height>` | `<weight>` | Only true hero/immersive pages |
| `page-title` | `<size>` | `<line-height>` | `<weight>` | Page object or task |
| `section-title` | `<size>` | `<line-height>` | `<weight>` | Scan-friendly section headers |
| `body` | `<size>` | `<line-height>` | `<weight>` | Main content and forms |
| `label` | `<size>` | `<line-height>` | `<weight>` | Field labels, tabs, table headers |
| `caption` | `<size>` | `<line-height>` | `<weight>` | Metadata and helper text |
| `button` | `<size>` | `<line-height>` | `<weight>` | Actions |

## Layout

| Token | Value | Use |
|---|---:|---|
| `space-1` | `4px` | Dense internal spacing |
| `space-2` | `8px` | Small gaps |
| `space-3` | `12px` | Control gaps |
| `space-4` | `16px` | Section internals |
| `space-6` | `24px` | Page rhythm |
| `space-8` | `32px` | Large separation |
| `radius-control` | `<px>` | Buttons, inputs, chips |
| `radius-panel` | `<px>` | Panels and cards |
| `content-max` | `<px>` | Reading/form width |

## Component States

```text
default:
hover:
focus:
active:
selected:
disabled:
loading:
success:
error:
```
