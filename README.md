# Bad Dave's Robot Army

Repository for Claude Code artifacts, including subagents, slash commands, and hooks

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Agent Installation Tooling

This repository includes tooling for installing Claude agents and commands from the repository to your local `~/.claude/` directory or to a specific project's `.claude/` directory.

### Quick Start

```bash
# Initial setup
make setup

# Install agents and commands globally to ~/.claude/
make install

# Install to a specific project directory
make install PROJECT=/path/to/project

# Install with options
make install ARGS='--dry-run --verbose'

# Install to current project directory
./scripts/install-agents.sh .
```

### Features

- **Global or project-specific installation** - Install to ~/.claude/ or to a specific project's .claude/
- **Selective overwriting** with confirmation prompts
- **Dry-run mode** for safe testing
- **Verbose output** for detailed operation logs
- **Force mode** to overwrite without prompting
- **Automatic directory creation**

### Install Script Usage

The main install script is located at `scripts/install-agents.sh`:

```bash
# Show help
./scripts/install-agents.sh --help

# Install globally to ~/.claude/
./scripts/install-agents.sh

# Install to a specific project directory
./scripts/install-agents.sh /path/to/project

# Install to current directory's project
./scripts/install-agents.sh .

# Options
--dry-run    # Show what would be done without making changes
--verbose    # Show detailed output
--force      # Overwrite without prompting
```

### Project-Specific Installation

You can install the agents and commands to a specific project's `.claude/` directory instead of the global `~/.claude/` directory:

```bash
# Install to a specific project
./scripts/install-agents.sh /path/to/my-project

# This will create:
# /path/to/my-project/.claude/agents/
# /path/to/my-project/.claude/commands/
```

This is useful when you want project-specific agents and commands that don't affect your global Claude configuration.

### Installation Directories

The install script creates and manages these directories:

- **Global installation**: `~/.claude/agents/` and `~/.claude/commands/`
- **Project installation**: `<project>/.claude/agents/` and `<project>/.claude/commands/`

### Safety Features

The install script includes several safety features:

- **Confirmation prompts** when overwriting existing files
- **File comparison** to skip identical files
- **Dry-run mode** to preview changes without making them
- **Force mode** for automated installations

### Best Practices

1. **Global installation**: Use `make install` for your personal development environment
2. **Project-specific**: Use `./scripts/install-agents.sh .` when working on a specific project
3. **Test first**: Use `--dry-run` to preview what will be installed
4. **CI/CD**: Use `--force` for automated deployments

### Troubleshooting

- **Permission errors**: Ensure scripts are executable with `chmod +x scripts/*.sh`
- **Directory not found**: The script automatically creates necessary directories
- **Overwrite prompts**: Use `--force` to skip confirmation prompts
- **Project directory**: Ensure the project directory exists before installing

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
