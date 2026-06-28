# Asset Library Template

Use this for products that need a branded or coherent visual surface. Assets must be generic to the product being built, not copied from another project.

## Asset Inventory

| Asset | Required? | Purpose | Format | Target path | Style constraints |
|---|---|---|---|---|---|
| Logo / wordmark | yes | Product identity | svg/png | `<path>` | Matches tokens |
| App icon / favicon | yes | Browser/app identity | svg/png/ico | `<path>` | Legible at small size |
| Entry background | optional | First-view context | png/webp | `<path>` | Not purely decorative |
| Empty state | yes | Guide next action | svg/png | `<path>` | Short text, clear action |
| Loading visual | optional | Long task feedback | svg/css/lottie | `<path>` | Does not block reading |
| Success visual | optional | Completion feedback | svg/png | `<path>` | Paired with next step |
| Error visual | optional | Recovery context | svg/png | `<path>` | Calm, actionable |
| Feature icons | optional | Semantic categories | svg/icon lib | `<path>` | Shared line weight |
| Product screenshot/mockup | optional | Show expected result | png/webp | `<path>` | Real or representative UI |
| Social preview | optional | Link sharing | png | `<path>` | Uses same identity system |

## Style Brief

```text
Color source:
Line weight:
Corner radius:
Lighting/shadow:
Texture/pattern:
Composition:
Accessibility:
Do not use:
```

## Review

```text
Do all assets share the same color roles?
Do icons use consistent line weight and metaphor?
Does every empty/error asset include a next action?
Are assets inspectable and not dark, blurred, or purely atmospheric?
Are generated assets licensed or safe for the intended use?
```
