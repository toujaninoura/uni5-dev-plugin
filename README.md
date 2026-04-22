# uni5-dev-plugin

> Autonomous development agent for Claude Code — transforms a spec into delivered, tested code on GitHub.

## What it does

Paste a spec → the agent automatically:
- Creates GitHub issues + board
- Develops each feature in an isolated Git worktree
- Writes tests first (TDD)
- Creates PRs, merges, cleans up
- Runs QA validation
- Saves learnings to memory

## Supported stacks

| Stack | Details |
|---|---|
| C# .NET 8 | ASP.NET Core + EF Core + SQL Server + JWT + NUnit |
| Angular 17 | Standalone components + CSS custom + Jasmine |
| Fullstack | .NET API + Angular frontend |

## Install
Or manually (Windows):
## Requirements
- Claude Code (Pro or Max)
- GitHub CLI (gh auth login)
- .NET 8 SDK
- Node.js 18+ + Angular CLI

## Agents

| Agent | Role |
|---|---|
| po-agent | Orchestrator |
| dev-agent | Developer (8-phase TDD) |
| api-agent | REST API specialist |
| angular-agent | Angular 17 specialist |
| db-agent | Database + migrations |
| code-reviewer | Quality audit |
| qa-agent | Final validation |

## License
MIT © toujaninoura
