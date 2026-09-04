---
name: logo-asset-production
description: Faithfully turn an already-approved final logo image, screenshot, or raster export into a complete production-ready asset suite for an app or website. Use when the identity is final and the user needs restoration, background removal, transparent masters, icon sizes, favicons, Apple/PWA/maskable assets, approved lockup exports, metadata integration, or asset QA. Do not use to design, redesign, evolve, reinterpret, or explore a logo.
---

# Logo Asset Production

Productionize the approved logo without changing its identity.

## Hard boundary

Treat the supplied logo as the source of truth. Preserve its symbol, wordmark, spelling, typography, colors, gradients, proportions, spacing, alignment, and intentional effects. Cleaning artifacts, extracting a background, restoring resolution, adding safe-area padding, resizing, converting formats, packaging variants, and integrating assets are allowed.

Never creatively improve, simplify, redraw, restyle, or reinterpret the logo. Never replace its wordmark with a guessed font or invent a missing lockup. Do not create a separate dark-mode logo by default. First preview the unchanged transparent logo on the project's actual dark surface. If it remains clearly legible and visually faithful, reuse the same asset in both modes. Create an on-dark adaptation only when one or more logo colors blend into the dark surface or lose necessary visual separation. Prefer an approved on-dark source; otherwise, deterministically invert or replace only the low-contrast color while preserving the approved accent colors. Do not invert the entire logo unless it is an approved single-color or monochrome treatment. If a faithful color adaptation cannot be inferred, keep the artwork unchanged and place it on a contrasting background with sufficient safe-area padding. Clearly label that fallback as background-backed rather than an approved recolored logo. A request to create or redesign a logo belongs in a separate logo-design skill.

## Establish the source of truth

1. Identify which attachment is the approved final logo and which attachments are only references.
2. Inspect the source at full resolution with `view_image` when available.
3. Record the invariant characteristics before editing: geometry, typography, palette, gradient direction, spacing, effects, and background behavior.
4. Prefer an existing transparent, high-resolution master over any screenshot. Do not regenerate a clean source unnecessarily.
5. Ask a concise question only when multiple supplied versions conflict or the intended final version cannot be inferred safely.

## Choose the production path

- For a clean transparent master, skip generative restoration and proceed to deterministic export.
- For a screenshot, baked background, compression damage, or inadequate resolution, read [references/restoration.md](references/restoration.md) and restore a master first.
- For the standard asset matrix and naming rules, read [references/deliverables.md](references/deliverables.md).
- If ImageMagick is installed, use [scripts/export_logo_assets.sh](scripts/export_logo_assets.sh) for the deterministic icon suite. Keep approved lockups as separate source files.

Use the installed `imagegen` skill only for faithful restoration, extraction, or upscaling when ordinary image processing is insufficient. Its prompt must state every invariant and prohibit redesign. Reject any output that alters the mark or wordmark.

## Prepare the dark-mode decision preview

When dark-mode use is in scope, create a review-only comparison board before finalizing the asset choice:

1. Use equal light and dark columns with the project's actual surface colors. If those colors are unavailable, use neutral white and near-black and state that they are placeholders.
2. Show the unchanged approved logo on both surfaces at the same scale and with the same padding.
3. Include the primary lockup and the standalone mark when both approved forms exist. Do not invent a missing form for the board.
4. If the unchanged logo loses visibility on dark, add the minimally adapted candidate so the user can compare it with the unchanged version.
5. Present the board with a short recommendation and ask the user to approve either reusing the original asset or shipping the on-dark adaptation. Treat the board as a decision artifact, not a production asset.

## Build the asset suite

1. Preserve a versioned copy of the approved source.
2. Produce a clean transparent mark master only if the mark can be extracted exactly.
3. Export icon sizes, favicon, Apple touch, PWA, and maskable assets from that master.
4. Preview the unchanged logo on the project's actual dark surface. Reuse the default asset for dark mode when it already remains legible; do not create a duplicate file merely to label it `on-dark`.
5. Only when the default loses visibility, produce an on-dark deliverable using, in order: an approved on-dark logo; a deterministic adaptation of only the low-contrast color; or the unchanged logo on a contrasting background when recoloring cannot be inferred faithfully.
6. Export horizontal, stacked, on-light, and monochrome lockups only when the approved source contains them or they can be cropped without reconstructing the identity. Apply an on-dark adaptation to each exported lockup only when its default version fails the dark-surface preview.
7. Do not claim a raster trace is an original vector. Supply SVG only when a faithful vector source exists or the user explicitly accepts a reconstructed trace.
8. Use platform-safe padding and backgrounds without changing the artwork itself.

## Integrate only when requested

When the user asks for app integration:

1. Inspect the framework, public asset conventions, existing metadata, manifest, theme colors, and logo components.
2. Place files within the project’s established structure.
3. Update favicon links, web manifest, Apple touch metadata, social metadata, and shared logo components as applicable.
4. Replace placeholder branding only within the requested scope.
5. Preserve unrelated code and existing user changes.

## Validate before handoff

- Verify actual alpha channels with `identify`; a visible checkerboard is not evidence of transparency.
- Confirm exact file dimensions, formats, names, and expected color mode.
- Compare restored assets directly with the approved source at large size and at 16, 32, and 48 pixels.
- Inspect the decision board at normal and small display sizes before deciding whether a dark-mode adaptation is needed. If adapted, confirm that only the minimum necessary low-contrast colors changed.
- Reject distorted geometry, changed lettering, altered spacing, halos, clipped shadows, dirty alpha edges, or unintended backgrounds.
- For app integration, render the affected pages and run the relevant lint/build checks.
- Report whether the same asset serves both modes or an on-dark version was supplied, deterministically adapted, or background-backed; what was integrated; and anything intentionally omitted because faithful derivation was impossible.
