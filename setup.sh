#!/usr/bin/env bash
#
# setup.sh - Quick setup script for Bad Dave's Robot Army
#
# This script sets up the development environment after cloning the repository

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
mkdir -p subagents scripts/hooks .git/hooks

# Make scripts executable
echo "Making scripts executable..."
chmod +x scripts/*.sh 2>/dev/null || true
chmod +x setup.sh

# Install git hooks
echo "Installing git hooks..."
cp scripts/hooks/* .git/hooks/ 2>/dev/null || true
chmod +x .git/hooks/* 2>/dev/null || true

# Check if Claude agents directory exists
if [[ ! -d "$HOME/.claude/agents" ]]; then
    echo -e "${YELLOW}Claude agents directory not found at ~/.claude/agents${NC}"
    echo "Creating directory..."
    mkdir -p "$HOME/.claude/agents"
fi

# Check for fswatch (macOS) or inotify-tools (Linux)
echo "Checking for file watching tools..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! command -v fswatch >/dev/null 2>&1; then
        echo -e "${YELLOW}fswatch not found. Install with: brew install fswatch${NC}"
        echo "This is optional but improves watch mode performance"
    else
        echo -e "${GREEN}fswatch found${NC}"
    fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if ! command -v inotifywait >/dev/null 2>&1; then
        echo -e "${YELLOW}inotify-tools not found. Install with: sudo apt-get install inotify-tools${NC}"
        echo "This is optional but improves watch mode performance"
    else
        echo -e "${GREEN}inotify-tools found${NC}"
    fi
fi

echo
echo -e "${GREEN}Setup complete!${NC}"
echo
echo "Quick start commands:"
echo "  make status  - Check agent sync status"
echo "  make pull    - Pull agents from ~/.claude/agents/"
echo "  make push    - Push agents to ~/.claude/agents/"
echo "  make sync    - Bidirectional sync"
echo "  make watch   - Watch for changes"
echo
echo "Run 'make help' for all available commands"

# Show current sync status
echo
echo "Current sync status:"
./scripts/sync-agents.sh status