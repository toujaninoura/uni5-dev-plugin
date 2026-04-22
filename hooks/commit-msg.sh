#!/bin/bash
MSG=$(cat "$1")
PATTERN='^(feat|fix|refactor|test|chore|docs|perf)(\(.+\))?: .+'
if ! echo "$MSG" | grep -qE "$PATTERN"; then
  echo "❌ Format de commit invalide !"
  echo "   Attendu : type(scope): description"
  echo "   Exemples: feat(api): add products endpoint"
  exit 1
fi
echo "✅ Commit message OK"
exit 0
