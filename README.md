# uni5-dev-plugin

Plugin Claude Code qui transforme un cahier des charges en code livré sur GitHub.

## Installation en 1 commande

```bash
curl -fsSL https://raw.githubusercontent.com/toujaninoura/uni5-dev-plugin/main/install.sh | bash
source ~/.bashrc
```

## Prérequis
- Claude Code (`claude --version`)
- GitHub CLI (`gh auth status`)
- Git configuré (`git config --global user.email`)

## Utilisation

```bash
uni5
```

Puis colle ton CDC dans le prompt `>`.

## Ce que le plugin fait automatiquement

1. Analyse le CDC et détecte le type de projet
2. Pose les questions manquantes
3. Crée les issues GitHub + board
4. Initialise le repo avec protection de branche
5. Développe chaque issue dans un worktree isolé
6. Crée une PR par issue avec revue automatique
7. Merge + cleanup + tests QA
8. Archive les apprentissages en mémoire

## Agents inclus

| Agent          | Rôle                        |
|----------------|-----------------------------|
| po-agent       | Orchestrateur               |
| dev-agent      | Développeur (8 phases TDD)  |
| api-agent      | Spécialiste API REST        |
| frontend-agent | Spécialiste Frontend        |
| db-agent       | Spécialiste base de données |
| code-reviewer  | Audit qualité               |
| qa-agent       | Tests et validation         |

## Stacks supportés

- C# .NET 8 — API REST + JWT + SQL Server + NUnit
- Node.js — Express + MongoDB + Jest
- React/Vue — Frontend SPA
- Fullstack — Détection automatique

## Mise à jour

```bash
cd ~/uni5-dev-plugin && git pull
```
