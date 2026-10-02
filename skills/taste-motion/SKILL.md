---
name: taste-motion
description: Motion and scroll-interaction rules and recipes for marketing sites and portfolios: when to animate, Motion vs GSAP, sticky-stack, horizontal pan, scroll-reveal, forbidden scroll patterns, plus a vocabulary of named hero, nav, card, gallery, and typography effects. Use when adding animation, scroll effects, parallax, marquees, pinned sections, or when the user names an effect (bento, magnetic button, dock, kinetic type).
---

# Taste: Motion

Companion to `taste-frontend`. The dial `MOTION_INTENSITY` (set in `taste-frontend/references/brief-and-dials.md`) gates everything here.

## Workflow

1. Read [references/motion-rules.md](references/motion-rules.md): motivation test, marquee cap, forbidden patterns, library choice.
2. For a named effect, look it up in [references/vocabulary.md](references/vocabulary.md) so the pattern name is right.
3. Start from a skeleton instead of writing GSAP from scratch:
   - [assets/sticky-stack.tsx](assets/sticky-stack.tsx): cards pin and stack on scroll.
   - [assets/horizontal-pan.tsx](assets/horizontal-pan.tsx): vertical scroll drives a horizontal track.
   - [assets/reveal-stagger.tsx](assets/reveal-stagger.tsx): enter-on-scroll, no GSAP needed.
4. Honor reduced motion and animate only `transform`/`opacity` (`taste-frontend/references/guardrails.md`).

## Hard rules

- Every animation must communicate hierarchy, story, feedback, or state change. "Looked cool" is not a reason.
- `window.addEventListener("scroll")` is banned. Use Motion `useScroll`, ScrollTrigger, IntersectionObserver, or CSS scroll-driven animations.
- Never `useState` for continuous values (mouse, scroll, pointer physics): use motion values.
- Max one marquee per page.
- Never mix GSAP or Three.js with Motion in one component tree.
- If `MOTION_INTENSITY > 4` the page must actually move; otherwise drop the dial to 3.
- GSAP pins use `start: "top top"`.
