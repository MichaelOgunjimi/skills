# Michael Ogunjimi's Agent Skills

[![skills.sh](https://skills.sh/b/MichaelOgunjimi/skills)](https://skills.sh/MichaelOgunjimi/skills)

Reusable skills for Codex and other agents that support the Agent Skills format.

## Install

Browse and choose a skill interactively:

```bash
npx skills add MichaelOgunjimi/skills
```

Install a specific skill globally for every supported agent:

```bash
npx skills add MichaelOgunjimi/skills --skill logo-asset-production -g -a '*'
```

After changes are merged into `main`, update the installed skill everywhere:

```bash
npx skills update -g logo-asset-production
```

## Available skills

| Skill | Purpose |
|---|---|
| [`logo-asset-production`](skills/logo-asset-production/) | Faithfully turn an approved final logo into a production-ready app and web asset suite without redesigning it. |
| [`build-email-template-gallery`](skills/build-email-template-gallery/) | Audit a project's email surface and build a review-only gallery of email templates, variables, triggers and links. |
| [`taste-frontend`](skills/taste-frontend/) | Anti-slop rules for landing pages, portfolios and marketing sites: brief inference, layout, type, color, copy, imagery and a pre-flight check. |
| [`taste-motion`](skills/taste-motion/) | Motion and scroll rules, GSAP/Motion skeletons and a vocabulary of named effects. |
| [`taste-redesign`](skills/taste-redesign/) | Modernise an existing site without breaking its brand, IA or SEO. |
| [`taste-design-systems`](skills/taste-design-systems/) | Map a brief to an official design system, with install commands and a Liquid Glass approximation. |

## Repository structure

Each reusable skill lives in its own directory:

```text
skills/
  skill-name/
    SKILL.md
    agents/       # optional agent metadata
    references/   # optional supporting guidance
    scripts/      # optional deterministic tools
```

New skills can be added under `skills/` and installed from this same repository.
