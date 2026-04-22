# Workflow Git obligatoire

## Initialisation du repo
gh repo create {nom-projet} --public --description "{description}"
cd ~/projects/{nom-projet}
git init
git add -A
git commit -m "chore: initial commit"
git branch -M main
git remote add origin https://github.com/toujaninoura/{nom-projet}.git
git push -u origin main

## Protection de la branche main
gh api repos/toujaninoura/{nom-projet}/branches/main/protection \
  --method PUT \
  --field required_pull_request_reviews[required_approving_review_count]=0 \
  --field required_status_checks=null \
  --field enforce_admins=false \
  --field restrictions=null

## Nommage des branches
feat/issue-{N}-{slug}    ← nouvelle fonctionnalité
fix/issue-{N}-{slug}     ← correction de bug
chore/issue-{N}-{slug}   ← tâche technique
test/issue-{N}-{slug}    ← ajout de tests

## Cycle complet par tâche (obligatoire)

### 1. Créer le worktree isolé
git worktree add ../projects/{nom}-task-{N} -b feat/issue-{N}-{slug}
cd ../projects/{nom}-task-{N}

### 2. Développer (dev-agent → 8 phases)
# Phase 1 : lire l'issue
# Phase 2 : plan
# Phase 3 : tests NUnit (TDD)
# Phase 4 : implémentation
# Phase 5 : dotnet build + dotnet test
# Phase 6 : nettoyage
# Phase 7 : commit conventionnel
# Phase 8 : push

### 3. Commit et push
git add -A
git commit -m "feat(scope): description"
git push origin feat/issue-{N}-{slug}

### 4. Code review
# code-reviewer → audit CRITICAL/HIGH/LOW
# fix + commit + push si nécessaire

### 5. Créer la PR
gh pr create \
  --title "feat: {titre de l'issue}" \
  --body "## Changements
{liste des fichiers modifiés}

## Tests
{résumé des tests ajoutés}

## Checklist
- [ ] dotnet build → 0 erreurs
- [ ] dotnet test → tous les tests passent
- [ ] Swagger testé

Closes #{N}" \
  --base main \
  --head feat/issue-{N}-{slug}

### 6. Merger la PR
gh pr merge {PR_NUMBER} --squash --delete-branch

# Si conflit :
cd ~/projects/{nom}
git checkout main && git pull
git checkout feat/issue-{N}-{slug}
git rebase main
# Résoudre les conflits
git rebase --continue
git push --force-with-lease
gh pr merge {PR_NUMBER} --squash --delete-branch

### 7. Cleanup
cd ~/projects/{nom}
git worktree remove ../projects/{nom}-task-{N} --force
git fetch --prune
git checkout main && git pull

### 8. Passer à la tâche suivante

## Parallélisme
- Tâches indépendantes → max 3 worktrees simultanés
- Tâches dépendantes → attendre le merge avant de commencer
- Vérifier les dépendances dans le graphe memory.sprint.dependency_graph

## Commits conventionnels
feat(scope): description      ← nouvelle fonctionnalité
fix(scope): description       ← correction bug
test(scope): description      ← ajout tests
chore(scope): description     ← tâche technique
refactor(scope): description  ← refactoring
docs(scope): description      ← documentation

## Interdit
- git push --force sur main
- git commit --no-verify
- Committer directement sur main
- Merger sans PR
