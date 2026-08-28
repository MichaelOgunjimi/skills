# Michael Ogunjimi's Agent Skills

[![skills.sh](https://skills.sh/b/MichaelOgunjimi/skills)](https://skills.sh/MichaelOgunjimi/skills)

Reusable skills for Codex and other agents that support the Agent Skills format.

## Install

Browse and choose a skill interactively:

```bash
npx skills add MichaelOgunjimi/skills
```

Install a specific skill globally for Codex:

```bash
npx skills add MichaelOgunjimi/skills --skill logo-asset-production -g -a codex
```

## Available skills

| Skill | Purpose |
|---|---|
| [`logo-asset-production`](skills/logo-asset-production/) | Faithfully turn an approved final logo into a production-ready app and web asset suite without redesigning it. |

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
