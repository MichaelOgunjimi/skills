---
name: taste-design-systems
description: Maps a brief to the right official design system (Material, Fluent, Carbon, Polaris, Atlassian, Primer, GOV.UK, USWDS, Bootstrap, Radix, shadcn/ui, Tailwind) with install commands and canonical doc links, and explains how to build aesthetics with no official package (glassmorphism, bento, brutalism, Apple Liquid Glass approximation). Use when the brief names or implies a design system or company style, or asks for glass, liquid glass, bento, or brutalist looks.
---

# Taste: Design Systems

Companion to `taste-frontend`.

## Workflow

1. Match the brief in [references/system-map.md](references/system-map.md). If it reads as a named system, install and use the **official** package. Do not recreate its CSS or import its tokens and override most of them.
2. Install with [references/install-commands.md](references/install-commands.md); read the system's own docs first ([references/canonical-sources.md](references/canonical-sources.md)).
3. If the brief is an aesthetic with no official package, build it with native CSS + Tailwind and say so in code comments. For Liquid Glass, use [references/liquid-glass.md](references/liquid-glass.md): it is a labeled web approximation, never Apple-issued.

## Rules

- One design system per project; never mix (no shadcn inside Material 3, no Fluent beside Carbon).
- shadcn/ui is never shipped in default state.
- Provide `prefers-reduced-transparency` fallbacks for glass.
