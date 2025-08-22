---
name: tooling-review
description: Analyze developer tooling and workflow to create an improvement plan
pattern: /tooling-review(?:\s+(.+))?
---

Using @agent-toolsmith prepare a tooling review report. You must analyze the developer experience, tooling, and workflows to create a comprehensive improvement plan WITHOUT making any changes.

## Input Parsing
The user invoked: /tooling-review {optional_scope}

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
1. First, assess current developer tooling and workflows
2. Identify pain points and inefficiencies
3. Find opportunities for automation and improvement
4. Create a prioritized tooling improvement plan
5. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Current Tooling Assessment**
   - Development environment setup
   - Build and test tools
   - IDE configurations
   - Version control workflows
   - CI/CD pipeline
   - Developer scripts and utilities

2. **Workflow Analysis**
   - Time from clone to first run
   - Common developer tasks
   - Repetitive manual processes
   - Debugging workflows
   - Deployment processes
   - Documentation accessibility

3. **Pain Points Identification**
   - Setup complexity
   - Build/test speed
   - Debugging difficulties
   - Missing automation
   - Tool fragmentation
   - Knowledge gaps

## Output Format
Create a markdown file at `/plans/tooling-review-{timestamp}.md` with:

```markdown
# Tooling Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of tooling state and improvement opportunities

## Current Developer Experience
### Setup Process
- Steps required: X
- Time to first run: Y minutes
- Common issues: List
- Documentation quality: Rating

### Daily Workflows
- Build time: X seconds
- Test execution: Y minutes
- Hot reload: Available/Missing
- Debugging tools: List

## Tooling Inventory
### Build Tools
- Build system: {tool} v{version}
- Package manager: {tool}
- Task runner: {tool}
- Bundler: {tool}

### Development Tools
- IDE support: List
- Linting: {tools}
- Formatting: {tools}
- Type checking: {tools}

### Testing & Quality
- Test runner: {tool}
- Coverage: {tool}
- Static analysis: {tools}
- Performance profiling: {tools}

## Pain Points & Inefficiencies
### Critical Issues
- [ ] Setup takes > 30 minutes
- [ ] No hot reload capability
- [ ] Manual deployment process

### Major Friction Points
- [ ] Slow test execution
- [ ] Complex debugging setup
- [ ] Inconsistent code formatting

### Minor Improvements
- [ ] Missing helpful scripts
- [ ] Outdated documentation
- [ ] No IDE templates

## Improvement Plan
### Quick Wins (1-3 days)
1. Add setup automation script
2. Create helpful aliases/shortcuts
3. Configure IDE settings
4. Add pre-commit hooks

### Major Improvements (1-2 weeks)
1. Implement hot reload
2. Optimize build pipeline
3. Add debugging helpers
4. Create CLI tools

### Transformative Changes (2-4 weeks)
1. Containerize development
2. Implement full CI/CD
3. Add performance monitoring
4. Create developer portal

## Automation Opportunities
### Immediate Automation
- [ ] Dependency installation
- [ ] Environment setup
- [ ] Code formatting
- [ ] Common tasks

### Build Process
- [ ] Incremental builds
- [ ] Parallel execution
- [ ] Cache optimization
- [ ] Asset optimization

### Testing
- [ ] Test selection
- [ ] Parallel test runs
- [ ] Automatic retries
- [ ] Coverage reporting

## Proposed Tools & Scripts
### New Tools
| Tool | Purpose | Benefit |
|------|---------|---------|
| Tool X | Build optimization | 50% faster builds |
| Tool Y | Code generation | Reduce boilerplate |

### Custom Scripts
- `dev-setup`: One-command setup
- `dev-test`: Smart test runner
- `dev-debug`: Debug helper
- `dev-deploy`: Deployment tool

## IDE Enhancements
### VS Code (or relevant IDE)
- Recommended extensions
- Workspace settings
- Debug configurations
- Task definitions

### Editor Agnostic
- EditorConfig setup
- Language server config
- Snippets/templates
- Keybinding suggestions

## Documentation Improvements
- [ ] Interactive setup guide
- [ ] Troubleshooting guide
- [ ] Video walkthroughs
- [ ] Architecture diagrams

## Success Metrics
### Before
- Setup time: X minutes
- Build time: Y seconds
- Test time: Z minutes
- TTFB (Time to first bug fix): A hours

### After (Projected)
- Setup time: < 5 minutes
- Build time: 50% reduction
- Test time: 70% reduction
- TTFB: 50% reduction

## Implementation Roadmap
### Week 1
- Implement quick wins
- Create setup automation
- Add essential scripts

### Week 2-3
- Optimize build pipeline
- Implement hot reload
- Add debugging tools

### Week 4
- Documentation overhaul
- Training materials
- Feedback collection

## Recommendations
- Adopt monorepo tooling
- Implement design system
- Add error tracking
- Create metrics dashboard

## Estimated Impact
- Developer productivity: +40%
- Onboarding time: -80%
- Build/test time: -60%
- Developer satisfaction: High
```

Remember: DO NOT make any changes. Only analyze and report.