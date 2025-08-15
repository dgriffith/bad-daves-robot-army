# Bad Dave's Robot Army

Repository for Claude Code artifacts, including subagents, slash commands, and hooks

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

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

## Slash Commands

This repository includes slash commands that invoke specialized subagents to analyze and create improvement plans for various aspects of your codebase. All commands generate reports in the `/plans` directory without making any changes to your code.

### Available Commands

#### `/doc-review [path]`
Analyzes documentation coverage and creates a comprehensive documentation improvement plan.
- **Scope**: Optional path parameter (file, directory, or module). Defaults to entire project.
- **Output**: `plans/documentation-review-{timestamp}.md`
- **Covers**: README files, inline comments, API docs, configuration guides, examples

#### `/refactor-review [path]`
Examines code quality and identifies refactoring opportunities.
- **Scope**: Optional path parameter. Defaults to entire project.
- **Output**: `plans/refactoring-review-{timestamp}.md`
- **Analyzes**: Code duplication, complexity, SOLID violations, naming clarity

#### `/security-review [path]`
Performs security analysis and creates a vulnerability mitigation plan.
- **Scope**: Optional path parameter. Defaults to entire project.
- **Output**: `plans/security-review-{timestamp}.md`
- **Checks**: Hardcoded secrets, injection risks, authentication issues, OWASP compliance

#### `/arch-review [path]`
Reviews architectural patterns and structural integrity.
- **Scope**: Optional path parameter. Defaults to entire project.
- **Output**: `plans/architecture-review-{timestamp}.md`
- **Evaluates**: Dependencies, SOLID principles, coupling, design patterns

#### `/test-review [path]`
Assesses test coverage and testing practices.
- **Scope**: Optional path parameter. Defaults to entire project.
- **Output**: `plans/testing-review-{timestamp}.md`
- **Measures**: Coverage metrics, test quality, missing test cases

#### `/perf-review [path]`
Identifies performance bottlenecks and optimization opportunities.
- **Scope**: Optional path parameter. Defaults to entire project.
- **Output**: `plans/performance-review-{timestamp}.md`
- **Finds**: Algorithm complexity issues, memory leaks, caching opportunities

#### `/modernization-review [path]`
Analyzes code for outdated patterns and creates a modernization roadmap.
- **Scope**: Optional path parameter. Defaults to entire project.
- **Output**: `plans/modernization-review-{timestamp}.md`
- **Identifies**: Deprecated APIs, legacy code, outdated dependencies, upgrade paths

#### `/tooling-review [path]`
Evaluates developer experience and identifies tooling improvements.
- **Scope**: Optional path parameter. Defaults to entire project.
- **Output**: `plans/tooling-review-{timestamp}.md`
- **Analyzes**: Setup complexity, build times, automation opportunities, workflow efficiency

### Usage Examples

```bash
# Review documentation for entire project
/doc-review

# Analyze refactoring needs for a specific module
/refactor-review src/services

# Security audit of authentication code
/security-review src/auth

# Architecture review of API layer
/arch-review src/api

# Test coverage analysis for utils
/test-review src/utils

# Performance review of data processing
/perf-review src/processors

# Modernization assessment for legacy module
/modernization-review src/legacy

# Developer tooling and workflow analysis
/tooling-review
```

### Plan Reports

All slash commands generate detailed markdown reports in the `/plans` directory containing:
- Executive summary of findings
- Current state analysis
- Prioritized improvement tasks
- Implementation strategies
- Effort estimates
- Risk assessments

These reports help you systematically improve your codebase by providing actionable, prioritized recommendations from specialized agents.
