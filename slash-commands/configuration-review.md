---
name: configuration-review
description: Analyze configuration management and environment settings to identify security risks and improvement opportunities
pattern: /configuration-review(?:\s+(.+))?
---

Using @agent-configuration-manager prepare a configuration review report. You must analyze configuration management practices, environment variables, secrets handling, and settings organization in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /configuration-review {optional_scope}

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
   - Focus analysis on modified configuration files only

2. If scope is "recent changes":
   - Use `git log --oneline -10` to see recent commits
   - Use `git diff HEAD~5..HEAD` or appropriate range
   - Analyze configuration changes from recent development

3. If scope starts with "PR":
   - Extract PR number from the scope
   - Use `gh pr view {number}` to get PR details
   - Use `gh pr diff {number}` to get the changes
   - Focus on configuration files changed in the PR

4. If scope is a path:
   - Verify the path exists
   - Scope analysis to that path

5. If no scope provided:
   - Analyze the entire project

## Your Task
1. First, understand the codebase and identify configuration patterns
2. Analyze configuration security and management practices
3. Create a prioritized configuration improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Configuration Security Audit**
   - Check for hardcoded secrets in configuration files
   - Identify exposed API keys, passwords, tokens
   - Find sensitive data in plain text configs
   - Detect insecure default values
   - Check for configuration injection vulnerabilities
   - Verify proper secrets management practices

2. **Environment Management Review**
   - Analyze environment variable usage
   - Check for environment-specific configuration separation
   - Verify configuration validation on startup
   - Review default value strategies
   - Assess configuration loading hierarchy
   - Check for hot reload capabilities

3. **Configuration Organization Assessment**
   - Review configuration file structure and organization
   - Check for configuration schema validation
   - Analyze feature flag implementation
   - Review configuration documentation
   - Assess migration and rollback strategies
   - Check configuration versioning practices

4. **Best Practices Compliance**
   - Environment parity validation
   - Configuration as code principles
   - Immutable configuration practices
   - Configuration testing approaches
   - Error handling and validation
   - Logging of configuration changes

## Output Format
Create a markdown file at `/plans/configuration-review-{timestamp}.md` with:

```markdown
# Configuration Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of configuration management maturity and critical findings

## Configuration Findings
### Critical Issues
- [ ] Security Risk: Description and location
- [ ] Exposed Secret: Description and location

### High Priority Issues
- [ ] Configuration vulnerability: Details
- [ ] Environment management gap: Details

### Medium Priority Issues
- [ ] Best practice violation: Details
- [ ] Improvement opportunity: Details

### Low Priority Issues
- [ ] Minor issue: Details

## Current State Analysis
### Configuration Files Inventory
- List of configuration files found
- Configuration formats used (.env, .json, .yaml, etc.)
- Environment-specific files identified

### Secrets Management Assessment
- How secrets are currently handled
- Storage locations and methods
- Access control mechanisms
- Rotation practices

### Environment Strategy Review
- Environment separation approach
- Variable naming conventions
- Default value strategies
- Validation mechanisms

## Configuration Security Issues
For each critical/high issue:
- Description and risk level
- Potential security impact
- Affected files/components
- Recommended remediation

## Improvement Plan
### Immediate Actions (Critical - Fix Now)
1. Secure exposed secrets
2. Remove hardcoded sensitive values

### Short-term (1-2 weeks)
1. Implement proper secrets management
2. Add configuration validation
3. Separate environment-specific settings

### Long-term Improvements (1+ months)
1. Implement configuration as code
2. Add comprehensive schema validation
3. Implement feature flag system
4. Add configuration monitoring

## Environment Management Recommendations
### Secrets Management
- Recommended tools and practices
- Storage solutions (vault, cloud secrets)
- Access control strategies
- Rotation policies

### Configuration Organization
- File structure recommendations
- Naming conventions
- Schema definition approaches
- Documentation standards

### Validation and Testing
- Startup validation recommendations
- Configuration testing strategies
- Error handling improvements
- Migration testing approaches

## Risk Assessment
- Current configuration security level: Critical/High/Medium/Low
- Environment management maturity: Initial/Developing/Defined/Managed/Optimizing
- Post-improvement target levels

## Implementation Roadmap
### Phase 1: Security (Weeks 1-2)
- Critical security fixes
- Secrets management implementation

### Phase 2: Organization (Weeks 3-4)  
- Configuration restructuring
- Validation implementation

### Phase 3: Advanced Features (Months 2-3)
- Feature flags
- Hot reload
- Advanced monitoring

## Compliance Checklist
- [ ] No secrets in code
- [ ] Environment-specific settings separated
- [ ] Configuration validated on startup
- [ ] Feature flags implemented
- [ ] Default values sensible
- [ ] Documentation comprehensive
- [ ] Migration path clear
- [ ] Rollback strategy defined
```

Remember: DO NOT make any changes. Only analyze and report.