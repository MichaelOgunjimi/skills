# Gallery Shell Reference

Build the outer page as a three-column review workspace. Apply the project's brand tokens (fonts, accent, surface colors) to the shell; never copy another product's palette. The shell is app chrome only: the email renderer stays independent of it, and a request to change the shell does not authorize changing the email design.

```
header  (min-h 64px: back arrow | brand mark + name | divider | "Email templates" | right: "N review items")
grid    (min-h calc(100dvh - 4rem); cols 288px | minmax(0,1fr) | 304px; 1px borders between columns)
  rail       search input (h 44px) + numbered template list
  workspace  toolbar (min-h ~80px) + preview stage
  inspector  delivery context + variables
```

Structure rules:

- **Header:** compact utility bar, no hero. Back action, brand mark, descriptor, total count. Everything vertically centred.
- **Rail:** search input on top, then one row per template: a tinted two-digit index (`01`), the template name, and the category as a muted second line. Selected row gets a raised surface plus a visible active state. Do not render a category strip when there are fewer than ~6 templates or one category; add it only when categories need filtering, as a full-width horizontal strip under the header with icon, label, and count.
- **Toolbar:** template name and `Subject: ...` on the left; controls on the right as two small segmented groups. Group 1 is email color mode (light / dark), shown only when the template supports both. Group 2 is viewport (desktop / mobile). Icon-only buttons need `aria-label` and a pressed state.
- **Preview stage:** a distinct surface that differs from both the shell and the email background, filling the remaining height (`min-h: calc(100dvh - header - toolbar)`) with `overflow: auto`. The email sits centred in it with generous padding. Desktop width: `max-width` 600-760px. Mobile width: ~390px. Animate width changes with a short transition, honoring `prefers-reduced-motion`.
- **Inspector:** label/value pairs in one `dl`: Audience, Trigger (monospace), Integration status, Color handling, Action destination (monospace). Below it a `Variables` heading and a wrap of `<code>` chips, one per placeholder. End with a short note stating what is integrated versus proposed.
- **Typography:** small monospace uppercase labels (10-11px, wide tracking) for section headings; 12-13px body text in the shell; the email keeps its own type scale.
- **Scrolling:** the page may scroll as a whole, but the preview stage must not trap the wheel on short viewports. Prefer sticky rail and inspector (`position: sticky; top: 4rem; max-height: calc(100dvh - 4rem); overflow: auto`) over fixed-height panes.

Responsive behavior:

- Under ~1180px: drop the inspector below the preview; keep the rail.
- Under ~768px: stack to one column in this order: header, search, **horizontal sticky template selector** (cards ~13rem wide with `overflow-x: auto`, scroll-snap, and the next card peeking), toolbar (controls wrap onto their own row), preview stage, inspector. Hide the viewport toggle's desktop option or keep it but cap the stage to the screen width. The email renders at available width with 16px stage padding.
- Always: 44px touch targets where practical, visible focus rings, keyboard-selectable list (arrow keys optional), and zero page-level horizontal overflow (`min-w-0` on every grid child, `overflow-x: hidden` only as a last resort).

Verify the shell with screenshots at 1440, 1024, and 390px before handoff.

## Rendering Isolation

- Render each email in an `<iframe srcdoc>` (or shadow root), not inline in the app DOM. Inline rendering lets shell CSS leak in, which no real mail client does, and the email's headline becomes the page's `<h1>`.
- The mobile toggle must resize the iframe, not just a wrapper `div`, so the email's `@media (max-width)` rules actually fire. A narrowed container proves nothing about responsive CSS.
- Give the page its own `<h1>` (visually hidden is fine) and label the preview `role="region"` with `aria-label="Preview: <template name>"`.
- Give the iframe a `title`. Decorative images get `alt=""`; the brand logo keeps real alt text.

## Control Semantics

- Template list: `aria-current="true"` on the selected row; rows are real `<button>`s.
- Toggle groups (color mode, viewport): `role="group"` with a label, `aria-pressed` on each button, and icon-only buttons keep `aria-label`.
- Targets are 44px minimum. 36px icon buttons are a common miss; pad them out.
- Search input has an accessible name even when the visible label is an icon.
- Persist selection in the URL (`?t=<id>&mode=dark&view=mobile`) so a reviewer can share an exact state in a comment or PR.

## Text Wrapping Defects To Check

- Long paths and URLs in the inspector and in the email's "button not working" fallback must wrap cleanly. Mid-word breaks like `invitation` / `s` or `toke` / `n` are defects. Use `overflow-wrap: anywhere` plus `<wbr>` after `/`, `?`, `&`, and `=`.
- Long variable chips wrap as whole chips, never inside a chip.
- Long subjects truncate with a full-text `title`/tooltip in the toolbar and show in full in the inspector.

## Review Aids (add in priority order)

Core, always include:

1. **Status per template** using one vocabulary: `Proposed`, `Approved`, `Integrated`. Show it in the rail and toolbar, not only in a footnote.
2. **Subject and preheader** with character counts (flag subjects over ~60 chars and preheaders over ~110).
3. **Plain-text view** tab. Every HTML email needs a text alternative, and reviewers should read it.
4. **Link table** in the inspector: every link, its label, resolved destination, and whether the route exists, is tokenized, or is proposed.
5. **Unresolved-variable check:** flag any `{{ ... }}` visible in the rendered output that is not declared in the variables list, and any declared variable that never appears.

Strong additions when budget allows:

6. **Message weight:** rendered HTML size, warning near 100 KB (Gmail clips beyond it).
7. **Dark and light check:** if the email claims dark-mode support, show both and note how it handles forced inversion (Outlook, Gmail apps).
8. **Images-off view** to confirm the layout and CTA survive blocked images.
9. **Contrast check** on text and CTA against their backgrounds.
10. **Copy buttons** for template ID, subject, and each variable token.
11. **Prev/next** controls and arrow-key navigation through the template list.
12. **Review notes:** a per-template comment field is out of scope unless the user asks; otherwise link to the tracker.

Out of scope unless explicitly approved: sending test emails, editing templates in the browser, any provider calls.

## Rail Polish

- Separate rows with a subtle divider or keep consistent vertical rhythm; avoid a rail that is mostly empty space. With few templates, group by category with a small heading instead of leaving the column blank.
- Show the count next to each category heading and the total in the header.
- Show a no-results state for search with a clear-search action.
