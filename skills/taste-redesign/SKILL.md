---
name: taste-redesign
description: Protocol for modernising an existing website without breaking its brand, IA, SEO, or analytics: detect preserve vs overhaul, audit first, preserve tokens and routes, apply modernisation levers in priority order. Use when the user asks to redesign, refresh, modernise, restyle, or improve an existing site or page rather than build a new one.
---

# Taste: Redesign

Companion to `taste-frontend`. Misclassifying the mode is the biggest source of bad redesign output.

## Workflow

1. **Detect the mode** (greenfield / preserve / overhaul). If ambiguous, ask once whether to preserve the brand or start visually from scratch.
2. **Audit before touching**: brand tokens, IA, content blocks, patterns to keep and retire, current dial reading, SEO baseline.
3. **Choose scope**: targeted evolution (levers 1-4) unless the visual debt is structural.
4. **Apply levers in order** and stop when the brief is satisfied.
5. Build with `taste-frontend` rules, then run its pre-flight (`taste-frontend/references/preflight.md`).

Full protocol, preservation rules, and the list of things that never change silently (routes, nav labels, form fields, logo, legal copy): [references/redesign-protocol.md](references/redesign-protocol.md).

## Never silently change

URL structure, primary nav labels, form field names/order, the logo or wordmark, legal/consent/cookie copy.
