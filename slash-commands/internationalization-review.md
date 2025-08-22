---
name: internationalization-review
description: Analyze code for i18n readiness and create a localization plan
pattern: /internationalization-review(?:\s+(.+))?
---

Using @agent-internationalization-specialist prepare an i18n review report. You must analyze the codebase for internationalization readiness, identify localization requirements, and create a comprehensive i18n implementation plan WITHOUT making any changes.

## Input Parsing
The user invoked: /internationalization-review {optional_scope}

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
1. First, identify the current i18n/l10n implementation status
2. Find hard-coded strings and localization issues
3. Identify internationalization requirements
4. Create a prioritized i18n implementation plan
5. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Current I18n Assessment**
   - Existing i18n framework/library
   - Supported locales
   - Translation management system
   - Locale detection mechanism
   - String externalization status

2. **Localization Gaps**
   - Hard-coded user-facing strings
   - Date/time formatting issues
   - Number/currency formatting gaps
   - Missing RTL support
   - Character encoding problems

3. **Regional Requirements**
   - Target markets and languages
   - Cultural considerations
   - Legal/regulatory requirements
   - Regional feature variations

## Output Format
Create a markdown file at `/plans/internationalization-review-{timestamp}.md` with:

```markdown
# Internationalization Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of i18n readiness and localization requirements

## Current I18n Status
### Existing Implementation
- I18n framework: {name/version or None}
- Supported locales: {list or None}
- Translation system: {type or None}
- String externalization: {percentage}

### Localization Coverage
- [ ] UI strings externalized: X%
- [ ] Error messages localized: X%
- [ ] Date/time formatting: Status
- [ ] Number/currency formatting: Status
- [ ] RTL support: Status

## Localization Requirements
### Hard-coded Strings Found
- User interface: X strings
- Error messages: Y strings
- Validation messages: Z strings
- Email templates: N strings
- Documentation: M strings

### Formatting Issues
- [ ] Date/time formatting
- [ ] Number formatting
- [ ] Currency display
- [ ] Phone numbers
- [ ] Addresses

### Cultural Considerations
- [ ] Images and icons
- [ ] Color meanings
- [ ] Name formats
- [ ] Sort orders
- [ ] Text direction

## Implementation Plan
### Phase 1: Foundation (1 week)
1. Set up i18n framework
2. Configure locale detection
3. Implement language switching
4. Create translation workflow

### Phase 2: String Externalization (2-3 weeks)
1. Extract UI strings
2. Externalize error messages
3. Localize validation messages
4. Update email templates

### Phase 3: Formatting & Display (1-2 weeks)
1. Implement date/time formatting
2. Add number/currency formatting
3. Handle pluralization rules
4. Add RTL support

### Phase 4: Regional Features (1 week)
1. Implement locale-specific features
2. Add regional validators
3. Configure regional defaults

## Technical Requirements
### I18n Framework Setup
- Recommended library: {name}
- Message format: ICU/gettext
- Translation file format: JSON/YAML/PO
- Fallback strategy: {description}

### Translation Management
- Translation service: {recommendation}
- Version control integration
- Translation memory setup
- Continuous localization

### Testing Strategy
- Pseudo-localization testing
- RTL layout testing
- Character encoding tests
- Locale-specific validation
- Translation completeness checks

## Resource Requirements
### Translation Needs
| Language | Words | Priority | Market |
|----------|-------|----------|--------|
| Spanish  | X,XXX | High     | LATAM  |
| French   | X,XXX | Medium   | EU     |

### Development Effort
- Initial setup: X days
- String extraction: Y days
- Formatting implementation: Z days
- Testing and validation: N days

## Risk Assessment
### Technical Risks
- Character encoding issues
- Layout breaking with longer text
- RTL layout problems
- Performance impact

### Business Risks
- Translation quality
- Cultural misunderstandings
- Legal compliance
- Market readiness delays

## Recommendations
### Immediate Actions
1. Choose i18n framework
2. Define supported locales
3. Set up translation workflow
4. Create style guide

### Best Practices
- Use message IDs vs English keys
- Implement context for translators
- Avoid string concatenation
- Handle pluralization properly
- Design for text expansion

### Tools and Services
- Translation management: {tool}
- Testing tools: {list}
- Validation tools: {list}
- Quality assurance: {process}

## Estimated Timeline
- Total implementation: X weeks
- MVP (core languages): Y weeks
- Full rollout: Z weeks
```

Remember: DO NOT make any changes. Only analyze and report.