# Production deliverables

Use names based on a lowercase project slug. Prefer `on-dark` and `on-light` over ambiguous `dark` and `light` labels.

## Core mark suite

From one approved transparent mark master, produce:

| Asset | Size / format | Purpose |
|---|---:|---|
| `{slug}-mark-source.png` | source resolution | Preserved approved source |
| `{slug}-mark-master.png` | 1400×1400 PNG | Normalized transparent working master |
| `{slug}-mark-{size}.png` | 16, 32, 48, 64, 128, 180, 192, 256, 512, 1024 | UI and platform icons |
| `favicon.ico` | 16/32/48 multi-resolution | Browser favicon |
| `apple-touch-icon.png` | 180×180 opaque | Apple touch icon |
| `icon-192.png` | 192×192 opaque | PWA icon |
| `icon-512.png` | 512×512 opaque | PWA icon |
| `icon-maskable-512.png` | 512×512 opaque, larger safe area | Maskable PWA icon |

Use the project’s real surface color for opaque platform icons. Keep enough safe area that rounded or adaptive masks cannot clip the mark.

## Dark-mode decision board

When evaluating dark-mode use, create `{slug}-dark-mode-review.png` as a review-only artifact:

- Use a two-column light/dark layout with equal dimensions, scale, alignment, and padding.
- Render the unchanged approved logo on both backgrounds first.
- Show the primary lockup above the standalone mark when both approved assets exist.
- Use the project's real light and dark surface colors when known.
- If adaptation appears necessary, include the unchanged and minimally adapted dark-background treatments together for comparison.
- Keep this board out of the production asset directories and label it clearly as a review artifact.

Present the board to the user for a choice before treating a newly adapted on-dark logo as approved.

## Conditional dark-mode deliverable

Preview the unchanged transparent master on the project's actual dark surface. If it remains legible and visually faithful, use the same asset for light and dark modes and do not create a duplicate `on-dark` file.

Only when the default logo loses necessary visibility on the dark surface, produce one of:

- `{slug}-mark-on-dark.png` for a transparent approved or deterministically adapted mark; or
- `{slug}-mark-on-dark-background.png` when the unchanged artwork must be placed on the project's dark surface to preserve brand fidelity.

Use an existing approved on-dark asset whenever available. A deterministic adaptation may invert or replace only the color that lacks separation from the dark surface; preserve approved accent colors and all geometry, typography, proportions, spacing, gradients, and effects. Do not invert an entire multicolor logo or guess a replacement palette. Record whether the default asset serves both modes or the dark-mode result is supplied, adapted, or background-backed.

## Conditional assets

Export these only from approved sources, faithful crops, or the deterministic dark-mode adaptation described above:

- `{slug}-horizontal-on-dark.png`
- `{slug}-horizontal-on-light.png`
- `{slug}-stacked-on-dark.png`
- `{slug}-stacked-on-light.png`
- approved monochrome variants
- `opengraph-image.png` at 1200×630 when social presentation is requested

Do not generate a wordmark by typing the brand name in a substitute font. Do not infer a stacked layout by rearranging a horizontal logo unless the user explicitly approves that new composition.

## Suggested folder structure

```text
public/brand/
  source/
  mark/
  lockups/
  platform/
  social/
```

Follow the project’s existing convention if one exists. After integration, document which source each derivative came from and the correct asset to use on light, dark, small, and social surfaces.
