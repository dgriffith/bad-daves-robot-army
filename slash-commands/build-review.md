---
name: build-review
description: Analyze build systems and CI/CD pipelines to identify optimization opportunities
pattern: /build-review(?:\s+(.+))?
---

Using @agent-build-master prepare a comprehensive build and CI/CD review report. You must analyze build performance, dependency management, pipeline efficiency, and deployment processes WITHOUT making any changes.

## Input Parsing
The user invoked: /build-review {optional_scope}

Valid scopes:
- **No argument**: Analyze the entire project's build system
- **File/directory path**: Scope analysis to that specific path
- **"current changes"**: Analyze uncommitted changes (use `git status` and `git diff`)
- **"recent changes"**: Analyze recent commits (use `git log` and `git diff`)
- **"PR #123"**: Analyze a specific pull request (use `gh pr view` and `gh pr diff`)

### Scope Resolution
1. If scope is "current changes":
   - Use `git status` to identify changed files
   - Use `git diff` to see uncommitted changes
   - Focus analysis on build-related changes only

2. If scope is "recent changes":
   - Use `git log --oneline -10` to see recent commits
   - Use `git diff HEAD~5..HEAD` or appropriate range
   - Analyze build system changes from recent development

3. If scope starts with "PR":
   - Extract PR number from the scope
   - Use `gh pr view {number}` to get PR details
   - Use `gh pr diff {number}` to get the changes
   - Focus on build files changed in the PR

4. If scope is a path:
   - Verify the path exists
   - Scope analysis to that path

5. If no scope provided:
   - Analyze the entire project's build system

## Your Task
1. First, understand the build system architecture and CI/CD setup
2. Analyze build performance, efficiency, and optimization opportunities
3. Create a prioritized build improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Build System Assessment**
   - Identify build tools (webpack, rollup, vite, gradle, maven, etc.)
   - Analyze build configuration files
   - Check dependency management practices
   - Review build scripts and automation
   - Assess build artifact generation
   - Evaluate build caching strategies

2. **CI/CD Pipeline Review**
   - Examine CI configuration files (.github/workflows, .gitlab-ci.yml, etc.)
   - Review pipeline stages and job dependencies
   - Analyze parallel execution opportunities
   - Check deployment automation
   - Evaluate environment management
   - Review rollback strategies

3. **Performance Analysis**
   - Build time measurement and bottlenecks
   - Bundle size optimization opportunities
   - Dependency analysis and tree shaking
   - Cache effectiveness
   - Resource utilization during builds
   - Pipeline execution time

4. **Best Practices Review**
   - Multi-stage build implementations
   - Environment-specific configurations
   - Secrets and environment variable management
   - Test integration within pipelines
   - Artifact storage and versioning
   - Monitoring and alerting setup

## Output Format
Create a markdown file at `/plans/build-review-{timestamp}.md` with:

```markdown
# Build System Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of build system health, performance metrics, and critical optimization opportunities

## Build System Findings
### Critical Issues
- [ ] Performance blocker: Description and impact
- [ ] Pipeline failure risk: Description and location

### High Priority Optimizations
- [ ] Build time improvement: Details and potential savings
- [ ] Dependency issue: Details and resolution

### Medium Priority Issues
- [ ] Caching optimization: Details
- [ ] Configuration improvement: Details

### Low Priority Enhancements
- [ ] Minor optimization: Details

## Current State Analysis
### Build Tools and Configuration
- Primary build tool: {tool_name}
- Build time: {current_time}
- Bundle size: {current_size}
- Cache hit ratio: {percentage}

### CI/CD Pipeline Status
- Pipeline execution time: {duration}
- Success rate: {percentage}
- Parallel job utilization: {assessment}
- Deployment frequency: {frequency}

### Dependencies
- Total dependencies: {count}
- Outdated packages: {count}
- Security vulnerabilities: {count}
- Bundle impact analysis: {findings}

## Build Performance Metrics
- Cold build time: {duration}
- Incremental build time: {duration}
- Test execution time: {duration}
- Pipeline total time: {duration}
- Cache effectiveness: {percentage}

## Improvement Plan
### Immediate Actions (Critical)
1. Fix pipeline stability issue X
2. Implement build caching for Y

### Short-term (1-2 weeks)
1. Optimize bundle splitting
2. Parallel test execution
3. Update build tool configuration

### Long-term Improvements (1+ months)
1. Migrate to faster build tool
2. Implement advanced caching strategies
3. Set up build monitoring and alerts

## CI/CD Pipeline Optimization
### Current Pipeline Analysis
- Stages: {list_of_stages}
- Bottlenecks: {identified_issues}
- Parallelization opportunities: {details}

### Recommended Improvements
- Pipeline restructuring: {recommendations}
- Job optimization: {specific_changes}
- Environment management: {improvements}

## Dependency Management
### Current State
- Package manager: {npm/yarn/pnpm/etc}
- Lock file status: {analysis}
- Update strategy: {current_approach}

### Recommendations
- Dependency updates: {strategy}
- Bundle optimization: {techniques}
- Security patches: {priority_list}

## Build Artifact Analysis
### Current Artifacts
- Bundle sizes: {breakdown}
- Compression: {current_state}
- Caching headers: {analysis}

### Optimization Opportunities
- Size reduction: {potential_savings}
- Format improvements: {recommendations}
- Distribution optimization: {suggestions}

## Recommendations
### Tool and Technology Updates
- Build tool migration: {if_applicable}
- CI/CD platform optimization: {suggestions}
- Monitoring tools: {recommendations}

### Process Improvements
- Build workflow optimization: {changes}
- Developer experience: {enhancements}
- Documentation updates: {needs}

### Performance Targets
- Build time target: {goal}
- Bundle size target: {goal}
- Pipeline execution target: {goal}
- Success rate target: {goal}

## Risk Assessment
- Current build reliability: Critical/High/Medium/Low
- Deployment risk level: {assessment}
- Post-optimization targets: {goals}
```

Remember: DO NOT make any changes to build files or CI/CD configurations. Only analyze and report optimization opportunities.