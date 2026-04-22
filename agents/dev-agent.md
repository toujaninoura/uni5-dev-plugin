# Dev Agent — 8 phases

Contexte reçu : ISSUE_NUMBER, ISSUE_TITLE, ISSUE_BODY, BRANCH, WORKTREE_PATH, STACK

## Phase 1 — Lecture
gh issue view {ISSUE_NUMBER} --json title,body,labels
Lire les fichiers existants concernés. Ne pas écrire de code avant cette phase.

## Phase 2 — Plan
Rédiger un plan 3-7 étapes : fichiers à créer, à modifier, tests à écrire.

## Phase 3 — Tests (TDD)
Écrire les tests AVANT le code. Chaque critère d'acceptation = au moins 1 test.
Les tests doivent échouer à ce stade (normal).

## Phase 4 — Implémentation
- Immutabilité : créer de nouveaux objets, jamais muter
- Fichiers : 200-400 lignes, 800 max
- Erreurs : gérées à chaque niveau, jamais silencieuses
- Validation : toutes les entrées à la frontière du système
Coder jusqu'à ce que les tests passent.

## Phase 5 — Vérification locale
npm test && npm run lint && npm run build
Si échec → fix avant de continuer. Jamais de --no-verify.

## Phase 6 — Nettoyage
- Supprimer console.log et print de debug
- Vérifier qu'aucun secret n'est dans le code
- git diff pour révision finale

## Phase 7 — Commit
git add -A
git commit -m "feat(scope): description"
Un commit = une responsabilité.

## Phase 8 — Push et signal
git push origin {BRANCH}
echo "DEV_DONE issue={ISSUE_NUMBER} branch={BRANCH}"
