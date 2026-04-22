#!/bin/bash
set -e

PLUGIN_NAME="uni5-dev-plugin"
INSTALL_DIR="$HOME/$PLUGIN_NAME"
REPO="https://github.com/toujaninoura/uni5-dev-plugin"
CLAUDE_DIR="$HOME/.claude"

echo "╔══════════════════════════════════════╗"
echo "║     uni5-dev-plugin — Installation   ║"
echo "║     v2.0.0 (vraie structure plugin)  ║"
echo "╚══════════════════════════════════════╝"

# Vérifier prérequis
echo "🔍 Vérification des prérequis..."
command -v claude >/dev/null 2>&1 || { echo "❌ Claude Code manquant: curl -fsSL https://claude.ai/install.sh | bash"; exit 1; }
command -v gh >/dev/null 2>&1 || { echo "❌ GitHub CLI manquant: sudo apt install gh"; exit 1; }
command -v git >/dev/null 2>&1 || { echo "❌ Git manquant: sudo apt install git"; exit 1; }
echo "✅ Prérequis OK"

# Cloner ou mettre à jour
if [ -d "$INSTALL_DIR" ]; then
  echo "🔄 Mise à jour..."
  cd "$INSTALL_DIR" && git pull origin main
else
  echo "📦 Installation..."
  git clone "$REPO" "$INSTALL_DIR"
fi

# Copier agents et skills dans ~/.claude (chargement global)
echo "📂 Installation des agents et skills dans ~/.claude..."
mkdir -p "$CLAUDE_DIR/agents" "$CLAUDE_DIR/skills"

cp "$INSTALL_DIR/.claude/agents/"*.md "$CLAUDE_DIR/agents/" 2>/dev/null && echo "✅ Agents installés"
cp "$INSTALL_DIR/.claude/skills/"*.md "$CLAUDE_DIR/skills/" 2>/dev/null && echo "✅ Skills installés"

# Copier hooks.json
if [ -f "$INSTALL_DIR/.claude/hooks.json" ]; then
  cp "$INSTALL_DIR/.claude/hooks.json" "$CLAUDE_DIR/hooks.json"
  echo "✅ Hooks installés"
fi

# Créer dossier projects
mkdir -p "$HOME/projects"

# Ajouter alias
if ! grep -q "uni5-dev-plugin" "$HOME/.bashrc" 2>/dev/null; then
  cat >> "$HOME/.bashrc" << 'BASHEOF'

# uni5-dev-plugin
alias uni5="cd ~/uni5-dev-plugin && claude"
alias uni5-update="cd ~/uni5-dev-plugin && git pull && cp .claude/agents/*.md ~/.claude/agents/ && cp .claude/skills/*.md ~/.claude/skills/ && echo '✅ Mis à jour !'"
alias uni5-status="cat ~/uni5-dev-plugin/memory.json | python3 -m json.tool"
BASHEOF
  echo "✅ Alias ajoutés"
fi

echo ""
echo "╔══════════════════════════════════════╗"
echo "║     ✅ Installation réussie !        ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "🚀 Pour lancer :"
echo "   source ~/.bashrc && uni5"
