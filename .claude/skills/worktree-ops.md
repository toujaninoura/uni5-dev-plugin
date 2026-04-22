---
name: worktree-ops
description: Gestion des git worktrees isolés par tâche
---

# Skill — Git Worktree

## Créer
git worktree add ~/projects/{repo}-task-{N} -b feat/issue-{N}-{slug}

## Supprimer
git worktree remove ~/projects/{repo}-task-{N} --force
git fetch --prune

## Règles
- Max 3 worktrees simultanés
- Un worktree = une issue
- Supprimer immédiatement après merge
