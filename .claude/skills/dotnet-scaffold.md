---
name: dotnet-scaffold
description: Génération projet .NET N-Tier complet avec SQL Server
---

# Skill — .NET N-Tier Scaffold

## Créer la solution
dotnet new sln -n {ProjectName}
dotnet new webapi -n {ProjectName}.API
dotnet new classlib -n {ProjectName}.Application
dotnet new classlib -n {ProjectName}.Domain
dotnet new classlib -n {ProjectName}.Infrastructure
dotnet new nunit -n {ProjectName}.Tests

## Références
dotnet add {ProjectName}.API reference {ProjectName}.Application
dotnet add {ProjectName}.API reference {ProjectName}.Infrastructure
dotnet add {ProjectName}.Application reference {ProjectName}.Domain
dotnet add {ProjectName}.Infrastructure reference {ProjectName}.Application
dotnet add {ProjectName}.Infrastructure reference {ProjectName}.Domain
dotnet add {ProjectName}.Tests reference {ProjectName}.Application

## Vérification
dotnet build → 0 erreurs
dotnet test  → tous les tests passent
