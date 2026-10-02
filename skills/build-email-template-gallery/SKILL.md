---
name: build-email-template-gallery
description: Audit a software project's complete email surface and build a categorized, responsive, review-only gallery for inspecting email designs, copy, variables, triggers, audiences, and link destinations before production integration. Use when a user asks to inventory email templates, find missing emails, redesign transactional emails, create an /emailtemplate preview route, expose template variables, or approve email designs before wiring them into senders.
---

# Build Email Template Gallery

Create a trustworthy review surface from the project's real email behavior. Follow the existing stack and design system; do not assume Next.js, React, Jinja, or a specific mail provider.

## Workflow

1. Read repository instructions, domain docs, frontend conventions, and email infrastructure.
2. Audit all email-producing paths before designing. Read [references/audit-checklist.md](references/audit-checklist.md).
3. Build an inventory with one row per distinct email moment: stable ID, category, audience, trigger, subject, source/sender, variables, primary action, destination, and implementation status.
4. Reconcile the inventory against templates, inline HTML/text, background jobs, outbox messages, authentication flows, webhook handlers, and admin-triggered actions. Report gaps and duplicates explicitly.
5. Build the gallery at the requested route, defaulting to `/emailtemplate`. Keep it unlinked from public navigation and mark it `noindex` where the framework supports metadata.
6. Verify the gallery with project checks and browser automation at desktop and mobile widths.

## Approval Boundary

- Treat the gallery as review-only.
- Do not replace live templates, alter sending behavior, add provider configuration, or migrate backend renderers until the user explicitly approves integration.
- Use realistic fixture data, never production customer data or live tokens.
- State clearly which preview controls or links are visual only.

## Gallery Requirements

- Group templates by project-relevant categories and show counts.
- Provide search and a compact selectable template list.
- Show audience, subject, trigger, and action destination for the selected email.
- Render the email with realistic sample values so visual review reflects the final result.
- Show dynamic placeholders in a separate variables panel using semantic `<code>` elements, for example `<code>{{ customer_name }}</code>`.
- Provide desktop and mobile preview controls without changing the underlying content.
- Keep email presentation independent from the application's theme. Default transactional emails to a robust light canvas unless project branding or the user requires otherwise.
- Follow the existing brand system, typography, spacing, assets, component library, and accessibility patterns.
- Avoid implementing email interactions that common clients cannot support. Represent actions as normal links or buttons.
- Include empty, long-content, and many-item states when the corresponding real template can encounter them.

## Preferred Gallery Page Layout

Use a focused review-workspace shell for the outer gallery page unless the project or user specifies another structure. Apply the project's brand system to this shell; do not copy another product's palette or assets.

1. Start with a compact utility header containing a back action, project mark or name, an `Email templates` descriptor, and the total template count. Avoid an oversized marketing hero.
2. Place categories in a full-width horizontal strip directly below the header. Give each category an icon or clear label, its template count, and a visible active state.
3. Split the main workspace into a narrow template rail and a large preview workspace:
   - The rail contains search and a compact, preferably numbered, selectable template list.
   - The preview workspace begins with a toolbar showing audience, template name, subject, trigger, status, layout controls when relevant, and desktop/mobile controls.
4. Put the rendered email on a distinct preview stage. Keep the stage visually separate from both the application chrome and the email's own background.
5. Place an inspector beside the email on wide screens. Consolidate delivery context, primary-action destination/status, and semantic variable tokens there instead of scattering them across unrelated dashboard cards.
6. Keep the email body renderer independent from the gallery shell. A request to match or change the main page layout does not authorize changing the email design itself.

Responsive behavior:

- On narrower desktop/tablet widths, move the inspector below the email while keeping the template rail available.
- On mobile, make the category strip horizontally scrollable, convert the template rail into a sticky horizontal template selector, stack toolbar controls, render the email at the available width, and place the inspector below it.
- Preserve keyboard access, 44px touch targets where practical, visible focus states, reduced-motion behavior, and zero page-level horizontal overflow.

## Data Model

Keep catalogue data separate from rendering. At minimum model:

```ts
type EmailTemplate = {
  id: string;
  category: string;
  name: string;
  audience: string;
  subject: string;
  trigger: string;
  variables: string[];
  action?: { label: string; destination: string };
  sample: unknown;
};
```

Adapt the type to the local language and framework. Prefer reusable content blocks over one component per email when templates share a shell.

## Link And Calendar Review

- Trace every CTA to an existing route or explicitly label it as proposed.
- Prefer tokenized private destinations for customer-specific actions; never expose admin-only routes.
- For appointment events, consider Google Calendar, Outlook, and downloadable `.ics` links.
- Use stable calendar UIDs and sequence/update semantics during later production integration so reschedules update and cancellations remove the original event.

## Verification

- Add catalogue integrity tests for unique IDs, valid categories, and documented variables.
- Run lint, type checks, tests, and a production build when available.
- Use browser automation to switch every category, select representative templates, test both preview widths, inspect console errors, and measure horizontal overflow.
- Check long subjects, long variable names, mobile stacking, image loading, and light-email readability against the surrounding app theme.

## Handoff

Report the gallery route, worktree or branch, template count by category, discovered-but-unmodeled email moments, checks run, and the explicit fact that live email delivery remains unchanged.
