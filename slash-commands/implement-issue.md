# implement-issue

Automatically implement a GitHub issue by pulling it down, solving it with the appropriate specialist agent, and creating a PR with the solution.

## Usage
```
/implement-issue {issue_number_or_url}
```

## Examples
- `/implement-issue 5` - Implement issue #5
- `/implement-issue https://github.com/owner/repo/issues/5` - Implement issue from URL

## Description
This command automates the entire workflow from issue to pull request:
1. Fetches the issue details from GitHub
2. Analyzes the issue to determine the appropriate specialist agent
3. Creates a feature branch for the implementation
4. Invokes the specialist agent to solve the issue
5. Validates that the project builds and tests pass
6. Commits the changes and pushes to remote
7. Creates a pull request linking back to the issue

## Workflow

### 1. Issue Retrieval
- Fetch issue details using `gh issue view`
- Parse issue body for implementation requirements
- Extract recommended specialist agent if specified
- Identify success criteria and dependencies

### 2. Branch Creation
- Create branch named `issue-{number}-{slug}`
- Switch to the new branch
- Ensure branch is up to date with main

### 3. Agent Selection
The command looks for agent recommendations in the issue body:
- Pattern: `@agent-{name}` or "handled by {agent}"
- Falls back to analyzing issue labels and content
- Maps issue types to appropriate specialists

### 4. Implementation
- Invoke the selected specialist agent with:
  - Issue description as context
  - Success criteria as requirements
  - Any code references or examples
- Agent performs the implementation autonomously

### 5. Validation
Before creating the PR, validate:
- All changes are syntactically correct
- Project builds successfully (if build command exists)
- All tests pass (if test command exists)
- Linting passes (if lint command exists)
- No merge conflicts with main branch

### 6. Commit and Push
- Stage all changes
- Create descriptive commit message referencing the issue
- Push branch to remote repository

### 7. Pull Request Creation
- Create PR with:
  - Title: "Fix #{issue_number}: {issue_title}"
  - Body: Links to issue, summarizes changes, includes test results
  - Labels: Inherits from issue
  - Reviewers: Auto-assigned if configured

## Agent Mapping

| Issue Labels/Keywords | Selected Agent |
|----------------------|----------------|
| security | @agent-security-master |
| performance | @agent-performance-optimizer |
| architecture | @agent-architect |
| documentation | @agent-code-documentor |
| test, testing | @agent-test-automator |
| refactor | @agent-refactorer |
| modernize, upgrade | @agent-code-modernizer |
| build, ci/cd | @agent-build-master |
| config, configuration | @agent-configuration-manager |
| bug, fix | @agent-debugger |
| error, exception | @agent-exception-handling-master |
| logging, logs | @agent-logging-master |
| tooling, dx | @agent-toolsmith |
| i18n, localization | @agent-internationalization-specialist |
| a11y, accessibility | @agent-accessibility-specialist |

## Error Handling

The command handles various failure scenarios:
- Issue not found: Prompts for valid issue number
- No specialist identified: Asks user to specify
- Build/test failures: Reports errors and asks for guidance
- Merge conflicts: Attempts automatic resolution or asks for help
- PR creation failure: Provides manual instructions

## Options

- `--no-tests`: Skip test validation
- `--no-build`: Skip build validation
- `--draft`: Create PR as draft
- `--agent {name}`: Override agent selection
- `--branch {name}`: Use custom branch name

## Example Output

```
Implementing issue #5: Create plugin validation system
✓ Fetched issue details
✓ Created branch: issue-5-plugin-validation
✓ Selected agent: @agent-test-automator
✓ Implementation in progress...
✓ Build successful
✓ Tests passing (15/15)
✓ Changes committed
✓ Branch pushed to remote
✓ Pull request created: #24

View PR: https://github.com/owner/repo/pull/24
```

## Requirements
- GitHub CLI (`gh`) must be installed and authenticated
- Git repository with GitHub remote
- Issues must be well-formed with clear requirements
- Appropriate specialist agents must be available
- Be sure to create any tags you wish for the issues before trying to create the issues

## Notes
- This command embodies the full DevOps cycle
- Reduces manual work from hours to minutes
- Ensures consistent quality through validation
- Maintains traceability between issues and PRs