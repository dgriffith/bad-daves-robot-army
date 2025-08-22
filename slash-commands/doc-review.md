---
name: doc-review
description: Analyze documentation needs and create a documentation improvement plan
pattern: /doc-review(?:\s+(.+))?
---

Using @agent-code-documentor prepare a documentation review report. You must analyze the documentation needs of the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /doc-review {optional_scope}

Valid scopes:
- **No argument**: Analyze the entire project
- **File/directory path**: Scope analysis to that specific path
- **"current changes"**: Analyze uncommitted changes (use `git status` and `git diff`)
- **"recent changes"**: Analyze recent commits (use `git log` and `git diff`)
- **"PR #123"**: Analyze a specific pull request (use `gh pr view` and `gh pr diff`)

### Scope Resolution
1. If scope is "current changes":
   - Use `git status` to identify changed files
   - Use `git diff` to see uncommitted changes
   - Focus analysis on modified code only

2. If scope is "recent changes":
   - Use `git log --oneline -10` to see recent commits
   - Use `git diff HEAD~5..HEAD` or appropriate range
   - Analyze changes from recent development

3. If scope starts with "PR":
   - Extract PR number from the scope
   - Use `gh pr view {number}` to get PR details
   - Use `gh pr diff {number}` to get the changes
   - Focus on files changed in the PR

4. If scope is a path:
   - Verify the path exists
   - Scope analysis to that path

5. If no scope provided:
   - Analyze the entire project

## Your Task
1. First, understand the project structure and current documentation state
2. Identify gaps in documentation coverage
3. Create a prioritized plan for documentation improvements
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Survey Current Documentation**
   - Check for README files
   - Look for inline comments and docstrings
   - Identify API documentation
   - Find configuration documentation
   - Review any existing documentation directories

2. **Identify Documentation Gaps**
   - Undocumented public APIs
   - Missing setup/installation instructions
   - Lacking code examples
   - Absent architecture documentation
   - Missing configuration guides
   - No troubleshooting sections

3. **Prioritize Documentation Needs**
   - Critical: User-facing documentation
   - High: API documentation
   - Medium: Internal documentation
   - Low: Nice-to-have improvements

## Output Format
Create a markdown file at `/plans/documentation-review-{timestamp}.md` with:

```markdown
# Documentation Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of documentation state and key findings

## Current Documentation Coverage
### Existing Documentation
- List of documented areas
- Quality assessment

### Documentation Gaps
- Critical gaps
- Important missing pieces
- Nice-to-have additions

## Prioritized Action Plan
### Priority 1: Critical Documentation
- [ ] Task 1
- [ ] Task 2

### Priority 2: Important Documentation
- [ ] Task 1
- [ ] Task 2

### Priority 3: Nice-to-Have
- [ ] Task 1
- [ ] Task 2

## Recommendations
- Documentation standards to adopt
- Tools or frameworks to consider
- Maintenance processes

## Estimated Effort
- Total documentation tasks: X
- Estimated time: Y hours
```

Remember: DO NOT make any changes. Only analyze and report.