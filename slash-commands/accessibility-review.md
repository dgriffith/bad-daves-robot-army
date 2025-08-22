---
name: accessibility-review
description: Analyze code for accessibility compliance and create an a11y improvement plan
pattern: /accessibility-review(?:\s+(.+))?
---

Using @agent-accessibility-specialist prepare an accessibility review report. You must analyze the codebase for WCAG compliance, identify accessibility barriers, and create a comprehensive a11y improvement plan WITHOUT making any changes.

## Input Parsing
The user invoked: /accessibility-review {optional_scope}

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
1. First, identify the current accessibility implementation status
2. Find WCAG violations and accessibility barriers
3. Identify assistive technology compatibility issues
4. Create a prioritized accessibility improvement plan
5. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Current Accessibility Assessment**
   - WCAG compliance level
   - Semantic HTML usage
   - ARIA implementation
   - Keyboard navigation support
   - Screen reader compatibility

2. **Accessibility Violations**
   - Missing alt text
   - Poor color contrast
   - Inaccessible forms
   - Keyboard traps
   - Focus management issues

3. **Assistive Technology Support**
   - Screen reader testing results
   - Keyboard-only navigation
   - Voice control compatibility
   - Browser accessibility features

## Output Format
Create a markdown file at `/plans/accessibility-review-{timestamp}.md` with:

```markdown
# Accessibility Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of accessibility status and required improvements

## Current Accessibility Status
### WCAG Compliance
- Current level: {A/AA/AAA/None}
- Target level: WCAG 2.1 AA
- Critical violations: X
- Major violations: Y
- Minor violations: Z

### Accessibility Coverage
- [ ] Semantic HTML: X%
- [ ] ARIA labels: X%
- [ ] Keyboard navigation: X%
- [ ] Screen reader support: X%
- [ ] Color contrast: X%

## Accessibility Violations Found
### Critical (Blockers)
- [ ] Missing alt text: X images
- [ ] Inaccessible forms: Y forms
- [ ] Keyboard traps: Z components
- [ ] No skip navigation links
- [ ] Missing focus indicators

### Major Issues
- [ ] Poor color contrast: X instances
- [ ] Missing ARIA labels: Y elements
- [ ] Improper heading hierarchy
- [ ] Inaccessible modals/dialogs
- [ ] Missing live regions

### Minor Issues
- [ ] Redundant alt text
- [ ] Missing lang attributes
- [ ] Decorative images not hidden
- [ ] Inconsistent focus order

## Component Analysis
### Forms
- Input labels: Status
- Error messages: Status
- Required fields indication: Status
- Validation feedback: Status
- Field grouping: Status

### Navigation
- Keyboard accessibility: Status
- Skip links: Status
- Breadcrumbs: Status
- Menu structure: Status
- Focus management: Status

### Media
- Images alt text: Status
- Video captions: Status
- Audio transcripts: Status
- Decorative images: Status
- Complex graphics: Status

### Interactive Elements
- Buttons: Status
- Links: Status
- Modals: Status
- Tooltips: Status
- Accordions: Status

## Implementation Plan
### Phase 1: Critical Fixes (1 week)
1. Add missing alt text
2. Fix keyboard traps
3. Implement skip navigation
4. Add focus indicators
5. Label form inputs

### Phase 2: WCAG AA Compliance (2-3 weeks)
1. Fix color contrast issues
2. Add ARIA labels and roles
3. Implement proper heading hierarchy
4. Make modals accessible
5. Add live regions

### Phase 3: Enhanced Accessibility (1-2 weeks)
1. Improve screen reader experience
2. Add keyboard shortcuts
3. Implement focus management
4. Enhance error messaging
5. Add accessibility preferences

### Phase 4: Testing & Validation (1 week)
1. Automated accessibility testing
2. Screen reader testing
3. Keyboard navigation testing
4. User testing with disabilities
5. Documentation updates

## Technical Requirements
### Testing Tools
- Automated testing: axe-core, WAVE
- Screen readers: NVDA, JAWS, VoiceOver
- Color contrast: Chrome DevTools
- Keyboard testing: Manual
- Browser extensions: axe DevTools

### Implementation Guidelines
- Use semantic HTML first
- ARIA as enhancement only
- Test with real assistive technology
- Follow WCAG 2.1 AA guidelines
- Document accessibility features

## Testing Strategy
### Automated Testing
- Run axe-core in CI/CD
- Regular WAVE scans
- Lighthouse audits
- Pa11y testing
- Custom rule validation

### Manual Testing
- Screen reader testing matrix
- Keyboard navigation checklist
- Color contrast validation
- Focus order verification
- Zoom/magnification testing

### User Testing
- Recruit users with disabilities
- Test with various AT
- Gather feedback on barriers
- Validate solutions
- Iterative improvements

## Assistive Technology Matrix
| Technology | Status | Issues | Priority |
|------------|--------|--------|----------|
| NVDA       | Partial| X bugs | High     |
| JAWS       | Poor   | Y bugs | High     |
| VoiceOver  | Good   | Z bugs | Medium   |
| Dragon     | Unknown| TBD    | Low      |

## Risk Assessment
### Legal Risks
- ADA compliance gaps
- WCAG violations
- Discrimination exposure
- Litigation potential

### User Impact
- X% users affected
- Critical features blocked
- Poor user experience
- Brand reputation risk

## Recommendations
### Immediate Actions
1. Fix critical blockers
2. Establish a11y testing
3. Train development team
4. Create a11y checklist
5. Document standards

### Long-term Strategy
- Accessibility-first design
- Regular audits
- User feedback loops
- Continuous improvement
- Team training program

### Tools and Resources
- Testing tools: {list}
- Training resources: {list}
- Reference guides: {list}
- Support services: {list}

## Estimated Effort
- Critical fixes: X days
- Full WCAG AA: Y weeks
- Enhanced features: Z weeks
- Total timeline: N weeks

## Success Metrics
- WCAG AA compliance: 100%
- Automated test pass rate: >95%
- Screen reader compatibility: 100%
- Keyboard navigation: 100%
- User satisfaction: >90%
```

Remember: DO NOT make any changes. Only analyze and report.