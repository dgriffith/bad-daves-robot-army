---
name: logging-review
description: Analyze logging and observability practices and create an improvement plan
pattern: /logging-review(?:\s+(.+))?
---

Using @agent-logging-master prepare a logging and observability review report. You must analyze logging practices, observability gaps, and monitoring setup in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /logging-review {optional_scope}

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
1. First, understand the codebase and identify logging and observability practices
2. Analyze logging coverage, quality, and monitoring setup
3. Create a prioritized logging improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Logging Coverage Assessment**
   - Identify logging framework and configuration
   - Check log level usage (DEBUG, INFO, WARN, ERROR)
   - Analyze logging consistency across modules
   - Find gaps in error handling and logging
   - Assess business logic logging coverage

2. **Log Quality Review**
   - Check for structured logging (JSON format)
   - Verify correlation/trace IDs for request tracking
   - Identify sensitive data in logs (passwords, tokens, PII)
   - Review log message clarity and usefulness
   - Check for excessive or insufficient logging

3. **Observability Infrastructure**
   - Review monitoring and alerting setup
   - Check metrics collection and dashboards
   - Analyze distributed tracing implementation
   - Assess log aggregation and search capabilities
   - Verify health checks and status endpoints

4. **Performance and Operations**
   - Evaluate logging performance impact
   - Check log rotation and retention policies
   - Review log storage and indexing strategy
   - Assess debugging and troubleshooting workflows
   - Check compliance and audit logging

## Output Format
Create a markdown file at `/plans/logging-review-{timestamp}.md` with:

```markdown
# Logging and Observability Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of current logging maturity and critical gaps

## Logging Findings
### Critical Issues
- [ ] Issue: Critical logging gap or problem
- [ ] Issue: Security/compliance violation

### High Priority Issues
- [ ] Observability gap: Details and impact
- [ ] Logging quality issue: Details

### Medium Priority Issues
- [ ] Best practice violation: Details
- [ ] Improvement opportunity: Details

### Low Priority Issues
- [ ] Minor issue: Details

## Current State Analysis
### Logging Framework and Configuration
- Framework used: [framework name]
- Configuration location: [path]
- Log levels configured: [levels]
- Output destinations: [console, files, services]

### Log Coverage Assessment
- Components with good logging: [list]
- Components lacking logging: [list]
- Error handling coverage: [percentage/assessment]
- Business logic coverage: [percentage/assessment]

### Log Quality
- Structured format used: [Yes/No - JSON, etc.]
- Correlation IDs present: [Yes/No/Partial]
- Sensitive data risks: [High/Medium/Low]
- Message clarity: [Good/Fair/Poor]

### Observability Infrastructure
- Monitoring tools: [list]
- Log aggregation: [tool/service]
- Dashboards: [available/missing]
- Alerting: [configured/missing]
- Distributed tracing: [implemented/missing]

## Improvement Plan
### Immediate Actions (Critical - 1 week)
1. Fix critical logging security issues
2. Add missing error logging for critical paths

### Short-term (1-4 weeks)
1. Implement structured logging format
2. Add correlation IDs for request tracing
3. Configure proper log levels
4. Remove sensitive data from logs

### Medium-term (1-3 months)
1. Set up centralized log aggregation
2. Implement monitoring dashboards
3. Add distributed tracing
4. Establish log retention policies

### Long-term Improvements (3+ months)
1. Advanced observability features
2. Automated anomaly detection
3. Performance optimization
4. Compliance automation

## Monitoring and Alerting Strategy
- Key metrics to track: [list]
- Alert thresholds: [recommendations]
- Dashboard requirements: [list]
- SLA/SLO considerations: [details]

## Recommendations
### Tools and Technologies
- Logging framework: [recommendation]
- Log aggregation: [tool recommendation]
- Monitoring platform: [recommendation]
- APM solution: [recommendation]

### Best Practices to Implement
- Structured logging standards
- Log level guidelines
- Sensitive data handling
- Performance considerations
- Retention and compliance

### Team Training Needs
- Observability best practices
- Tool-specific training
- Debugging techniques
- Incident response procedures

## Risk Assessment
- Current observability maturity: [Basic/Intermediate/Advanced]
- Mean time to detection (MTTD): [assessment]
- Mean time to resolution (MTTR): [assessment]
- Production debugging capability: [Strong/Fair/Weak]
```

Remember: DO NOT make any changes. Only analyze and report.