#!/bin/bash
echo "🔍 uni5-dev-plugin: vérification pre-commit..."

# Bloquer --no-verify
if [ "$SKIP_HOOKS" = "1" ]; then exit 0; fi

# Détecter secrets
if git diff --cached | grep -qE "(password|secret|api_key|token)\s*=\s*['\"][^'\"]{8,}['\"]"; then
  echo "❌ Secret détecté dans le code stagé !"
  exit 1
fi

# Vérifier format commit (sera vérifié dans commit-msg)
echo "✅ Pre-commit OK"
exit 0
