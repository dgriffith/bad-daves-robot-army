# Bad Dave's Robot Army

Repository for Claude Code artifacts, including subagents, slash commands, and hooks

## Agent Sync Tooling

This repository includes comprehensive tooling for syncing Claude agents between your local `~/.claude/agents/` directory and the repository's `subagents/` directory.

### Quick Start

```bash
# Initial setup
make setup

# Check sync status
make status

# Pull agents from ~/.claude/agents/ to repository
make pull

# Push agents from repository to ~/.claude/agents/
make push

# Bidirectional sync (newer files win)
make sync

# Watch for changes and auto-sync
make watch
```

### Features

- **Bidirectional sync** with automatic conflict detection
- **Multiple sync modes**: pull, push, bidirectional sync
- **Watch mode** for automatic syncing during development
- **Git hooks** for sync reminders during commits
- **IntelliJ IDEA** run configurations
- **Dry-run mode** for safe testing
- **Detailed status reporting** with timestamps

### Sync Script Usage

The main sync script is located at `scripts/sync-agents.sh`:

```bash
# Show help
./scripts/sync-agents.sh --help

# Commands
./scripts/sync-agents.sh pull     # Copy from ~/.claude/agents/ to ./subagents/
./scripts/sync-agents.sh push     # Copy from ./subagents/ to ~/.claude/agents/
./scripts/sync-agents.sh sync     # Bidirectional sync (newer files win)
./scripts/sync-agents.sh status   # Show sync status and differences
./scripts/sync-agents.sh watch    # Watch for changes and auto-sync

# Options
--dry-run    # Show what would be done without making changes
--verbose    # Show detailed output
--force      # Overwrite without prompting
```

### IntelliJ IDEA Integration

The repository includes pre-configured run configurations for IntelliJ IDEA:

- **Sync Agents - Pull**: Pull agents from Claude directory
- **Sync Agents - Push**: Push agents to Claude directory
- **Sync Agents - Bidirectional**: Two-way sync
- **Sync Agents - Status**: Check sync status
- **Sync Agents - Watch**: Start watch mode

These will appear in your Run Configuration dropdown after opening the project.

### Git Hooks

The repository includes git hooks that help maintain sync:

- **pre-commit**: Warns if agents are out of sync when committing
- **post-merge**: Reminds to sync after pulling changes

Install hooks with: `make install-hooks`

### Configuration

You can customize sync behavior by editing `.sync-config`. This file allows you to:

- Override default directories
- Set conflict resolution strategy
- Configure auto-sync settings
- Enable backups
- Set up notifications

### Best Practices

1. **Before starting work**: Run `make pull` to get latest agents from Claude
2. **After editing agents**: Run `make push` to update Claude
3. **For continuous development**: Use `make watch` in a terminal
4. **Before committing**: Run `make status` to check sync state
5. **After pulling changes**: Run `make push` to update local Claude agents

### Troubleshooting

- **Permission errors**: Ensure scripts are executable with `chmod +x scripts/*.sh`
- **Directory not found**: The script will create `~/.claude/agents/` if it doesn't exist
- **Conflicts**: When files have same timestamp but different content, you'll be prompted
- **Watch mode on macOS**: Install `fswatch` with `brew install fswatch` for better performance
