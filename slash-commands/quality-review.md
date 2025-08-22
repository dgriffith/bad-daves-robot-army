---
name: quality-review
description: Analyze quality assurance practices and create a quality improvement plan
pattern: /quality-review(?:\s+(.+))?
---

Using @agent-quality-assurance-expert prepare a quality assurance review report. You must analyze testing strategies, quality metrics, and defect prevention practices in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /quality-review {optional_scope}

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
1. First, understand the codebase and identify quality practices
2. Analyze test coverage, defect patterns, and quality metrics
3. Create a prioritized quality improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Testing Strategy Review**
   - Test coverage analysis
   - Test quality assessment
   - Testing pyramid evaluation
   - Test automation maturity
   - Test data management
   - Test environment setup

2. **Quality Metrics Analysis**
   - Code coverage percentages
   - Defect density
   - Test pass rates
   - Mean time to detect
   - Mean time to repair
   - Escaped defects

3. **Process Assessment**
   - Quality gates
   - Code review practices
   - CI/CD integration
   - Defect prevention
   - Risk-based testing
   - Regression strategy

## Output Format
Create a markdown file at `/plans/quality-review-{timestamp}.md` with:

```markdown
# Quality Assurance Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of quality maturity and critical findings

## Quality Assurance Findings
### Critical Issues (Quality Risk)
- [ ] No test coverage: Critical module X
- [ ] Failing tests ignored: Test suite Y
- [ ] No quality gates: Deployment pipeline Z

### High Priority Issues
- [ ] Low test coverage: < 40% in service A
- [ ] Missing integration tests: API B
- [ ] No performance testing: System C

### Medium Priority Issues
- [ ] Flaky tests: Suite D
- [ ] Outdated test data: Environment E
- [ ] Manual testing only: Feature F

## Current Quality Assessment
### Testing Metrics
- Unit test coverage: X%
- Integration test coverage: Y%
- E2E test coverage: Z%
- Total test count: N
- Test execution time: M minutes
- Test success rate: P%

### Quality Metrics
- Defect density: X per KLOC
- Escaped defects: Y per release
- MTTR: Z hours
- Customer issues: N per month
- Code review coverage: M%

## Quality Improvement Plan
### Immediate Actions (1-3 days)
1. Fix failing critical tests
2. Add tests for uncovered critical paths
3. Implement basic quality gates

### Short-term Improvements (1-2 weeks)
1. Increase test coverage to 70%
2. Add integration test suite
3. Implement automated regression

### Long-term Transformations (2-6 weeks)
1. Achieve 85%+ test coverage
2. Implement full test automation
3. Create comprehensive quality framework

## Testing Strategy Enhancement
### Testing Pyramid
```
         /\
        /E2E\        5%  - Critical user journeys
       /------\
      /  API   \    15%  - Service integration
     /----------\
    / Integration\  30%  - Component interaction
   /--------------\
  /   Unit Tests   \ 50%  - Business logic
 /------------------\
```

### Test Coverage Goals
- Unit tests: 85% coverage
- Integration: Key workflows
- API tests: All endpoints
- E2E tests: Critical paths
- Performance: Load testing
- Security: Penetration testing

## Test Automation
### Automation Priorities
1. Smoke tests: Deploy validation
2. Regression suite: Core features
3. API tests: Contract testing
4. UI tests: Critical flows
5. Performance: Baseline tests

### Framework Selection
- Unit: Jest/JUnit/pytest
- Integration: Framework choice
- E2E: Selenium/Cypress/Playwright
- API: Postman/REST Assured
- Performance: JMeter/k6

## Quality Gates
### CI/CD Gates
- Build success: Required
- Unit tests: > 85% pass
- Code coverage: > 70%
- Security scan: No high issues
- Linting: Zero errors
- Performance: Baseline met

### Deployment Criteria
- All tests passing
- Code review approved
- Documentation updated
- Security cleared
- Performance validated

## Defect Prevention
### Root Cause Analysis
- Common defect patterns
- Prevention strategies
- Process improvements
- Training needs

### Shift-Left Practices
- Requirements review
- Design review
- Code review
- Early testing
- Static analysis

## Test Data Management
### Data Strategy
- Synthetic data generation
- Data privacy compliance
- Test data refresh
- Environment isolation
- Data versioning

### Environment Management
- Dev: Continuous updates
- Test: Stable baseline
- Staging: Production mirror
- Performance: Isolated

## Performance Testing
### Test Scenarios
- Load testing: Normal traffic
- Stress testing: Peak loads
- Spike testing: Sudden increases
- Endurance: Extended duration
- Scalability: Growth simulation

### Performance Targets
- Response time: < 200ms
- Throughput: X requests/sec
- Error rate: < 0.1%
- CPU usage: < 70%
- Memory: Stable

## Security Testing
### Security Checks
- SAST: Static analysis
- DAST: Dynamic testing
- Dependency scanning
- Penetration testing
- Security review

### Compliance
- OWASP Top 10
- Industry standards
- Regulatory requirements
- Data protection

## Accessibility Testing
### Coverage Areas
- WCAG compliance
- Screen reader testing
- Keyboard navigation
- Color contrast
- Alternative text

### Testing Tools
- Automated scanners
- Manual testing
- User testing
- Compliance reports

## Cross-Platform Testing
### Browser Coverage
- Chrome: Latest 2 versions
- Firefox: Latest version
- Safari: Latest version
- Edge: Latest version
- Mobile browsers

### Device Testing
- Desktop: Various resolutions
- Tablet: iOS/Android
- Mobile: iOS/Android
- Responsive design

## Monitoring and Metrics
### Quality Dashboard
- Test results trend
- Coverage trend
- Defect trends
- Performance metrics
- Build success rate

### Key Indicators
- Test effectiveness
- Defect escape rate
- Test efficiency
- Automation ROI
- Quality cost

## Risk-Based Testing
### Risk Assessment
- Business criticality
- Technical complexity
- Change frequency
- Defect history
- User impact

### Test Prioritization
- Critical: Full coverage
- High: Comprehensive
- Medium: Standard
- Low: Basic smoke

## Continuous Improvement
### Retrospectives
- Testing effectiveness
- Process improvements
- Tool evaluation
- Skill development

### Innovation
- AI-powered testing
- Chaos engineering
- Property-based testing
- Contract testing

## Team Development
### Training Plan
- Testing best practices
- Tool training
- Domain knowledge
- Automation skills

### Quality Culture
- Quality ownership
- Early involvement
- Continuous learning
- Knowledge sharing

## Estimated Impact
- Defect reduction: 70%
- Test efficiency: +50%
- Release confidence: 95%
- Customer satisfaction: +30%

## Implementation Roadmap
### Week 1-2: Foundation
- Fix critical tests
- Add quality gates
- Improve coverage

### Week 3-4: Automation
- Automate regression
- Add API tests
- Implement CI/CD

### Week 5-6: Excellence
- Performance testing
- Security testing
- Full automation

## Success Metrics
- Test coverage > 85%
- Zero escaped defects
- All tests automated
- Quality gates enforced
```

Remember: DO NOT make any changes. Only analyze and report.