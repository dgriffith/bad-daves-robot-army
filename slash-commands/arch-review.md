---
name: arch-review
description: Analyze architectural patterns and create an architecture improvement plan
pattern: /arch-review(?:\s+(.+))?
---

Using @agent-architect prepare an architectural review report. You must analyze the codebase architecture and create a comprehensive improvement plan WITHOUT making any changes.

## Input Parsing
The user invoked: /arch-review {optional_path}
- If a path is provided, scope your analysis to that path (file, directory, or module)
- If no path is provided, analyze the entire project

## Your Task
1. First, understand the project's architectural patterns and structure
2. Identify architectural issues and improvement opportunities
3. Create a prioritized architectural improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Architecture Assessment**
   - Map component dependencies
   - Identify architectural layers
   - Check SOLID principle adherence
   - Analyze coupling and cohesion
   - Review design patterns usage
   - Assess modularity

2. **Identify Architectural Issues**
   - Circular dependencies
   - Layer violations
   - Tight coupling
   - Missing abstractions
   - Inconsistent patterns
   - Scalability bottlenecks

3. **Future-Proofing Analysis**
   - Extensibility assessment
   - Maintainability concerns
   - Performance implications
   - Testing architecture

## Output Format
Create a markdown file at `/plans/architecture-review-{timestamp}.md` with:

```markdown
# Architecture Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of architectural state and key findings

## Current Architecture
### Overview
- Architecture style: (e.g., layered, microservices, monolithic)
- Key components: List
- Design patterns used: List

### Architecture Diagram
```
[ASCII or description of component relationships]
```

## Architectural Issues
### Critical Issues
- [ ] Circular dependency: Between X and Y
- [ ] Layer violation: Component A accessing Z directly

### Design Flaws
- [ ] Missing abstraction: For X functionality
- [ ] Tight coupling: Between services A and B

### Pattern Inconsistencies
- [ ] Mixed patterns: In module X
- [ ] Anti-pattern usage: In component Y

## SOLID Principles Assessment
- Single Responsibility: X/5
- Open/Closed: X/5
- Liskov Substitution: X/5
- Interface Segregation: X/5
- Dependency Inversion: X/5

## Improvement Plan
### High Priority (Structural Fixes)
1. Break circular dependency between X and Y
2. Introduce abstraction layer for Z

### Medium Priority (Design Improvements)
1. Refactor module A to follow pattern B
2. Decouple services X and Y

### Low Priority (Consistency)
1. Standardize naming conventions
2. Align pattern usage

## Migration Strategy
### Phase 1: Foundation
- Steps to prepare for changes

### Phase 2: Core Refactoring
- Major architectural changes

### Phase 3: Optimization
- Fine-tuning and consistency

## Impact Analysis
- Development velocity impact
- Testing requirements
- Risk assessment

## Recommendations
- Architectural patterns to adopt
- Tools and frameworks
- Documentation needs

## Estimated Effort
- Total tasks: X
- Critical fixes: Y hours
- Full refactoring: Z weeks
```

Remember: DO NOT make any changes. Only analyze and report.