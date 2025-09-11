# Exception Review Slash Command

**Name:** exception-review  
**Pattern:** `/exception-review(?:\s+(.+))?`  
**Description:** Analyze exception handling patterns, error recovery mechanisms, and application resilience across the codebase

## Overview

This slash command performs a comprehensive analysis of exception handling and error resilience patterns in your codebase. It identifies potential failure points, evaluates current error handling strategies, and provides recommendations for building more robust and fault-tolerant applications.

## Usage

```
/exception-review                    # Review entire codebase
/exception-review src/               # Review specific directory  
/exception-review src/api/users.js   # Review specific file
/exception-review current changes    # Review uncommitted changes
/exception-review recent changes     # Review recent commits
/exception-review PR #123           # Review specific pull request
```

## Implementation

When this command is executed, invoke the @agent-exception-handling-master subagent with the following context:

### Scope Parsing
- **No argument**: Analyze entire codebase for exception handling patterns
- **File/directory path**: Focus analysis on specified path
- **"current changes"**: Review only uncommitted changes (git diff)
- **"recent changes"**: Review last 5-10 commits for exception handling changes
- **"PR #123"**: Review exception handling in specific pull request

### Analysis Focus Areas

**Exception Handling Patterns:**
- Try-catch block coverage and appropriateness
- Custom error types and error hierarchies
- Error propagation strategies
- Exception logging and monitoring

**Error Recovery Mechanisms:**
- Retry logic implementation
- Exponential backoff strategies
- Circuit breaker patterns
- Fallback and graceful degradation

**Resilience Architecture:**
- Error boundaries (React/UI frameworks)
- Bulkhead isolation patterns
- Timeout and deadline handling
- Health checks and readiness probes

**Input Validation & Edge Cases:**
- Parameter validation strategies
- Null/undefined handling
- Boundary condition checks
- Resource availability validation

### Output Format

Generate a comprehensive report at `/plans/exception-review-{timestamp}.md` with the following structure:

```markdown
# Exception Handling Review Report
*Generated: {timestamp}*
*Scope: {scope_description}*

## Executive Summary
- Overall resilience score
- Critical findings count
- High-impact recommendations
- Current maturity level assessment

## Exception Handling Findings

### Critical Issues
- Unhandled exceptions that could crash the application
- Missing error boundaries in critical paths
- Resource leaks in error conditions

### High Priority
- Inconsistent error handling patterns
- Missing retry logic for transient failures
- Inadequate logging for debugging

### Medium Priority  
- Generic catch-all exception handlers
- Missing timeout handling
- Insufficient input validation

### Low Priority
- Minor logging improvements
- Code style inconsistencies in error handling
- Documentation gaps

## Current State Analysis

### Strengths
- Well-implemented patterns found
- Good practices already in use
- Robust areas of the codebase

### Weaknesses
- Vulnerable code paths
- Missing resilience patterns
- Error handling gaps

### Coverage Assessment
- Exception handling coverage by module
- Critical path protection level
- Test coverage for error scenarios

## Improvement Plan

### Phase 1: Critical Fixes
- Immediate actions to prevent application crashes
- Essential error boundaries and fallbacks

### Phase 2: Resilience Enhancement
- Implement retry logic and circuit breakers
- Add comprehensive input validation

### Phase 3: Monitoring & Observability
- Enhanced error logging and monitoring
- Error rate tracking and alerting

## Recommendations

### Architectural Patterns
- Recommended exception handling strategies
- Resilience patterns to implement
- Error recovery mechanisms to add

### Implementation Guidelines
- Coding standards for exception handling
- Testing strategies for error scenarios
- Monitoring and alerting best practices

### Tools & Libraries
- Recommended libraries for error handling
- Monitoring and observability tools
- Testing frameworks for resilience

## Action Items
- [ ] Prioritized list of specific improvements
- [ ] Code locations requiring attention
- [ ] Suggested implementation timeline
```

## Key Analysis Areas

The exception handling review should evaluate:

1. **Exception Safety**: Proper resource cleanup, RAII patterns, exception guarantees
2. **Error Propagation**: Appropriate error bubbling vs local handling
3. **User Experience**: Graceful error messages and fallback UI states  
4. **System Reliability**: Circuit breakers, bulkhead isolation, health checks
5. **Observability**: Error logging, metrics, and monitoring integration
6. **Testing**: Error scenario coverage in unit and integration tests
7. **Performance**: Error handling impact on application performance
8. **Security**: Information leakage through error messages

## Important Notes

- This command performs **analysis only** - no code changes are made
- Focus on both immediate fixes and long-term resilience strategy  
- Consider error handling across all layers (UI, API, database, external services)
- Evaluate both expected errors (validation, business logic) and unexpected errors (system failures)
- Review error handling in both synchronous and asynchronous code paths