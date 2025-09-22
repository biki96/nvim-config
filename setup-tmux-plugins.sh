#!/bin/bash
# Setup script for tmux session persistence

set -e

echo "🚀 Setting up tmux session persistence..."

# Create tmux plugins directory
TMUX_PLUGINS_DIR="$HOME/.tmux/plugins"
mkdir -p "$TMUX_PLUGINS_DIR"

# Install TPM (tmux plugin manager)
if [ ! -d "$TMUX_PLUGINS_DIR/tpm" ]; then
    echo "📦 Installing tmux plugin manager (TPM)..."
    git clone https://github.com/tmux-plugins/tpm "$TMUX_PLUGINS_DIR/tpm"
else
    echo "✅ TPM already installed"
fi

# Reload tmux config if tmux is running
if tmux info &> /dev/null; then
    echo "🔄 Reloading tmux configuration..."
    tmux source-file ~/.tmux.conf

    echo "📥 Installing tmux plugins..."
    # Install plugins automatically
    "$TMUX_PLUGINS_DIR/tpm/scripts/install_plugins.sh"
else
    echo "ℹ️  tmux is not running. Plugins will be installed when you start tmux."
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "   1. Start tmux: tmux new-session -s dev"
echo "   2. If plugins didn't auto-install, press: Prefix + I (usually Ctrl-b + I)"
echo "   3. Sessions will now auto-save every 15 minutes"
echo "   4. Sessions auto-restore when tmux starts"
echo ""
echo "🎮 Manual controls:"
echo "   • Prefix + Ctrl-s  →  Manual save"
echo "   • Prefix + Ctrl-r  →  Manual restore"
echo "   • Prefix + R       →  Reload tmux config"
echo ""
echo "🔍 Check status: tmux list-sessions"