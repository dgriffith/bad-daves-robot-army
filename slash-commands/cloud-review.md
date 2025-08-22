---
name: cloud-review
description: Analyze AWS cloud architecture and create a cloud optimization plan
pattern: /cloud-review(?:\s+(.+))?
---

Using @agent-cloud-developer prepare a cloud architecture review report. You must analyze AWS cloud patterns, scalability, and cost optimization opportunities in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /cloud-review {optional_scope}

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
1. First, understand the codebase and identify cloud architecture patterns
2. Analyze AWS service usage and optimization opportunities
3. Create a prioritized cloud improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **Cloud Architecture Review**
   - Identify AWS services in use
   - Check for anti-patterns
   - Assess scalability design
   - Review fault tolerance
   - Analyze security configurations
   - Evaluate cost optimization

2. **AWS Best Practices Assessment**
   - Well-Architected Framework compliance
   - Service selection appropriateness
   - Resource tagging strategy
   - Monitoring and alerting setup
   - Backup and disaster recovery
   - Network architecture

3. **Cost and Performance Analysis**
   - Instance sizing optimization
   - Reserved capacity opportunities
   - Unused resource identification
   - Data transfer costs
   - Storage optimization
   - Serverless opportunities

## Output Format
Create a markdown file at `/plans/cloud-review-{timestamp}.md` with:

```markdown
# Cloud Architecture Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of cloud architecture state and critical findings

## AWS Architecture Findings
### Critical Issues (Production Impact)
- [ ] Single point of failure: Component X
- [ ] Missing auto-scaling: Service Y
- [ ] Security group misconfiguration: Resource Z

### High Priority Issues
- [ ] Cost optimization: Over-provisioned resources
- [ ] Missing monitoring: Critical service A
- [ ] Backup strategy: Database B

### Medium Priority Issues
- [ ] Tagging inconsistency: Resources C
- [ ] Suboptimal service choice: Function D

## Current Architecture Assessment
### Services in Use
- EC2: X instances
- RDS: Y databases
- S3: Z buckets
- Lambda: N functions
- Other: List

### Architecture Patterns
- Deployment model: Monolithic/Microservices/Serverless
- Scaling strategy: Current approach
- Availability zones: Coverage
- Disaster recovery: RTO/RPO

## Cloud Optimization Plan
### Immediate Actions (1-3 days)
1. Fix security group rules
2. Enable CloudWatch monitoring
3. Implement backup strategy

### Short-term Improvements (1-2 weeks)
1. Implement auto-scaling for service X
2. Migrate to managed services for Y
3. Optimize instance types

### Long-term Transformations (2-8 weeks)
1. Implement multi-AZ deployment
2. Adopt serverless for appropriate workloads
3. Implement infrastructure as code

## Cost Optimization Opportunities
### Quick Wins
- Right-size EC2 instances: Save $X/month
- Delete unused resources: Save $Y/month
- Enable S3 lifecycle policies: Save $Z/month

### Strategic Changes
- Move to reserved instances: Save X%
- Implement spot instances: Save Y%
- Optimize data transfer: Save $Z/month

## Security Improvements
### Critical
- Enable encryption at rest
- Implement least privilege IAM
- Enable VPC flow logs

### Important
- Implement AWS WAF
- Enable GuardDuty
- Set up Security Hub

## Scalability Enhancements
### Auto-scaling Setup
- Services requiring auto-scaling
- Scaling policies to implement
- Load balancer configuration

### Performance Optimization
- CDN implementation
- Caching strategy
- Database read replicas

## Disaster Recovery Plan
### Backup Strategy
- RDS automated backups
- S3 cross-region replication
- EBS snapshot automation

### Recovery Procedures
- RTO target: X minutes
- RPO target: Y minutes
- Failover process

## Compliance and Governance
### Well-Architected Review
- Operational Excellence: Score
- Security: Score
- Reliability: Score
- Performance: Score
- Cost Optimization: Score

### Recommendations
- Governance improvements
- Compliance requirements
- Audit trail setup

## Migration Roadmap
### Phase 1: Foundation (Week 1-2)
- Security hardening
- Monitoring setup
- Backup implementation

### Phase 2: Optimization (Week 3-4)
- Cost optimization
- Performance tuning
- Auto-scaling setup

### Phase 3: Transformation (Week 5-8)
- Serverless migration
- Multi-region setup
- Advanced features

## Estimated Impact
- Cost reduction: X%
- Performance improvement: Y%
- Availability increase: Z%

## Risk Assessment
- Migration risks: List
- Mitigation strategies: Details
- Rollback procedures: Plan
```

Remember: DO NOT make any changes. Only analyze and report.