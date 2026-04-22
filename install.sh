#!/bin/bash
# install.sh — Installateur uni5-dev-plugin
# Usage : curl -fsSL https://raw.githubusercontent.com/toujaninoura/uni5-dev-plugin/main/install.sh | bash

set -e

PLUGIN_NAME="uni5-dev-plugin"
INSTALL_DIR="$HOME/$PLUGIN_NAME"
REPO="https://github.com/toujaninoura/uni5-dev-plugin"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║     uni5-dev-plugin — Installation   ║"
echo "║     v1.0.0                           ║"
echo "╚══════════════════════════════════════╝"
echo ""

# 1. Vérifier les prérequis
echo "🔍 Vérification des prérequis..."

command -v claude >/dev/null 2>&1 || {
  echo "❌ Claude Code non installé. Lance d'abord :"
  echo "   curl -fsSL https://claude.ai/install.sh | bash"
  exit 1
}

command -v gh >/dev/null 2>&1 || {
  echo "❌ GitHub CLI non installé."
  echo "   sudo apt install gh && gh auth login"
  exit 1
}

command -v git >/dev/null 2>&1 || {
  echo "❌ Git non installé. sudo apt install git"
  exit 1
}

echo "✅ Prérequis OK"

# 2. Cloner ou mettre à jour
if [ -d "$INSTALL_DIR" ]; then
  echo "🔄 Mise à jour de $PLUGIN_NAME..."
  cd "$INSTALL_DIR"
  git pull origin main
else
  echo "📦 Installation de $PLUGIN_NAME..."
  git clone "$REPO" "$INSTALL_DIR"
fi

# 3. Créer le dossier projects
mkdir -p "$HOME/projects"
echo "✅ Dossier ~/projects créé"

# 4. Ajouter alias dans .bashrc
if ! grep -q "uni5-dev-plugin" "$HOME/.bashrc" 2>/dev/null; then
  cat >> "$HOME/.bashrc" << 'BASHEOF'

# uni5-dev-plugin
alias uni5="cd ~/uni5-dev-plugin && claude"
alias uni5-new="cd ~/uni5-dev-plugin && claude"
alias uni5-status="cat ~/uni5-dev-plugin/memory.json | python3 -m json.tool"
BASHEOF
  echo "✅ Alias ajoutés dans .bashrc"
fi

# 5. Rendre les hooks exécutables
chmod +x "$INSTALL_DIR/hooks/"*.sh 2>/dev/null || true

# 6. Résumé
echo ""
echo "╔══════════════════════════════════════╗"
echo "║     ✅ Installation réussie !        ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "📁 Installé dans : $INSTALL_DIR"
echo ""
echo "🚀 Pour lancer :"
echo "   source ~/.bashrc"
echo "   uni5"
echo ""
echo "📋 Commandes disponibles :"
echo "   uni5         → lancer le plugin"
echo "   uni5-status  → voir la mémoire"
echo ""
