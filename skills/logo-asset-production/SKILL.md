---
name: logo-asset-production
description: Faithfully turn an already-approved final logo image, screenshot, or raster export into a complete production-ready asset suite for an app or website. Use when the identity is final and the user needs restoration, background removal, transparent masters, icon sizes, favicons, Apple/PWA/maskable assets, approved lockup exports, metadata integration, or asset QA. Do not use to design, redesign, evolve, reinterpret, or explore a logo.
---

# Logo Asset Production

Productionize the approved logo without changing its identity.

## Hard boundary

Treat the supplied logo as the source of truth. Preserve its symbol, wordmark, spelling, typography, colors, gradients, proportions, spacing, alignment, and intentional effects. Cleaning artifacts, extracting a background, restoring resolution, adding safe-area padding, resizing, converting formats, packaging variants, and integrating assets are allowed.

Never creatively improve, simplify, redraw, restyle, or reinterpret the logo. Never replace its wordmark with a guessed font or invent a missing lockup. Every asset suite must include a dark-mode-safe logo variant, but derive it without changing the logo's geometry, typography, spacing, or effects. Prefer an approved on-dark source. Otherwise, use a deterministic color adaptation when the source supports one (for example, mapping a single dark neutral to an appropriate light neutral while preserving approved accent colors). If recoloring would require guessing a new palette, keep the artwork unchanged and place it on the project's dark surface with sufficient contrast and safe-area padding. Clearly label that fallback as background-backed rather than an approved recolored logo. A request to create or redesign a logo belongs in a separate logo-design skill.

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

## Build the asset suite

1. Preserve a versioned copy of the approved source.
2. Produce a clean transparent mark master only if the mark can be extracted exactly.
3. Export icon sizes, favicon, Apple touch, PWA, and maskable assets from that master.
4. Always produce a dark-mode-safe logo deliverable. Use, in order: an approved on-dark logo; a deterministic on-dark color adaptation; or an unchanged logo on the project's dark background when recoloring cannot be inferred faithfully.
5. Export horizontal, stacked, on-light, and monochrome lockups only when the approved source contains them or they can be cropped without reconstructing the identity. Apply the same dark-mode derivation to each exported lockup when feasible.
6. Do not claim a raster trace is an original vector. Supply SVG only when a faithful vector source exists or the user explicitly accepts a reconstructed trace.
7. Use platform-safe padding and backgrounds without changing the artwork itself.

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
- Preview the default and dark-mode variants on their intended light and dark surfaces. Confirm that the dark-mode version remains legible and that any color adaptation changes only the minimum necessary colors.
- Reject distorted geometry, changed lettering, altered spacing, halos, clipped shadows, dirty alpha edges, or unintended backgrounds.
- For app integration, render the affected pages and run the relevant lint/build checks.
- Report which variants were supplied, deterministically adapted, or background-backed; what was integrated; and anything intentionally omitted because faithful derivation was impossible.
