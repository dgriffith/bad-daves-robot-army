#!/usr/bin/env bash
#
# setup.sh - Quick setup script for Bad Dave's Robot Army
#
# This script sets up the environment and optionally installs agents

set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Setting up Bad Dave's Robot Army...${NC}"
echo

# Create necessary directories
echo "Creating directories..."
mkdir -p subagents slash-commands scripts

# Make scripts executable
echo "Making scripts executable..."
chmod +x scripts/*.sh 2>/dev/null || true
chmod +x setup.sh

# Remove git hooks section as we no longer have sync-related hooks

# Check if Claude directories exist
if [[ ! -d "$HOME/.claude" ]]; then
    echo -e "${YELLOW}Claude directory not found at ~/.claude${NC}"
    echo "Creating directories..."
    mkdir -p "$HOME/.claude/agents"
    mkdir -p "$HOME/.claude/commands"
fi

# Check if install script exists and is executable
if [[ -f "scripts/install-agents.sh" ]]; then
    if [[ ! -x "scripts/install-agents.sh" ]]; then
        chmod +x scripts/install-agents.sh
    fi
fi

echo
echo -e "${GREEN}Setup complete!${NC}"
echo
echo "Quick start commands:"
echo "  make install         - Install agents globally to ~/.claude/"
echo "  make install-project - Install to current project directory"
echo "  make dry-install     - Preview what would be installed"
echo
echo "Run 'make help' for all available commands"

# Optional: Ask if user wants to install agents now
echo
read -p "Do you want to install agents globally now? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing agents..."
    ./scripts/install-agents.sh --verbose
else
    echo "You can install agents later with 'make install'"
fi