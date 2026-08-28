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

## Conditional assets

Export these only from approved sources or faithful crops:

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
