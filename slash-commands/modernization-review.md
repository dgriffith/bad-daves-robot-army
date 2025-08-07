---
name: modernization-review
description: Analyze code for modernization opportunities and create an update plan
pattern: /modernization-review(?:\s+(.+))?
---

Using @agent-code-modernizer prepare a modernization review report. You must analyze the codebase for outdated patterns, deprecated features, and modernization opportunities to create a comprehensive upgrade plan WITHOUT making any changes.

## Input Parsing
The user invoked: /modernization-review {optional_path}
- If a path is provided, scope your analysis to that path (file, directory, or module)
- If no path is provided, analyze the entire project

## Your Task
1. First, identify the technology stack and current versions
2. Find outdated patterns, deprecated features, and legacy code
3. Identify modernization opportunities
4. Create a prioritized modernization plan
5. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Technology Assessment**
   - Current language/framework versions
   - Deprecated APIs and features in use
   - Legacy dependencies
   - Outdated build tools
   - Old coding patterns

2. **Modernization Opportunities**
   - Language feature updates available
   - Framework migrations needed
   - Library updates and replacements
   - Build system improvements
   - Development workflow enhancements

3. **Risk and Compatibility Analysis**
   - Breaking changes assessment
   - Dependency compatibility
   - Migration complexity
   - Testing requirements

## Output Format
Create a markdown file at `/plans/modernization-review-{timestamp}.md` with:

```markdown
# Modernization Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of modernization needs and potential benefits

## Current Technology Stack
### Languages & Frameworks
- Primary language: {version}
- Framework: {version}
- Build tools: {versions}
- Key dependencies: {versions}

### Legacy Indicators
- [ ] Deprecated APIs: List
- [ ] Outdated patterns: List
- [ ] EOL dependencies: List
- [ ] Legacy syntax: List

## Modernization Opportunities
### Critical Updates (Security/EOL)
- [ ] Update X from v1 to v3 (EOL)
- [ ] Replace deprecated API Y
- [ ] Migrate from legacy library Z

### Feature Enhancements
- [ ] Adopt async/await patterns
- [ ] Use modern language features
- [ ] Implement type safety
- [ ] Update build pipeline

### Performance Improvements
- [ ] Modern bundling strategies
- [ ] Tree shaking opportunities
- [ ] Code splitting potential
- [ ] Lazy loading candidates

## Migration Plan
### Phase 1: Critical Updates (1 week)
1. Update security-critical dependencies
2. Replace EOL components
3. Fix deprecated API usage

### Phase 2: Core Modernization (2-3 weeks)
1. Update language/framework versions
2. Migrate to modern patterns
3. Refactor legacy code

### Phase 3: Enhancement (1-2 weeks)
1. Adopt new language features
2. Optimize build process
3. Improve developer experience

## Risk Assessment
### High Risk Changes
- Breaking API changes in X
- Data migration required for Y

### Medium Risk Changes
- Pattern migrations
- Build system updates

### Low Risk Changes
- Syntax updates
- Development tool updates

## Compatibility Matrix
| Component | Current | Target | Breaking Changes |
|-----------|---------|--------|------------------|
| Framework | v2.x    | v5.x   | Yes - API changes|
| Library X | v1.x    | v3.x   | No               |

## Testing Strategy
- Unit test updates required
- Integration test modifications
- Performance benchmarking
- Regression test suite

## Benefits Analysis
- Performance gains: Estimated X%
- Security improvements: List
- Developer experience: List
- Maintenance reduction: List

## Recommendations
- Tooling updates
- Training needs
- Documentation updates
- Monitoring additions

## Estimated Effort
- Total modernization: X weeks
- Critical updates: Y days
- Full migration: Z weeks
```

Remember: DO NOT make any changes. Only analyze and report.