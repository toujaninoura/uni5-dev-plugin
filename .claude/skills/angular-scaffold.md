---
name: angular-scaffold
description: Génération projet Angular 17 standalone avec CSS custom
---

# Skill — Angular Scaffold

## Créer
ng new {ProjectName}-frontend --routing --style=css --standalone --strict --skip-git

## Structure
src/app/
├── core/     (services, guards, interceptors, models)
├── shared/   (composants réutilisables)
└── features/ (pages lazy-loaded)

## Vérification
ng build → 0 erreurs
ng test --watch=false → tous les tests passent
ng serve → http://localhost:4200
