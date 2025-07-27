#!/usr/bin/env bash
#
# sync-agents.sh - Sync Claude agents between ~/.claude/agents/ and ./subagents/
#
# Usage:
#   ./scripts/sync-agents.sh [command] [options]
#
# Commands:
#   pull     - Copy agents from ~/.claude/agents/ to ./subagents/
#   push     - Copy agents from ./subagents/ to ~/.claude/agents/
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
REPO_AGENTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/subagents"
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
    
    if [[ ! -d "$REPO_AGENTS_DIR" ]]; then
        error "Repository agents directory not found: $REPO_AGENTS_DIR"
        exit 1
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
        compare_files "$src" "$dst"
        local result=$?
        
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

# Bidirectional sync
sync_agents() {
    log "Performing bidirectional sync"
    
    # First, sync files that exist in both locations
    for agent in "$REPO_AGENTS_DIR"/*.md; do
        if [[ -f "$agent" ]]; then
            local basename=$(basename "$agent")
            local claude_file="$CLAUDE_AGENTS_DIR/$basename"
            
            if [[ -f "$claude_file" ]]; then
                compare_files "$agent" "$claude_file"
                local result=$?
                
                case $result in
                    0)
                        verbose "Skipping $basename - files are identical"
                        ;;
                    1)
                        copy_file "$agent" "$claude_file" "Updated in Claude dir"
                        ;;
                    2)
                        copy_file "$claude_file" "$agent" "Updated in repo"
                        ;;
                    3)
                        warn "Conflict for $basename - manual resolution required"
                        ;;
                esac
            else
                copy_file "$agent" "$claude_file" "Added to Claude dir"
            fi
        fi
    done
    
    # Then, copy files that only exist in Claude dir
    for agent in "$CLAUDE_AGENTS_DIR"/*.md; do
        if [[ -f "$agent" ]]; then
            local basename=$(basename "$agent")
            local repo_file="$REPO_AGENTS_DIR/$basename"
            
            if [[ ! -f "$repo_file" ]]; then
                copy_file "$agent" "$repo_file" "Added to repo"
            fi
        fi
    done
    
    success "Bidirectional sync complete"
}

# Show sync status
show_status() {
    log "Sync Status"
    echo
    echo "Claude agents directory: $CLAUDE_AGENTS_DIR"
    echo "Repository agents directory: $REPO_AGENTS_DIR"
    echo
    
    # List all unique agent files
    local all_agents=()
    for agent in "$CLAUDE_AGENTS_DIR"/*.md "$REPO_AGENTS_DIR"/*.md; do
        if [[ -f "$agent" ]]; then
            all_agents+=("$(basename "$agent")")
        fi
    done
    
    # Remove duplicates
    local unique_agents=()
    while IFS= read -r agent; do
        unique_agents+=("$agent")
    done < <(printf '%s\n' "${all_agents[@]}" | sort -u)
    
    if [[ ${#unique_agents[@]} -eq 0 ]]; then
        warn "No agent files found"
        return
    fi
    
    printf "%-30s %-20s %-20s %s\n" "Agent" "Claude" "Repository" "Status"
    printf "%-30s %-20s %-20s %s\n" "-----" "------" "----------" "------"
    
    for agent in "${unique_agents[@]}"; do
        local claude_file="$CLAUDE_AGENTS_DIR/$agent"
        local repo_file="$REPO_AGENTS_DIR/$agent"
        local claude_status="Missing"
        local repo_status="Missing"
        local sync_status=""
        
        if [[ -f "$claude_file" ]]; then
            claude_status=$(date -r "$claude_file" "+%Y-%m-%d %H:%M" 2>/dev/null || echo "Present")
        fi
        
        if [[ -f "$repo_file" ]]; then
            repo_status=$(date -r "$repo_file" "+%Y-%m-%d %H:%M" 2>/dev/null || echo "Present")
        fi
        
        if [[ -f "$claude_file" && -f "$repo_file" ]]; then
            compare_files "$claude_file" "$repo_file"
            local result=$?
            
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
        
        printf "%-30s %-20s %-20s %b\n" "$agent" "$claude_status" "$repo_status" "$sync_status"
    done
}

# Watch for changes
watch_agents() {
    log "Watching for changes (Press Ctrl+C to stop)"
    
    if command -v fswatch >/dev/null 2>&1; then
        # Use fswatch if available (macOS with brew install fswatch)
        fswatch -o "$CLAUDE_AGENTS_DIR" "$REPO_AGENTS_DIR" | while read -r event; do
            log "Change detected, syncing..."
            sync_agents
            echo
        done
    elif command -v inotifywait >/dev/null 2>&1; then
        # Use inotify-tools on Linux
        while true; do
            inotifywait -r -e modify,create,delete,move "$CLAUDE_AGENTS_DIR" "$REPO_AGENTS_DIR" >/dev/null 2>&1
            log "Change detected, syncing..."
            sync_agents
            echo
        done
    else
        error "No file watching tool found. Install fswatch (macOS) or inotify-tools (Linux)"
        echo "Falling back to polling mode (checking every 5 seconds)"
        
        # Simple polling fallback
        local last_check=""
        while true; do
            local current_check=$(find "$CLAUDE_AGENTS_DIR" "$REPO_AGENTS_DIR" -name "*.md" -exec stat -f %m {} \; 2>/dev/null | sort | md5)
            
            if [[ "$current_check" != "$last_check" ]]; then
                log "Change detected, syncing..."
                sync_agents
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
        pull_agents
        ;;
    push)
        push_agents
        ;;
    sync)
        sync_agents
        ;;
    status)
        show_status
        ;;
    watch)
        watch_agents
        ;;
    *)
        error "Unknown command: $COMMAND"
        show_help
        exit 1
        ;;
esac