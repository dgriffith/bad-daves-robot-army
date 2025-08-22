---
name: refactor-review
description: Analyze code quality and create a refactoring improvement plan
pattern: /refactor-review(?:\s+(.+))?
---

Using @agent-refactorer prepare a code quality review report. You must analyze refactoring opportunities in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /refactor-review {optional_scope}

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
1. First, understand the code structure and identify areas needing refactoring
2. Analyze code quality issues and improvement opportunities
3. Create a prioritized refactoring plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Code Quality Assessment**
   - Check for code duplication
   - Identify complex functions/methods
   - Find SOLID principle violations
   - Look for unclear naming
   - Spot long parameter lists
   - Detect deeply nested code

2. **Identify Refactoring Opportunities**
   - Extract method candidates
   - Duplicate code consolidation
   - Complex conditionals to simplify
   - Magic numbers to replace
   - Dead code to remove
   - Abstractions to introduce

3. **Risk and Impact Analysis**
   - Assess testing coverage
   - Identify high-risk refactorings
   - Estimate complexity of changes
   - Consider dependencies

## Output Format
Create a markdown file at `/plans/refactoring-review-{timestamp}.md` with:

```markdown
# Refactoring Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of code quality state and key findings

## Code Quality Metrics
- Duplication: X%
- Complex functions: Y
- Average function length: Z lines
- Key issues identified: N

## Refactoring Opportunities
### High Priority (Quick Wins)
- [ ] Extract method: functionName in file.ext
- [ ] Remove duplication: between fileA and fileB
- [ ] Simplify conditional: in functionX

### Medium Priority (Structural Improvements)
- [ ] Introduce abstraction for X
- [ ] Consolidate similar classes Y and Z
- [ ] Break down large class A

### Low Priority (Nice-to-Have)
- [ ] Rename variables for clarity
- [ ] Remove commented code
- [ ] Reorganize file structure

## Risk Assessment
### Safe Refactorings (Low Risk)
- List of refactorings with good test coverage

### Moderate Risk
- Refactorings requiring careful testing

### High Risk
- Major structural changes

## Implementation Strategy
1. Start with safe, high-impact refactorings
2. Ensure tests pass after each change
3. Review with team for major changes

## Estimated Effort
- Total refactoring tasks: X
- Quick wins: Y hours
- Major refactorings: Z hours
```

Remember: DO NOT make any changes. Only analyze and report.