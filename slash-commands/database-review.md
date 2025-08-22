---
name: database-review
description: Analyze database design and create a database optimization plan
pattern: /database-review(?:\s+(.+))?
---

Using @agent-database-designer prepare a database review report. You must analyze database schemas, query patterns, and data architecture in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /database-review {optional_scope}

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
1. First, understand the codebase and identify database patterns
2. Analyze schema design, queries, and performance
3. Create a prioritized database improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Schema Design Review**
   - Normalization assessment
   - Data type appropriateness
   - Relationship modeling
   - Constraint definitions
   - Index coverage
   - Partitioning strategy

2. **Query Performance Analysis**
   - N+1 query problems
   - Missing indexes
   - Inefficient joins
   - Full table scans
   - Query complexity
   - Connection pooling

3. **Data Architecture Assessment**
   - Scalability design
   - Data consistency
   - Transaction patterns
   - Caching strategy
   - Backup/recovery
   - Data retention

## Output Format
Create a markdown file at `/plans/database-review-{timestamp}.md` with:

```markdown
# Database Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of database architecture health and critical findings

## Database Design Findings
### Critical Issues (Data Integrity Risk)
- [ ] Missing foreign key constraints: Tables X-Y
- [ ] No primary key: Table Z
- [ ] Inefficient data types: Column A using TEXT for IDs

### High Priority Issues
- [ ] N+1 queries: In service B
- [ ] Missing indexes: Slow queries on C
- [ ] Denormalization needed: Performance bottleneck D

### Medium Priority Issues
- [ ] Inconsistent naming: Mixed conventions
- [ ] Unused indexes: Maintenance overhead
- [ ] Missing constraints: Data validation gaps

## Current Database Assessment
### Schema Overview
- Database type: PostgreSQL/MySQL/MongoDB/etc
- Tables/Collections: X
- Total size: Y GB
- Growth rate: Z GB/month
- Query volume: N/second

### Performance Metrics
- Average query time: X ms
- Slow queries: Y per hour
- Connection pool usage: Z%
- Cache hit ratio: N%

## Database Improvement Plan
### Immediate Actions (1-3 days)
1. Add missing indexes for slow queries
2. Fix N+1 query problems
3. Add critical constraints

### Short-term Improvements (1-2 weeks)
1. Optimize complex queries
2. Implement query caching
3. Normalize/denormalize as needed

### Long-term Transformations (2-6 weeks)
1. Implement partitioning strategy
2. Add read replicas
3. Redesign problem areas

## Schema Optimization
### Normalization Analysis
- Current normal form: Assessment
- Over-normalization issues: List
- Under-normalization issues: List
- Recommended changes: Details

### Data Type Optimization
- [ ] VARCHAR(255) → Appropriate sizes
- [ ] TEXT → VARCHAR where applicable
- [ ] BIGINT → INT where sufficient
- [ ] Timestamp precision adjustments

## Indexing Strategy
### Missing Indexes
```sql
-- High impact indexes needed
CREATE INDEX idx_table_columns ON table(column1, column2);
CREATE INDEX idx_table2_column ON table2(column) WHERE condition;
```

### Unused Indexes
- Index X: Never used in queries
- Index Y: Redundant with index Z
- Removal impact: Analysis

### Index Optimization
- Composite indexes needed
- Covering indexes opportunities
- Partial indexes benefits
- Index maintenance schedule

## Query Optimization
### Problem Queries
```sql
-- Current slow query
SELECT * FROM large_table WHERE unindexed_column = ?

-- Optimized version
SELECT needed_columns FROM large_table 
WHERE indexed_column = ? 
LIMIT appropriate_number
```

### N+1 Query Solutions
- Use eager loading
- Implement DataLoader pattern
- Add JOIN queries
- Cache frequently accessed data

## Data Integrity
### Constraint Additions
- Foreign keys: Define relationships
- Check constraints: Validate data
- Unique constraints: Prevent duplicates
- NOT NULL: Required fields

### Data Validation
- Application-level validation
- Database-level constraints
- Trigger implementations
- Data cleaning needs

## Performance Tuning
### Connection Management
- Pool size optimization
- Connection timeout settings
- Prepared statement caching
- Connection leak detection

### Caching Strategy
- Query result caching
- Object caching layer
- Cache invalidation strategy
- Redis/Memcached implementation

## Scalability Planning
### Vertical Scaling
- Current limits: Assessment
- Hardware requirements
- Cost implications
- Timeline for limits

### Horizontal Scaling
- Sharding strategy
- Read replica setup
- Write scaling approach
- Data distribution plan

## Data Management
### Archival Strategy
- Old data identification
- Archive destination
- Access patterns
- Compliance requirements

### Backup and Recovery
- Backup frequency: Current vs recommended
- Recovery time objective (RTO)
- Recovery point objective (RPO)
- Disaster recovery plan

## Migration Plan
### Schema Migrations
- Version control integration
- Rollback procedures
- Zero-downtime migrations
- Testing strategy

### Data Migrations
- ETL processes
- Data validation
- Performance impact
- Incremental approach

## NoSQL Considerations
### When to Use NoSQL
- Document storage needs
- Graph relationships
- Time-series data
- Key-value requirements

### Polyglot Persistence
- Use case analysis
- Technology selection
- Integration approach
- Consistency management

## Monitoring Setup
### Key Metrics
- Query performance
- Connection pool status
- Lock wait times
- Replication lag
- Disk usage

### Alerting Rules
- Slow query threshold
- Connection exhaustion
- Replication delays
- Disk space warnings

## Security Enhancements
### Access Control
- User permissions audit
- Role-based access
- Encryption at rest
- Encryption in transit

### SQL Injection Prevention
- Parameterized queries
- Stored procedure usage
- Input validation
- ORM security features

## Estimated Impact
- Query performance: +60%
- Storage efficiency: +30%
- Maintenance time: -40%
- Scalability headroom: +200%

## Implementation Roadmap
### Week 1-2: Quick Wins
- Add critical indexes
- Fix N+1 queries
- Add constraints

### Week 3-4: Optimization
- Query rewrites
- Schema adjustments
- Caching implementation

### Week 5-6: Architecture
- Scaling implementation
- Monitoring setup
- Performance testing

## Success Metrics
- All queries < 100ms
- No N+1 problems
- 100% constraint coverage
- Zero data integrity issues
```

Remember: DO NOT make any changes. Only analyze and report.