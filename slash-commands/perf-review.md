---
name: perf-review
description: Analyze performance bottlenecks and create an optimization plan
pattern: /perf-review(?:\s+(.+))?
---

Using @agent-performance-optimizer prepare a performance review report. You must analyze performance bottlenecks and optimization opportunities in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /perf-review {optional_scope}

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
1. First, understand the codebase and identify performance bottlenecks
2. Analyze optimization opportunities
3. Create a prioritized performance improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Performance Analysis**
   - Identify algorithmic complexity issues
   - Find inefficient data structures
   - Detect unnecessary computations
   - Look for memory leaks
   - Check for blocking operations
   - Analyze database queries

2. **Resource Usage Review**
   - Memory consumption patterns
   - CPU utilization
   - I/O operations
   - Network calls
   - Caching opportunities

3. **Scalability Assessment**
   - Concurrent operation handling
   - Load distribution
   - Resource pooling
   - Batch processing opportunities

## Output Format
Create a markdown file at `/plans/performance-review-{timestamp}.md` with:

```markdown
# Performance Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of performance state and critical findings

## Performance Bottlenecks
### Critical Issues (Severe Impact)
- [ ] Algorithm X: O(n²) complexity in hot path
- [ ] Memory leak: In component Y
- [ ] Blocking I/O: In service Z

### High Priority Issues
- [ ] Inefficient query: In function A
- [ ] Missing cache: For operation B
- [ ] Redundant computation: In loop C

### Medium Priority Issues
- [ ] Suboptimal data structure: In module D
- [ ] Unnecessary allocations: In method E

## Performance Metrics
### Current State
- Average response time: X ms
- Memory usage: Y MB
- CPU utilization: Z%
- Key bottlenecks: List

### Target State
- Response time: < X ms
- Memory usage: < Y MB
- CPU utilization: < Z%

## Optimization Plan
### Quick Wins (1-3 days)
1. Add caching for X
2. Optimize query Y
3. Remove redundant computation Z

### Major Optimizations (1-2 weeks)
1. Refactor algorithm A to O(n log n)
2. Implement connection pooling
3. Add batch processing for B

### Architectural Changes (2-4 weeks)
1. Introduce async processing
2. Implement data partitioning
3. Add load balancing

## Implementation Strategy
### Phase 1: Low-hanging Fruit
- Cache frequently accessed data
- Optimize database queries
- Remove obvious inefficiencies

### Phase 2: Algorithm Improvements
- Replace inefficient algorithms
- Optimize data structures
- Implement better search strategies

### Phase 3: System-level Changes
- Add horizontal scaling
- Implement caching layer
- Optimize resource usage

## Performance Testing Plan
- Benchmark current performance
- Set performance targets
- Create performance test suite
- Monitor improvements

## Risk Assessment
### Safe Optimizations
- Adding caches
- Query optimization
- Code cleanup

### Moderate Risk
- Algorithm changes
- Data structure modifications

### High Risk
- Architectural changes
- Async refactoring

## Recommendations
- Performance monitoring tools
- Profiling approach
- Continuous performance testing

## Estimated Impact
- Quick wins: 20-30% improvement
- Major optimizations: 40-60% improvement
- Full plan: 70-80% improvement

## Effort Estimate
- Quick wins: X hours
- Major optimizations: Y days
- Complete plan: Z weeks
```

Remember: DO NOT make any changes. Only analyze and report.