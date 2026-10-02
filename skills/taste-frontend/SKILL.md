---
name: taste-frontend
description: Anti-slop frontend rules for landing pages, portfolios, marketing sites, and editorial pages. Infers the design direction from the brief, sets variance/motion/density dials, and enforces hard layout, typography, color, copy, imagery, and accessibility rules with a final pre-flight check. Use when building or restyling a landing page, portfolio, marketing site, or when the user asks for a non-templated, premium, or "not AI-looking" UI.
---

# Taste: Frontend

Landing pages, portfolios, and editorial pages. Every rule is contextual: read the brief first, then pull only what fits.

Sibling skills (load only when they apply):
- `taste-motion`: scroll, GSAP, Motion, parallax, marquees, pattern vocabulary.
- `taste-redesign`: the page already exists and is being modernised.
- `taste-design-systems`: brief names a system (Material, Fluent, Carbon, GOV.UK, shadcn...) or Liquid Glass.

## Workflow

1. **Infer.** Read [references/brief-and-dials.md](references/brief-and-dials.md). State one line: "Reading this as: <page kind> for <audience>, with a <vibe> language, leaning toward <system or aesthetic>." Ask at most one question, only if the read genuinely diverges.
2. **Set the dials.** DESIGN_VARIANCE / MOTION_INTENSITY / VISUAL_DENSITY (baseline 8/6/4), adjusted from the brief.
3. **Pick the foundation.** Named design system or honest aesthetic: `taste-design-systems`. Stack defaults: [references/stack-conventions.md](references/stack-conventions.md).
4. **Build** with the rules below, loading references as needed.
5. **Pre-flight.** Run every box in [references/preflight.md](references/preflight.md). If one fails, the work is not done.

## References

| Need | File |
|---|---|
| Fonts, serif policy, accent color, palette bans | [typography-color.md](references/typography-color.md) |
| Hero, nav, eyebrows, bento, section-layout rules, cards, radius | [layout-rules.md](references/layout-rules.md) |
| Loading/empty/error states, forms, copy audit, CTAs, quotes, theme lock | [states-and-copy.md](references/states-and-copy.md) |
| Images, logo walls, fake-screenshot ban | [imagery.md](references/imagery.md) |
| Performance, reduced motion, dark mode protocol | [guardrails.md](references/guardrails.md) |
| Forbidden patterns (em-dash ban, "Jane Doe", scroll cues...) | [ai-tells.md](references/ai-tells.md) |

## Always-on rules

- Zero em-dashes (and no en-dash separators) in any visible string.
- One theme, one accent, one radius system per page.
- Real images, never div-based fake screenshots or hand-rolled decorative SVGs.
- Check `package.json` before importing any library.
- `min-h-[100dvh]`, never `h-screen`.

## Out of scope

This skill is NOT for:
* Dashboards / dense product UI / admin panels (use Fluent, Carbon, Atlassian, or Polaris from Section 2.A (taste-design-systems/references/system-map.md)).
* Data tables (use TanStack Table or AG Grid).
* Multi-step forms / wizards (use Form-specific patterns; this skill won't make them better).
* Code editors (use Monaco / CodeMirror with their official skinning).
* Native mobile (use Apple HIG / Material directly).
* Realtime collab UIs (presence, cursors, OT-aware - different problem class).

If the brief is one of the above, **say so explicitly**, point to the right tool, and only apply this skill's marketing-page / about-page / landing-page parts to the surfaces where they apply.
