---
name: deployment-review
description: Analyze deployment processes and create a deployment improvement plan
pattern: /deployment-review(?:\s+(.+))?
---

Using @agent-deployment-specialist prepare a deployment review report. You must analyze deployment processes, CI/CD pipelines, and release management practices in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /deployment-review {optional_scope}

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
1. First, understand the codebase and identify deployment patterns
2. Analyze CI/CD pipelines and release processes
3. Create a prioritized deployment improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Deployment Process Review**
   - Current deployment methods
   - CI/CD pipeline analysis
   - Release frequency assessment
   - Rollback capabilities
   - Environment management
   - Configuration handling

2. **Automation Assessment**
   - Build automation coverage
   - Test automation in pipeline
   - Deployment automation maturity
   - Infrastructure as code usage
   - Monitoring integration
   - Security scanning

3. **Risk and Reliability Analysis**
   - Deployment failure points
   - Recovery procedures
   - Zero-downtime capabilities
   - Feature flag usage
   - Canary deployment support
   - Blue-green deployment readiness

## Output Format
Create a markdown file at `/plans/deployment-review-{timestamp}.md` with:

```markdown
# Deployment Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of deployment maturity and critical findings

## Deployment Process Findings
### Critical Issues (High Risk)
- [ ] Manual deployment steps: Process X
- [ ] No rollback mechanism: Service Y
- [ ] Missing health checks: Component Z

### High Priority Issues
- [ ] Inconsistent environments: Dev/Staging/Prod
- [ ] No automated testing: Pipeline A
- [ ] Configuration drift: Service B

### Medium Priority Issues
- [ ] Slow build times: Module C
- [ ] Limited deployment visibility: System D

## Current Deployment Assessment
### Pipeline Overview
- CI/CD Tool: Current platform
- Build time: Average duration
- Deployment frequency: X per day/week
- Success rate: Y%
- MTTR: Z minutes

### Deployment Stages
- Build: Process and duration
- Test: Coverage and types
- Deploy: Method and targets
- Verify: Health checks and monitoring

## Deployment Improvement Plan
### Immediate Actions (1-3 days)
1. Add deployment health checks
2. Document rollback procedures
3. Implement basic monitoring

### Short-term Improvements (1-2 weeks)
1. Automate manual deployment steps
2. Add integration tests to pipeline
3. Implement configuration management

### Long-term Transformations (2-6 weeks)
1. Implement blue-green deployments
2. Add progressive rollout capabilities
3. Create full GitOps workflow

## Automation Opportunities
### Build Optimization
- Parallel build steps
- Dependency caching
- Incremental builds
- Build time target: X minutes

### Test Automation
- Unit test coverage: Current → Target
- Integration tests: Add X tests
- E2E tests: Implement Y scenarios
- Performance tests: Add benchmarks

### Deployment Automation
- Environment provisioning
- Database migrations
- Configuration updates
- Smoke tests

## Zero-Downtime Strategy
### Implementation Plan
1. Add health check endpoints
2. Implement graceful shutdown
3. Configure load balancer
4. Enable rolling updates

### Feature Flag Strategy
- Tool selection
- Flag lifecycle management
- A/B testing capabilities
- Gradual rollout process

## Environment Management
### Consistency Improvements
- Infrastructure as Code adoption
- Environment parity checklist
- Configuration templating
- Secret management

### Environment Pipeline
- Development: Purpose and refresh
- Staging: Production mirror
- Production: High availability
- DR environment: Setup plan

## Monitoring and Observability
### Deployment Metrics
- Deploy frequency
- Lead time for changes
- MTTR tracking
- Change failure rate

### Alerting Strategy
- Deployment notifications
- Failure alerts
- Performance degradation
- Rollback triggers

## Security Integration
### Pipeline Security
- SAST implementation
- Dependency scanning
- Container scanning
- Secret detection

### Compliance Checks
- Policy as code
- Audit logging
- Access controls
- Approval workflows

## Risk Mitigation
### Deployment Risks
- Database migration risks
- Service dependency risks
- Configuration risks
- Performance risks

### Mitigation Strategies
- Canary deployments
- Feature flags
- Automated rollback
- Deployment windows

## Release Management
### Version Strategy
- Semantic versioning
- Release notes automation
- Changelog generation
- Tag management

### Communication Plan
- Stakeholder notifications
- User announcements
- Documentation updates
- Training needs

## Estimated Benefits
- Deployment frequency: X → Y per day
- Lead time: A → B hours
- MTTR: C → D minutes
- Change failure rate: E% → F%

## Implementation Roadmap
### Week 1-2: Foundation
- Health checks and monitoring
- Basic automation
- Documentation

### Week 3-4: Acceleration
- Advanced automation
- Testing integration
- Performance optimization

### Week 5-6: Excellence
- Zero-downtime deployment
- Progressive delivery
- Full observability

## Success Metrics
- Deployment success rate > 95%
- Rollback time < 5 minutes
- Build time < 10 minutes
- Full automation achieved
```

Remember: DO NOT make any changes. Only analyze and report.