#!/usr/bin/env bash
#
# install-agents.sh - Install Claude agents and commands from repository to project
#
# Usage:
#   ./scripts/install-agents.sh [project_directory] [options]
#
# Arguments:
#   project_directory  Optional: Install to specific project's .claude directory
#                      If not specified, installs to ~/.claude/ globally
#
# Options:
#   -d, --dry-run    Show what would be done without making changes
#   -v, --verbose    Show detailed output
#   -f, --force      Overwrite without prompting
#   -h, --help       Show this help message

set -euo pipefail

# Default configuration
PROJECT_DIR=""
CLAUDE_BASE_DIR="$HOME/.claude"
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
    head -n 17 "$0" | grep '^#' | sed 's/^# \?//'
}

# Check if directories exist
check_directories() {
    if [[ ! -d "$CLAUDE_AGENTS_DIR" ]]; then
        log "Creating agents directory: $CLAUDE_AGENTS_DIR"
        mkdir -p "$CLAUDE_AGENTS_DIR"
    fi

    if [[ ! -d "$CLAUDE_COMMANDS_DIR" ]]; then
        log "Creating commands directory: $CLAUDE_COMMANDS_DIR"
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
        echo "Would install: $(basename "$src")"
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
    success "Installed: $(basename "$src")"
}

# Install agents from repository to Claude directory
install_agents() {
    log "Installing agents from $REPO_AGENTS_DIR to $CLAUDE_AGENTS_DIR"

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
        success "Installed $count agent(s)"
    fi
}

# Install commands from repository to Claude directory
install_commands() {
    log "Installing commands from $REPO_COMMANDS_DIR to $CLAUDE_COMMANDS_DIR"

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
        success "Installed $count command(s)"
    fi
}

# Install both agents and commands
install_all() {
    install_agents
    install_commands
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
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
        -*)
            error "Unknown option: $1"
            show_help
            exit 1
            ;;
        *)
            # If not an option, treat as project directory
            if [[ -z "$PROJECT_DIR" ]]; then
                PROJECT_DIR="$1"
            else
                error "Too many arguments: $1"
                show_help
                exit 1
            fi
            shift
            ;;
    esac
done

# Set up target directories based on whether project directory was specified
if [[ -n "$PROJECT_DIR" ]]; then
    # Validate project directory
    if [[ ! -d "$PROJECT_DIR" ]]; then
        error "Project directory does not exist: $PROJECT_DIR"
        exit 1
    fi

    # Convert to absolute path
    PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"
    CLAUDE_BASE_DIR="$PROJECT_DIR/.claude"
    log "Installing to project: $PROJECT_DIR"
    verbose "Claude directory: $CLAUDE_BASE_DIR"
else
    log "Installing globally to: $CLAUDE_BASE_DIR"
fi

# Set final directory paths
CLAUDE_AGENTS_DIR="$CLAUDE_BASE_DIR/agents"
CLAUDE_COMMANDS_DIR="$CLAUDE_BASE_DIR/commands"

# Main execution
check_directories
install_all