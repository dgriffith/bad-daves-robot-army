#!/usr/bin/env bash
#
# sync-agents.sh - Sync Claude agents and commands between ~/.claude/ and repository
#
# Usage:
#   ./scripts/sync-agents.sh [command] [options]
#
# Commands:
#   pull     - Copy agents and commands from ~/.claude/ to repository
#   push     - Copy agents and commands from repository to ~/.claude/
#   sync     - Bidirectional sync (newer files win)
#   status   - Show sync status and differences
#   watch    - Watch for changes and auto-sync
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
SCRIPT_NAME=$(basename "$0")

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
    head -n 20 "$0" | grep '^#' | sed 's/^# \?//'
}

# Check if directories exist
check_directories() {
    if [[ ! -d "$CLAUDE_AGENTS_DIR" ]]; then
        error "Claude agents directory not found: $CLAUDE_AGENTS_DIR"
        echo "Creating directory..."
        mkdir -p "$CLAUDE_AGENTS_DIR"
    fi
    
    if [[ ! -d "$CLAUDE_COMMANDS_DIR" ]]; then
        error "Claude commands directory not found: $CLAUDE_COMMANDS_DIR"
        echo "Creating directory..."
        mkdir -p "$CLAUDE_COMMANDS_DIR"
    fi
    
    if [[ ! -d "$REPO_AGENTS_DIR" ]]; then
        error "Repository agents directory not found: $REPO_AGENTS_DIR"
        exit 1
    fi
    
    if [[ ! -d "$REPO_COMMANDS_DIR" ]]; then
        error "Repository commands directory not found: $REPO_COMMANDS_DIR"
        echo "Creating directory..."
        mkdir -p "$REPO_COMMANDS_DIR"
    fi
}

# Get file modification time in seconds
get_mtime() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        stat -f %m "$1" 2>/dev/null || echo 0
    else
        stat -c %Y "$1" 2>/dev/null || echo 0
    fi
}

# Compare two files and return which is newer
# Returns: 1 if first is newer, 2 if second is newer, 0 if same
compare_files() {
    local file1="$1"
    local file2="$2"
    
    if [[ ! -f "$file1" ]]; then
        return 2
    fi
    
    if [[ ! -f "$file2" ]]; then
        return 1
    fi
    
    local mtime1=$(get_mtime "$file1")
    local mtime2=$(get_mtime "$file2")
    
    if [[ $mtime1 -gt $mtime2 ]]; then
        return 1
    elif [[ $mtime2 -gt $mtime1 ]]; then
        return 2
    else
        # Check content
        if cmp -s "$file1" "$file2"; then
            return 0
        else
            # Different content, same mtime - prompt user
            return 3
        fi
    fi
}

# Copy a file with optional confirmation
copy_file() {
    local src="$1"
    local dst="$2"
    local action="$3"
    
    if [[ "$DRY_RUN" == true ]]; then
        echo "Would $action: $(basename "$src")"
        return
    fi
    
    if [[ -f "$dst" && "$FORCE" != true ]]; then
        set +e
        compare_files "$src" "$dst"
        local result=$?
        set -e
        
        if [[ $result -eq 0 ]]; then
            verbose "Skipping $(basename "$src") - files are identical"
            return
        elif [[ $result -eq 3 ]]; then
            warn "Conflict detected for $(basename "$src") - files have same timestamp but different content"
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
    success "$action: $(basename "$src")"
}

# Pull agents from Claude directory to repository
pull_agents() {
    log "Pulling agents from $CLAUDE_AGENTS_DIR to $REPO_AGENTS_DIR"
    
    local count=0
    for agent in "$CLAUDE_AGENTS_DIR"/*.md; do
        if [[ -f "$agent" ]]; then
            copy_file "$agent" "$REPO_AGENTS_DIR/$(basename "$agent")" "Pulled"
            ((count++)) || true
        fi
    done
    
    if [[ $count -eq 0 ]]; then
        warn "No agent files found in $CLAUDE_AGENTS_DIR"
    else
        success "Pulled $count agent(s)"
    fi
}

# Pull commands from Claude directory to repository
pull_commands() {
    log "Pulling commands from $CLAUDE_COMMANDS_DIR to $REPO_COMMANDS_DIR"
    
    local count=0
    for command in "$CLAUDE_COMMANDS_DIR"/*.md; do
        if [[ -f "$command" ]]; then
            copy_file "$command" "$REPO_COMMANDS_DIR/$(basename "$command")" "Pulled"
            ((count++)) || true
        fi
    done
    
    if [[ $count -eq 0 ]]; then
        warn "No command files found in $CLAUDE_COMMANDS_DIR"
    else
        success "Pulled $count command(s)"
    fi
}

# Pull both agents and commands
pull_all() {
    pull_agents
    pull_commands
}

# Push agents from repository to Claude directory
push_agents() {
    log "Pushing agents from $REPO_AGENTS_DIR to $CLAUDE_AGENTS_DIR"
    
    local count=0
    for agent in "$REPO_AGENTS_DIR"/*.md; do
        if [[ -f "$agent" ]]; then
            copy_file "$agent" "$CLAUDE_AGENTS_DIR/$(basename "$agent")" "Pushed"
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
            copy_file "$command" "$CLAUDE_COMMANDS_DIR/$(basename "$command")" "Pushed"
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

# Bidirectional sync for a single directory pair
sync_directory_pair() {
    local claude_dir="$1"
    local repo_dir="$2"
    local type="$3"
    
    # First, sync files that exist in both locations
    for file in "$repo_dir"/*.md; do
        if [[ -f "$file" ]]; then
            local basename=$(basename "$file")
            local claude_file="$claude_dir/$basename"
            
            if [[ -f "$claude_file" ]]; then
                set +e
                compare_files "$file" "$claude_file"
                local result=$?
                set -e
                
                case $result in
                    0)
                        verbose "Skipping $basename - files are identical"
                        ;;
                    1)
                        copy_file "$file" "$claude_file" "Updated in Claude dir"
                        ;;
                    2)
                        copy_file "$claude_file" "$file" "Updated in repo"
                        ;;
                    3)
                        warn "Conflict for $basename - manual resolution required"
                        ;;
                esac
            else
                copy_file "$file" "$claude_file" "Added to Claude dir"
            fi
        fi
    done
    
    # Then, copy files that only exist in Claude dir
    for file in "$claude_dir"/*.md; do
        if [[ -f "$file" ]]; then
            local basename=$(basename "$file")
            local repo_file="$repo_dir/$basename"
            
            if [[ ! -f "$repo_file" ]]; then
                copy_file "$file" "$repo_file" "Added to repo"
            fi
        fi
    done
}

# Bidirectional sync
sync_agents() {
    log "Performing bidirectional sync for agents"
    sync_directory_pair "$CLAUDE_AGENTS_DIR" "$REPO_AGENTS_DIR" "agent"
    success "Agent sync complete"
}

# Bidirectional sync for commands
sync_commands() {
    log "Performing bidirectional sync for commands"
    sync_directory_pair "$CLAUDE_COMMANDS_DIR" "$REPO_COMMANDS_DIR" "command"
    success "Command sync complete"
}

# Sync both agents and commands
sync_all() {
    log "Performing bidirectional sync"
    sync_agents
    sync_commands
    success "Full bidirectional sync complete"
}

# Show status for a directory pair
show_directory_status() {
    local claude_dir="$1"
    local repo_dir="$2"
    local type="$3"
    
    echo
    echo "${type} Status:"
    echo "Claude directory: $claude_dir"
    echo "Repository directory: $repo_dir"
    echo
    
    # List all unique files
    local all_files=()
    for file in "$claude_dir"/*.md "$repo_dir"/*.md; do
        if [[ -f "$file" ]]; then
            all_files+=("$(basename "$file")")
        fi
    done
    
    # Remove duplicates
    local unique_files=()
    while IFS= read -r file; do
        unique_files+=("$file")
    done < <(printf '%s\n' "${all_files[@]}" | sort -u)
    
    if [[ ${#unique_files[@]} -eq 0 ]]; then
        warn "No $type files found"
        return
    fi
    
    printf "%-30s %-20s %-20s %s\n" "$type" "Claude" "Repository" "Status"
    printf "%-30s %-20s %-20s %s\n" "-----" "------" "----------" "------"
    
    for file in "${unique_files[@]}"; do
        local claude_file="$claude_dir/$file"
        local repo_file="$repo_dir/$file"
        local claude_status="Missing"
        local repo_status="Missing"
        local sync_status=""
        
        if [[ -f "$claude_file" ]]; then
            if [[ "$OSTYPE" == "darwin"* ]]; then
                claude_status=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" "$claude_file" 2>/dev/null || echo "Present")
            else
                claude_status=$(date -r "$claude_file" "+%Y-%m-%d %H:%M" 2>/dev/null || echo "Present")
            fi
        fi
        
        if [[ -f "$repo_file" ]]; then
            if [[ "$OSTYPE" == "darwin"* ]]; then
                repo_status=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" "$repo_file" 2>/dev/null || echo "Present")
            else
                repo_status=$(date -r "$repo_file" "+%Y-%m-%d %H:%M" 2>/dev/null || echo "Present")
            fi
        fi
        
        if [[ -f "$claude_file" && -f "$repo_file" ]]; then
            set +e
            compare_files "$claude_file" "$repo_file"
            local result=$?
            set -e
            
            case $result in
                0) sync_status="${GREEN}In sync${NC}" ;;
                1) sync_status="${YELLOW}Claude newer${NC}" ;;
                2) sync_status="${YELLOW}Repo newer${NC}" ;;
                3) sync_status="${RED}Conflict${NC}" ;;
            esac
        elif [[ -f "$claude_file" ]]; then
            sync_status="${BLUE}Only in Claude${NC}"
        else
            sync_status="${BLUE}Only in repo${NC}"
        fi
        
        printf "%-30s %-20s %-20s %b\n" "$file" "$claude_status" "$repo_status" "$sync_status"
    done
}

# Show sync status
show_status() {
    log "Sync Status"
    
    # Show agent status
    show_directory_status "$CLAUDE_AGENTS_DIR" "$REPO_AGENTS_DIR" "Agent"
    
    # Show command status
    show_directory_status "$CLAUDE_COMMANDS_DIR" "$REPO_COMMANDS_DIR" "Command"
}

# Watch for changes
watch_all() {
    log "Watching for changes (Press Ctrl+C to stop)"
    
    if command -v fswatch >/dev/null 2>&1; then
        # Use fswatch if available (macOS with brew install fswatch)
        fswatch -o "$CLAUDE_AGENTS_DIR" "$REPO_AGENTS_DIR" "$CLAUDE_COMMANDS_DIR" "$REPO_COMMANDS_DIR" | while read -r event; do
            log "Change detected, syncing..."
            sync_all
            echo
        done
    elif command -v inotifywait >/dev/null 2>&1; then
        # Use inotify-tools on Linux
        while true; do
            inotifywait -r -e modify,create,delete,move "$CLAUDE_AGENTS_DIR" "$REPO_AGENTS_DIR" "$CLAUDE_COMMANDS_DIR" "$REPO_COMMANDS_DIR" >/dev/null 2>&1
            log "Change detected, syncing..."
            sync_all
            echo
        done
    else
        error "No file watching tool found. Install fswatch (macOS) or inotify-tools (Linux)"
        echo "Falling back to polling mode (checking every 5 seconds)"
        
        # Simple polling fallback
        local last_check=""
        while true; do
            local current_check=$(find "$CLAUDE_AGENTS_DIR" "$REPO_AGENTS_DIR" "$CLAUDE_COMMANDS_DIR" "$REPO_COMMANDS_DIR" -name "*.md" -exec stat -f %m {} \; 2>/dev/null | sort | md5)
            
            if [[ "$current_check" != "$last_check" ]]; then
                log "Change detected, syncing..."
                sync_all
                last_check="$current_check"
                echo
            fi
            
            sleep 5
        done
    fi
}

# Parse command line arguments
COMMAND=""
while [[ $# -gt 0 ]]; do
    case $1 in
        pull|push|sync|status|watch)
            COMMAND=$1
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
    error "No command specified"
    show_help
    exit 1
fi

case $COMMAND in
    pull)
        pull_all
        ;;
    push)
        push_all
        ;;
    sync)
        sync_all
        ;;
    status)
        show_status
        ;;
    watch)
        watch_all
        ;;
    *)
        error "Unknown command: $COMMAND"
        show_help
        exit 1
        ;;
esac