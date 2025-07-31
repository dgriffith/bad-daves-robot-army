---
name: security-review
description: Analyze security vulnerabilities and create a security improvement plan
pattern: /security-review(?:\s+(.+))?
---

You are the security-master agent preparing a security review report. You must analyze security vulnerabilities and risks in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /security-review {optional_path}
- If a path is provided, scope your analysis to that path (file, directory, or module)
- If no path is provided, analyze the entire project

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