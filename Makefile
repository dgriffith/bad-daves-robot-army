# Bad Dave's Robot Army - Agent Sync Makefile
# Provides convenient shortcuts for syncing Claude agents

.PHONY: help pull push sync status watch install-hooks setup

# Default target - show help
help:
	@echo "Bad Dave's Robot Army - Agent Sync Commands"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  pull        - Pull agents from ~/.claude/agents/ to repository"
	@echo "  push        - Push agents from repository to ~/.claude/agents/"
	@echo "  sync        - Bidirectional sync (newer files win)"
	@echo "  status      - Show sync status and differences"
	@echo "  watch       - Watch for changes and auto-sync"
	@echo "  setup       - Initial setup (install hooks, create directories)"
	@echo ""
	@echo "Options can be passed via ARGS variable:"
	@echo "  make pull ARGS='--dry-run'"
	@echo "  make sync ARGS='--verbose --force'"

# Pull agents from Claude directory to repository
pull:
	@./scripts/sync-agents.sh pull --verbose $(ARGS)

# Push agents from repository to Claude directory
push:
	@./scripts/sync-agents.sh push --verbose $(ARGS)

# Bidirectional sync
sync:
	@./scripts/sync-agents.sh sync --verbose $(ARGS)

# Show sync status
status:
	@./scripts/sync-agents.sh status $(ARGS)

# Watch for changes
watch:
	@./scripts/sync-agents.sh watch $(ARGS)

# Install git hooks
install-hooks:
	@echo "Installing git hooks..."
	@mkdir -p .git/hooks
	@cp scripts/hooks/* .git/hooks/ 2>/dev/null || echo "No hooks to install yet"
	@chmod +x .git/hooks/* 2>/dev/null || true
	@echo "Git hooks installed successfully"

# Initial setup
setup: install-hooks
	@echo "Setting up Bad Dave's Robot Army..."
	@mkdir -p subagents scripts/hooks
	@chmod +x scripts/*.sh 2>/dev/null || true
	@echo "Setup complete! Run 'make status' to check agent sync status"

# Quick sync before commit (used by git hook)
pre-commit-sync:
	@echo "Checking agent sync status..."
	@./scripts/sync-agents.sh status | grep -E "(Only in|newer|Conflict)" || true

# Development shortcuts
.PHONY: dry-pull dry-push dry-sync

dry-pull:
	@./scripts/sync-agents.sh pull --dry-run --verbose

dry-push:
	@./scripts/sync-agents.sh push --dry-run --verbose

dry-sync:
	@./scripts/sync-agents.sh sync --dry-run --verbose