# State Matrix Template

Every user-facing feature needs a state matrix before implementation.

## Page States

| State | User sees | Available action | Data source | Validation |
|---|---|---|---|---|
| First visit | `<EmptyOrOnboardingState>` | `<PrimaryAction>` | none/local/API | screenshot |
| Loading | Skeleton/progress | cancel/wait | API/job | no layout shift |
| Loaded | Main content | primary/secondary actions | API/local | happy path |
| Empty | Empty state + next step | create/import/search | API/local | empty fixture |
| Error | Cause + recovery | retry/contact/back | API error | forced error |
| Disabled | Disabled control + context | fix prerequisite | validation | invalid fixture |
| Permission denied | Permission message | request access/back | auth/API | role fixture |
| Success | Confirmation + next step | continue/view/export | API/local | happy path |

## AI Or Long-Running Task States

| State | UI pattern | Recovery |
|---|---|---|
| Waiting for input | Prompt/input + examples | none |
| Running | Progress, stream, steps, or job status | cancel/retry |
| Partial result | Preview + incomplete badge | continue/retry |
| Needs review | Accept/reject/edit | user decision |
| Accepted | Saved result + next step | undo/version history |
| Rejected | Rejected state + alternatives | retry/edit |
| Rate limited | Cooldown and reason | wait/retry later |
| Failed | Error details + retry | retry/change input |

## Component States

```text
button:
input:
select/menu:
tab:
table/list row:
card:
modal/drawer:
toast:
```
