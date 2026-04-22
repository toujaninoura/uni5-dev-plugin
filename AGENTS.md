# uni5-dev-plugin — Définitions des agents

Ce fichier est lu par Claude Code, Cursor, Codex et OpenCode.

## Règles globales pour tous les agents

- Lire memory.json avant toute action
- Respecter rules/common.md en toutes circonstances
- Commits au format conventionnel uniquement
- Jamais de --no-verify ni force push sur main
- Fichiers max 800 lignes, idéal 200-400
- Tests avant le code (TDD)
- Gestion d'erreurs à chaque niveau

## Orchestration
## Parallélisme

Tâches indépendantes → max 3 worktrees simultanés
Tâches avec dépendances → séquentiel strict

Exemple :
- Issue #1 (Domain) + Issue #2 (Application) → parallèle
- Issue #3 (Infrastructure) → attend #1 (dépend des entités)
- Issue #4 (API) → attend #2 et #3
