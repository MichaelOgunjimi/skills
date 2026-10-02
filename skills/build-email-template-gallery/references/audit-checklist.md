# Email Surface Audit

Use this checklist before claiming the gallery covers every email.

## Search The Repository

Search source, templates, configuration, migrations, tests, and jobs for:

- Sender APIs: `send_email`, `send_mail`, `mail.send`, provider SDK calls, SMTP clients
- Rendering: `render_template`, inline HTML, JSX/React Email, MJML, Jinja, Handlebars, Liquid
- Delivery boundaries: outbox, queue, worker, task, cron, scheduled job, webhook
- User flows: verify, sign in, invite, reset, changed, receipt, refund, reminder, confirmation, cancellation, reschedule, review
- Operational flows: admin alerts, daily summaries, failures, requests, moderation, exports
- Configuration: editable subjects/bodies, template IDs, provider template names, feature flags
- Tests: captured subjects, expected recipients, fixtures, timeline events, deduplication keys

Use the repository's fastest search tool and inspect call sites, not only filename matches.

## Candidate Categories

Choose categories from the domain. Common starting points:

- Account and security
- Onboarding and invitations
- Orders, bookings, or reservations
- Payments, invoices, refunds, and holds
- Reminders and lifecycle follow-ups
- Reviews and feedback
- Team or studio operations
- System alerts and failure notifications

Do not create empty categories just to match this list.

## Inventory Columns

For every email moment capture:

| Field | Question |
| --- | --- |
| ID | What stable catalogue key identifies it? |
| Category | Which domain journey owns it? |
| Audience | Customer, administrator, team, or external party? |
| Trigger | What exact state transition or job sends it? |
| Subject | Static, configurable, or variable? |
| Source | Template file, inline renderer, provider template, or missing? |
| Sender | Which service, outbox, queue, or job delivers it? |
| Variables | Which values are actually available at send time? |
| Action | What should the recipient do? |
| Destination | Which existing route or external URL opens? |
| Deduplication | Can it send more than once, and should it? |
| Status | Live, partial, proposed, duplicate, or dead? |

## Reconciliation Questions

- Does every sender map to exactly one intended gallery template?
- Are different subjects or audiences incorrectly sharing one template?
- Are any gallery designs merely proposed and absent from production code?
- Do configurable templates expose the same variables the renderer resolves?
- Does every CTA destination exist and enforce the correct authorization model?
- Can scheduled jobs resend accidentally?
- Do reschedule, cancellation, refund, and security events need their own messages?
- Are plain-text fallbacks, accessibility, and unsubscribe requirements relevant to this email class?
- Are logs or local inbox tooling sufficient to verify rendered output safely?
