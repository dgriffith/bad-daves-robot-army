#!/usr/bin/env bash
#
# sync-agents.sh - Push Claude agents and commands from repository to ~/.claude/
#
# Usage:
#   ./scripts/sync-agents.sh push [options]
#
# Options:
#   -d, --dry-run    Show what would be done without making changes
#   -v, --verbose    Show detailed output
#   -f, --force      Overwrite without prompting
#   -h, --help       Show this help message

set -euo pipefail

# Configuration
CLAUDE_AGENTS_DIR="$HOME/.claude/agents"
CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"
REPO_AGENTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/subagents"
REPO_COMMANDS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/slash-commands"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default options
DRY_RUN=false
VERBOSE=false
FORCE=false

# Helper functions
log() {
    echo -e "${BLUE}[INFO]${NC} $*"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $*"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $*"
}

error() {
    echo -e "${RED}[ERROR]${NC} $*" >&2
}

verbose() {
    if [[ "$VERBOSE" == true ]]; then
        echo -e "${BLUE}[VERBOSE]${NC} $*"
    fi
}

show_help() {
    head -n 13 "$0" | grep '^#' | sed 's/^# \?//'
}

# Check if directories exist
check_directories() {
    if [[ ! -d "$CLAUDE_AGENTS_DIR" ]]; then
        warn "Claude agents directory not found: $CLAUDE_AGENTS_DIR"
        echo "Creating directory..."
        mkdir -p "$CLAUDE_AGENTS_DIR"
    fi
    
    if [[ ! -d "$CLAUDE_COMMANDS_DIR" ]]; then
        warn "Claude commands directory not found: $CLAUDE_COMMANDS_DIR"
        echo "Creating directory..."
        mkdir -p "$CLAUDE_COMMANDS_DIR"
    fi
    
    if [[ ! -d "$REPO_AGENTS_DIR" ]]; then
        warn "Repository agents directory not found: $REPO_AGENTS_DIR"
        echo "Creating directory..."
        mkdir -p "$REPO_AGENTS_DIR"
    fi
    
    if [[ ! -d "$REPO_COMMANDS_DIR" ]]; then
        warn "Repository commands directory not found: $REPO_COMMANDS_DIR"
        echo "Creating directory..."
        mkdir -p "$REPO_COMMANDS_DIR"
    fi
}

# Copy a file with optional confirmation
copy_file() {
    local src="$1"
    local dst="$2"
    
    if [[ "$DRY_RUN" == true ]]; then
        echo "Would push: $(basename "$src")"
        return
    fi
    
    if [[ -f "$dst" && "$FORCE" != true ]]; then
        # Check if files are different
        if cmp -s "$src" "$dst"; then
            verbose "Skipping $(basename "$src") - files are identical"
            return
        else
            warn "File $(basename "$src") exists and differs"
            if [[ ! -t 0 ]]; then
                error "Cannot prompt for confirmation in non-interactive mode. Use --force to overwrite."
                return 1
            fi
            read -p "Overwrite? (y/N) " -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                verbose "Skipping $(basename "$src")"
                return
            fi
        fi
    fi
    
    verbose "Copying $(basename "$src")"
    cp "$src" "$dst"
    success "Pushed: $(basename "$src")"
}

# Push agents from repository to Claude directory
push_agents() {
    log "Pushing agents from $REPO_AGENTS_DIR to $CLAUDE_AGENTS_DIR"
    
    local count=0
    for agent in "$REPO_AGENTS_DIR"/*.md; do
        if [[ -f "$agent" ]]; then
            copy_file "$agent" "$CLAUDE_AGENTS_DIR/$(basename "$agent")"
            ((count++)) || true
        fi
    done
    
    if [[ $count -eq 0 ]]; then
        warn "No agent files found in $REPO_AGENTS_DIR"
    else
        success "Pushed $count agent(s)"
    fi
}

# Push commands from repository to Claude directory
push_commands() {
    log "Pushing commands from $REPO_COMMANDS_DIR to $CLAUDE_COMMANDS_DIR"
    
    local count=0
    for command in "$REPO_COMMANDS_DIR"/*.md; do
        if [[ -f "$command" ]]; then
            copy_file "$command" "$CLAUDE_COMMANDS_DIR/$(basename "$command")"
            ((count++)) || true
        fi
    done
    
    if [[ $count -eq 0 ]]; then
        warn "No command files found in $REPO_COMMANDS_DIR"
    else
        success "Pushed $count command(s)"
    fi
}

# Push both agents and commands
push_all() {
    push_agents
    push_commands
}

# Parse command line arguments
COMMAND=""
while [[ $# -gt 0 ]]; do
    case $1 in
        push)
            COMMAND=push
            shift
            ;;
        -d|--dry-run)
            DRY_RUN=true
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -f|--force)
            FORCE=true
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            error "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Main execution
check_directories

if [[ -z "$COMMAND" ]]; then
    # Default to push if no command specified
    COMMAND=push
fi

if [[ "$COMMAND" == "push" ]]; then
    push_all
else
    error "Invalid command. Only 'push' is supported."
    show_help
    exit 1
fi