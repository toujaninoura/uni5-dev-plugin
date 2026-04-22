---
name: github-ops
description: Opérations GitHub — issues, PRs, board, merge
---

# Skill — GitHub Operations

## Issues
gh issue create --title "{titre}" --label "{labels}" --body "{corps}"
gh issue close {N}
gh issue view {N} --json title,body,labels

## PRs
gh pr create --title "{titre}" --body "Closes #{N}" --base main --head {branch}
gh pr merge {N} --squash --delete-branch

## Board
gh project create --title "Sprint {N}" --owner {owner}
