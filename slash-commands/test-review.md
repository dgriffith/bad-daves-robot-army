---
name: test-review
description: Analyze test coverage and create a testing improvement plan
pattern: /test-review(?:\s+(.+))?
---

Using @agent-test-case-developer prepare a testing review report. You must analyze the test coverage and testing practices in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /test-review {optional_scope}

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
1. First, understand the current testing setup and coverage
2. Identify gaps in test coverage and testing practices
3. Create a prioritized testing improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Test Coverage Assessment**
   - Measure current test coverage
   - Identify untested code paths
   - Review test quality
   - Check for test types (unit, integration, e2e)
   - Analyze test maintainability

2. **Testing Gaps Analysis**
   - Critical functionality without tests
   - Edge cases not covered
   - Error scenarios untested
   - Missing integration tests
   - Absent performance tests

3. **Testing Practice Review**
   - Test organization
   - Naming conventions
   - Mock/stub usage
   - Test data management
   - CI/CD integration

## Output Format
Create a markdown file at `/plans/testing-review-{timestamp}.md` with:

```markdown
# Testing Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of testing state and key findings

## Current Testing Status
### Coverage Metrics
- Overall coverage: X%
- Unit test coverage: Y%
- Integration test coverage: Z%
- Critical paths covered: N%

### Test Distribution
- Unit tests: X
- Integration tests: Y
- E2E tests: Z
- Performance tests: N

## Testing Gaps
### Critical Gaps (Untested Core Features)
- [ ] Feature/Function X: No tests
- [ ] Critical path Y: Partial coverage

### High Priority Gaps
- [ ] Error handling: Module X
- [ ] Edge cases: Function Y

### Medium Priority Gaps
- [ ] Integration: Between A and B
- [ ] Performance: Component C

## Test Quality Issues
### Test Maintenance Problems
- Brittle tests in X
- Outdated tests in Y
- Flaky tests in Z

### Test Design Issues
- Over-mocking in tests for A
- Unclear test names in B
- Missing assertions in C

## Testing Improvement Plan
### Phase 1: Critical Coverage (Week 1-2)
1. Add tests for critical feature X
2. Cover error paths in module Y
3. Create integration tests for Z

### Phase 2: Comprehensive Coverage (Week 3-4)
1. Increase unit test coverage to 80%
2. Add edge case tests
3. Implement E2E test suite

### Phase 3: Quality Improvements (Week 5-6)
1. Refactor brittle tests
2. Standardize test structure
3. Improve test documentation

## Test Strategy Recommendations
### Testing Pyramid
- Unit Tests: 70%
- Integration Tests: 20%
- E2E Tests: 10%

### Best Practices to Implement
- Test naming standards
- Test data factories
- Continuous test review
- Coverage monitoring

## Implementation Approach
1. Start with critical untested paths
2. Add tests with each bug fix
3. Refactor tests alongside code
4. Monitor coverage trends

## Tooling Recommendations
- Coverage tools: [Suggestions]
- Test runners: [Suggestions]
- Mocking libraries: [Suggestions]

## Estimated Effort
- Critical gaps: X hours
- Full coverage: Y days
- Quality improvements: Z days
- Total effort: N days
```

Remember: DO NOT make any changes. Only analyze and report.