---
name: security-review
description: Analyze security vulnerabilities and create a security improvement plan
pattern: /security-review(?:\s+(.+))?
---

Using @agent-security-master prepare a security review report. You must analyze security vulnerabilities and risks in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /security-review {optional_scope}

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
1. First, understand the codebase and identify potential security issues
2. Analyze vulnerabilities and security risks
3. Create a prioritized security improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Security Vulnerability Scan**
   - Check for hardcoded secrets/credentials
   - Identify SQL injection risks
   - Find XSS vulnerabilities
   - Look for insecure dependencies
   - Detect authentication/authorization issues
   - Check for sensitive data exposure

2. **Security Best Practices Review**
   - Input validation practices
   - Error handling and logging
   - Encryption usage
   - Access control implementation
   - Session management
   - API security

3. **Compliance and Standards**
   - OWASP Top 10 coverage
   - Industry-specific requirements
   - Data protection compliance

## Output Format
Create a markdown file at `/plans/security-review-{timestamp}.md` with:

```markdown
# Security Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of security posture and critical findings

## Security Findings
### Critical Vulnerabilities
- [ ] Issue: Description and location
- [ ] Issue: Description and location

### High Priority Issues
- [ ] Vulnerability type: Details
- [ ] Security gap: Details

### Medium Priority Issues
- [ ] Best practice violation: Details
- [ ] Improvement opportunity: Details

### Low Priority Issues
- [ ] Minor issue: Details

## Vulnerability Details
For each critical/high issue:
- Description
- Potential impact
- Affected files/components
- Recommended fix

## Security Improvement Plan
### Immediate Actions (Critical)
1. Fix critical vulnerability X
2. Patch security hole Y

### Short-term (1-2 weeks)
1. Implement input validation
2. Add authentication checks

### Long-term Improvements
1. Enhance security architecture
2. Implement security monitoring

## Compliance Status
- OWASP Top 10: X/10 covered
- Key gaps: List

## Recommendations
- Security tools to implement
- Training needs
- Process improvements

## Risk Assessment
- Current risk level: Critical/High/Medium/Low
- Post-mitigation risk level: Target
```

Remember: DO NOT make any changes. Only analyze and report.