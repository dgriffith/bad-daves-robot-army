---
name: concurrency-review
description: Analyze concurrent programming patterns and create a concurrency improvement plan
pattern: /concurrency-review(?:\s+(.+))?
---

Using @agent-concurrency-expert prepare a concurrency review report. You must analyze threading patterns, async operations, and parallel processing in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /concurrency-review {optional_scope}

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
1. First, understand the codebase and identify concurrency patterns
2. Analyze thread safety, race conditions, and parallelism
3. Create a prioritized concurrency improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Concurrency Pattern Review**
   - Thread safety analysis
   - Race condition detection
   - Deadlock possibilities
   - Resource contention
   - Synchronization mechanisms
   - Async/await usage

2. **Performance Analysis**
   - CPU utilization
   - Thread pool sizing
   - Blocking operations
   - Lock contention
   - Context switching overhead
   - Parallel efficiency

3. **Correctness Assessment**
   - Data race conditions
   - Memory consistency
   - Atomicity violations
   - Ordering guarantees
   - Visibility issues
   - Liveness problems

## Output Format
Create a markdown file at `/plans/concurrency-review-{timestamp}.md` with:

```markdown
# Concurrency Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of concurrency implementation and critical findings

## Concurrency Findings
### Critical Issues (Data Corruption Risk)
- [ ] Race condition: Shared state X without synchronization
- [ ] Deadlock potential: Circular lock dependency Y
- [ ] Data race: Concurrent writes to Z

### High Priority Issues
- [ ] Thread pool exhaustion: Service A
- [ ] Blocking I/O in async context: Function B
- [ ] Missing synchronization: Resource C

### Medium Priority Issues
- [ ] Inefficient locking: Coarse-grained locks
- [ ] Context switch overhead: Too many threads
- [ ] Missing async opportunities: Blocking calls

## Current Concurrency Assessment
### Concurrency Model
- Threading model: Platform threads/Green threads/Event loop
- Async framework: Current implementation
- Parallelism level: Thread count/Core utilization
- Synchronization: Mechanisms in use

### Performance Metrics
- CPU utilization: X%
- Thread count: Average Y
- Lock contention: Z%
- Context switches: N/second
- Async operations: M/second

## Concurrency Improvement Plan
### Immediate Actions (1-3 days)
1. Fix critical race conditions
2. Resolve deadlock risks
3. Add missing synchronization

### Short-term Improvements (1-2 weeks)
1. Optimize lock granularity
2. Implement lock-free algorithms
3. Convert blocking to async

### Long-term Transformations (2-6 weeks)
1. Redesign concurrent architecture
2. Implement actor model/channels
3. Add distributed processing

## Thread Safety Analysis
### Shared State Issues
```
// Current unsafe code
class SharedResource {
    private int counter; // Unprotected shared state
    
    public void increment() {
        counter++; // Race condition
    }
}

// Thread-safe solution
class SharedResource {
    private AtomicInteger counter;
    
    public void increment() {
        counter.incrementAndGet();
    }
}
```

### Synchronization Strategy
- Fine-grained locking
- Read-write locks
- Lock-free data structures
- Immutable objects

## Race Condition Fixes
### Critical Race Conditions
- Location: File:Line
- Impact: Data corruption/crashes
- Solution: Specific fix
- Testing: Verification approach

### Prevention Strategies
- Minimize shared state
- Use thread-safe collections
- Apply proper synchronization
- Implement message passing

## Deadlock Prevention
### Potential Deadlocks
```
// Deadlock scenario
Thread 1: lock(A) -> lock(B)
Thread 2: lock(B) -> lock(A)

// Solution: Consistent ordering
All threads: lock(A) -> lock(B)
```

### Prevention Techniques
- Lock ordering protocol
- Timeout mechanisms
- Deadlock detection
- Lock-free alternatives

## Async/Await Optimization
### Blocking Operations
- File I/O: Convert to async
- Network calls: Use async clients
- Database queries: Async drivers
- CPU-bound: Move to thread pool

### Async Best Practices
- Avoid blocking in async
- Proper error handling
- Cancellation support
- Backpressure handling

## Performance Optimization
### Thread Pool Tuning
- Optimal size: Formula/calculation
- Queue configuration
- Rejection policy
- Monitoring setup

### Lock Optimization
- Replace locks with atomics
- Use read-write locks
- Implement striped locking
- Consider lock-free algorithms

## Parallelism Enhancement
### Parallel Processing
- Data parallelism opportunities
- Task parallelism patterns
- Pipeline parallelism
- Map-reduce patterns

### Scalability Improvements
- Embarrassingly parallel tasks
- Work stealing queues
- Fork-join framework
- Parallel streams/collections

## Memory Model Considerations
### Memory Visibility
- Volatile usage
- Memory barriers
- Happens-before relationships
- Cache coherence

### Atomic Operations
- Compare-and-swap
- Atomic references
- Memory ordering
- ABA problem solutions

## Distributed Concurrency
### Distribution Strategy
- Service decomposition
- Message queues
- Event sourcing
- CQRS pattern

### Consistency Models
- Strong consistency
- Eventual consistency
- Causal consistency
- Trade-offs analysis

## Testing Strategy
### Concurrency Testing
- Stress testing
- Race condition detection
- Deadlock testing
- Performance testing

### Tools and Techniques
- Thread sanitizers
- Lock analyzers
- Profiling tools
- Chaos engineering

## Monitoring and Debugging
### Key Metrics
- Thread pool metrics
- Lock wait times
- Queue depths
- Error rates

### Debugging Tools
- Thread dumps
- Profilers
- Trace analysis
- Lock monitors

## Error Handling
### Concurrent Exceptions
- Exception propagation
- Retry strategies
- Circuit breakers
- Bulkhead pattern

### Recovery Mechanisms
- Graceful degradation
- Timeout handling
- Cancellation tokens
- Compensation logic

## Estimated Impact
- Throughput increase: +100%
- Latency reduction: -50%
- CPU efficiency: +40%
- Scalability: 10x capacity

## Implementation Roadmap
### Week 1-2: Safety First
- Fix race conditions
- Prevent deadlocks
- Add synchronization

### Week 3-4: Performance
- Optimize locking
- Implement async
- Tune thread pools

### Week 5-6: Scale
- Add parallelism
- Distributed processing
- Advanced patterns

## Success Metrics
- Zero race conditions
- No deadlocks detected
- CPU utilization > 80%
- Linear scalability achieved
```

Remember: DO NOT make any changes. Only analyze and report.