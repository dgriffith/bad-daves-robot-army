# Bad Dave's Robot Army

Your elite development force - a comprehensive suite of specialized AI agents and slash commands for Claude Code that supercharge your development workflow.

## 🚀 Quick Start

**New to the Robot Army?** Read the [Robot Army Guide](docs/ROBOT_ARMY_GUIDE.md) for comprehensive documentation, workflows, and battle-tested tactics.

**Ready to deploy?** Install the agents and commands:

```bash
# Initial setup
make setup

# Install globally to ~/.claude/
make install

# Install to a specific project
make install PROJECT=/path/to/project
```

## 🎯 What's Inside

This repository includes **34+ slash commands** and specialized subagents organized into:

- **Review & Analysis Commands** - Security, performance, architecture, testing, quality audits
- **Code Intelligence Commands** - History analysis, evolution tracking, codebase understanding
- **Development Workflow Commands** - PRD creation, implementation planning, issue decomposition
- **Learning & Documentation Commands** - Explanations, mentoring, fresh perspectives
- **Specialized Agents** - API design, database optimization, cloud architecture, and more

See the [Robot Army Guide](docs/ROBOT_ARMY_GUIDE.md) for the complete arsenal and usage examples.

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

## 📚 Command Categories

For complete documentation, workflows, and advanced tactics, see the [Robot Army Guide](docs/ROBOT_ARMY_GUIDE.md).

### Review & Analysis Commands

Comprehensive code analysis and improvement planning:

- `/security-review [scope]` - Security vulnerabilities and mitigation plans
- `/perf-review [scope]` - Performance bottlenecks and optimization
- `/arch-review [scope]` - Architectural patterns and design quality
- `/test-review [scope]` - Test coverage and quality assessment
- `/quality-review [scope]` - Overall code quality analysis
- `/refactor-review [scope]` - Code improvement opportunities
- `/doc-review [scope]` - Documentation coverage and clarity
- `/accessibility-review [scope]` - WCAG compliance and usability
- `/database-review [scope]` - Schema design and query optimization
- `/api-review [scope]` - API design consistency and best practices
- `/build-review [scope]` - Build system and CI/CD optimization
- `/deployment-review [scope]` - Deployment process improvements
- `/cloud-review [scope]` - AWS cloud architecture analysis
- `/concurrency-review [scope]` - Thread safety and async patterns
- `/configuration-review [scope]` - Configuration management security
- `/internationalization-review [scope]` - i18n readiness assessment
- `/logging-review [scope]` - Logging and observability practices
- `/modernization-review [scope]` - Legacy code upgrade paths
- `/tooling-review [scope]` - Developer experience improvements

### Code Intelligence & History

Understanding code evolution and patterns:

- `/code-history [scope]` - Executive summary of code evolution (quick insights)
- `/code-history-detailed [scope]` - Comprehensive historical analysis (deep dive)
- `/codebase-overview` - Beginner-friendly project overview
- `/explain [topic]` - Personalized explanations of code/concepts

### Development Workflow

End-to-end feature development:

- `/create-prd [requirements]` - Generate product requirements document
- `/process-prd-feedback [feedback]` - Incorporate stakeholder feedback into PRD
- `/implementation-plan-from-prd [prd-file]` - Create technical implementation plan
- `/process-implementation-plan-feedback [feedback]` - Refine implementation plan
- `/tasks-from-plan [plan-file]` - Generate GitHub issues from plan
- `/decompose-issue [issue-number]` - Break down complex issues
- `/implement-issue [issue-number]` - Implement GitHub issue with appropriate specialist

### Learning & Documentation

Knowledge transfer and understanding:

- `/learn [topic]` - Create personalized learning path
- `/beginners-mind [topic]` - Approach with fresh curiosity and questions
- `/bad-daves-robot-army` - Display the complete Robot Army Guide


### Quick Examples

```bash
# Understand a new codebase
/codebase-overview

# Full feature workflow
/create-prd requirements.md
/implementation-plan-from-prd plans/prd-*.md
/tasks-from-plan plans/implementation-plan-*.md
/implement-issue 101

# Code quality blitz
/security-review "current changes"
/perf-review src/slow-module
/quality-review

# Understand code evolution
/code-history hotspots
/code-history-detailed src/auth.ts
```

### Scope Modifiers

Most review commands support flexible scoping:

- **No argument** - Analyze entire project
- **Path** - Specific file or directory
- **"current changes"** - Uncommitted changes only
- **"recent changes"** - Recent commits
- **"PR #123"** - Specific pull request

### Output Locations

- **Review commands** → `/plans/` directory
- **Learning commands** → `/reports/` directory
- **Implementation** → Direct code changes with commits
