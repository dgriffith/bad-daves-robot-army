# Bad Dave's Robot Army - Agent Installation Makefile
# Provides convenient shortcuts for installing Claude agents

.PHONY: help install install-global install-project setup dry-install

# Default target - show help
help:
	@echo "Bad Dave's Robot Army - Agent Installation Commands"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  install        - Install agents and commands globally to ~/.claude/"
	@echo "  install-project - Install to current project directory (./.claude/)"
	@echo "  setup          - Initial setup (create directories, set permissions)"
	@echo "  dry-install    - Preview what would be installed (dry run)"
	@echo ""
	@echo "Options:"
	@echo "  PROJECT=path   - Install to specific project directory"
	@echo "  ARGS='opts'    - Pass additional options to install script"
	@echo ""
	@echo "Examples:"
	@echo "  make install                     # Install globally"
	@echo "  make install PROJECT=/my/project # Install to specific project"
	@echo "  make install-project              # Install to current directory"
	@echo "  make dry-install                 # Preview installation"
	@echo "  make install ARGS='--force'      # Install without prompts"

# Install agents globally to ~/.claude/
install:
ifdef PROJECT
	@./scripts/install-agents.sh "$(PROJECT)" --verbose $(ARGS)
else
	@./scripts/install-agents.sh --verbose $(ARGS)
endif

# Install to current project directory
install-project:
	@./scripts/install-agents.sh . --verbose $(ARGS)

# Initial setup
setup:
	@echo "Setting up Bad Dave's Robot Army..."
	@mkdir -p subagents slash-commands scripts
	@chmod +x scripts/*.sh 2>/dev/null || true
	@echo "Setup complete! Run 'make install' to install agents"

# Preview installation without making changes
dry-install:
ifdef PROJECT
	@./scripts/install-agents.sh "$(PROJECT)" --dry-run --verbose
else
	@./scripts/install-agents.sh --dry-run --verbose
endif

# Development shortcuts
.PHONY: force-install clean-install

# Force installation without prompts
force-install:
ifdef PROJECT
	@./scripts/install-agents.sh "$(PROJECT)" --force --verbose
else
	@./scripts/install-agents.sh --force --verbose
endif

# Clean install (force overwrite)
clean-install: force-install