# Faithful master restoration

Read this only when the approved source is a screenshot, has a baked background, contains compression damage, or is too small for production exports.

## Prefer non-generative extraction

Use ordinary alpha/background removal, cropping, and resampling when the background is separable without damaging the artwork. Preserve a copy of the original source. Do not sharpen, recolor, or reshape by default.

Use `imagegen` only when simple processing cannot recover a usable master. Image generation is a restoration tool in this workflow, not a design tool.

## Prompt pattern

Adapt this prompt to the supplied artwork:

> Faithfully restore and extract this already-final logo onto a genuinely transparent background at high resolution. Preserve the exact symbol geometry, wordmark spelling, letterforms, typography, colors, gradients, proportions, spacing, alignment, and intentional effects. Change only the background and technical image quality. Do not redesign, simplify, embellish, reinterpret, replace text, or create new elements. Return a tightly framed production master with clean alpha edges and no checkerboard baked into the pixels.

For mark-only extraction, add: “Extract only the existing mark; do not reconstruct or modify it.” Do not ask the model to create a missing wordmark or variant.

## Acceptance checks

1. Inspect the candidate and source side by side at full size.
2. Compare silhouette, internal negative space, text spelling, letterform shapes, colors, gradient direction, spacing, and effects.
3. Check real transparency with:

```bash
identify -format '%f | %wx%h | %[channels] | corner=%[pixel:p{0,0}]\n' candidate.png
```

4. Composite the candidate on light and dark backgrounds to expose halos or baked pixels.
5. Inspect 16, 32, and 48 pixel reductions before approval.

Reject candidates with a baked checkerboard, solid black/white background, typography drift, geometry drift, dirty edges, invented details, or changed proportions. A targeted retry may clarify the defect, but never accept an altered identity merely because it looks polished. If faithful restoration is not possible, report that limitation and request a better source.

