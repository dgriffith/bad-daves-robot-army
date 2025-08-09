---
name: process-implementation-plan-feedback
description: Process technical team feedback on an implementation plan and create an updated version incorporating their input
pattern: /process-implementation-plan-feedback(?:\s+(.+))?
---

Using @agent-development-manager, process technical team feedback on an existing implementation plan and create an updated version that incorporates their input while maintaining technical coherence and tracking all changes.

## Context
This command helps development managers systematically process feedback from technical team members (architects, senior engineers, DevOps, QA, security) and create a revised implementation plan that addresses technical concerns, incorporates improvements, and documents decisions about accepted or deferred changes.

## Input Parsing
The user invoked: /process-implementation-plan-feedback {plan_file_path}
- Parse the plan_file_path parameter (should be a path to a file in /plans directory)
- If no file path provided, list available plans and ask user to specify

## Your Task
You need to gather technical feedback, analyze it, and create an updated implementation plan that thoughtfully incorporates the input while maintaining technical feasibility and project coherence.

### Step 1: Read and Understand the Original Plan
- Read the implementation plan from the provided path
- Understand the current architecture, phases, and technical decisions
- Note risk assessments and mitigation strategies
- Identify dependencies and critical path
- Review resource allocations and timelines

### Step 2: Gather Technical Feedback
Ask the user to provide feedback in one of these formats:

1. **Structured feedback** (preferred):
   - Team member name and role (architect, senior engineer, DevOps, etc.)
   - Specific section or component being addressed
   - Nature of feedback (technical concern, alternative approach, risk identification)
   - Severity/impact of the feedback

2. **Code review comments**:
   - Architecture concerns
   - Technology stack suggestions
   - Performance considerations
   - Security vulnerabilities

3. **Multiple team inputs**:
   - Collect feedback from different technical roles
   - Note any conflicting technical approaches

### Step 3: Categorize and Analyze Technical Feedback

Organize feedback into categories:
- **Critical Technical Issues** - Must be addressed (security vulnerabilities, architecture flaws, blockers)
- **Performance & Scalability** - Optimization opportunities and concerns
- **Alternative Approaches** - Different technical solutions proposed
- **Resource & Timeline** - Estimation adjustments and capacity concerns
- **Risk Identification** - New risks discovered or mitigation improvements
- **Technical Debt** - Areas where shortcuts might accumulate debt
- **Testing & Quality** - QA concerns and testing strategy improvements
- **Dependencies** - External system or team dependencies

For each piece of feedback, assess:
- Technical validity and feasibility
- Impact on system architecture
- Effect on timeline and resources
- Risk implications
- Long-term maintenance considerations

### Step 4: Process and Integrate Technical Feedback

For each feedback item:

1. **Accept and Integrate**:
   - Modify relevant plan sections
   - Update architecture diagrams
   - Adjust timelines and resources
   - Revise risk assessments
   - Update implementation tickets

2. **Defer to Later Phase**:
   - Document in "Future Optimizations" section
   - Explain technical rationale for deferral
   - Note prerequisites for future implementation

3. **Decline with Technical Justification**:
   - Document why feedback wasn't incorporated
   - Provide technical explanation
   - Suggest alternatives if applicable

4. **Flag for Architecture Review**:
   - Items requiring deeper technical discussion
   - Prepare specific technical questions

### Step 5: Resolve Technical Conflicts
When team members provide conflicting technical approaches:
- Document each approach with pros/cons
- Analyze based on:
  - System architecture principles
  - Performance implications
  - Maintainability
  - Team expertise
  - Technical debt accumulation
- Recommend resolution with technical justification
- Escalate to architect/CTO if needed

### Step 6: Update Plan Sections

Systematically update the implementation plan:

1. **Technical Architecture**:
   - Refine system design based on feedback
   - Update technology choices
   - Modify integration approaches
   - Adjust database schema if needed

2. **Development Phases**:
   - Resequence based on dependency feedback
   - Adjust phase boundaries
   - Update deliverables

3. **Resource Allocation**:
   - Adjust estimates based on team input
   - Modify skill requirements
   - Update team composition

4. **Risk Assessment**:
   - Add newly identified risks
   - Enhance mitigation strategies
   - Update risk priorities

5. **Testing Strategy**:
   - Incorporate QA feedback
   - Adjust coverage targets
   - Update testing timeline

6. **Implementation Tickets**:
   - Refine acceptance criteria
   - Adjust effort estimates
   - Update dependencies
   - Add technical notes

### Step 7: Recalculate Timeline and Resources

Based on accepted changes:
- Recalculate critical path
- Adjust phase durations
- Update resource requirements
- Revise milestone dates
- Ensure buffer allocations remain appropriate

### Step 8: Create Technical Change Summary

Generate a comprehensive change summary including:

- **Version Information**:
  - New version number
  - Date of revision
  - Review participants and their roles

- **Architecture Changes**:
  - Technology stack modifications
  - Design pattern updates
  - Integration approach changes

- **Timeline Impacts**:
  - Original vs. revised estimates
  - Critical path changes
  - Resource allocation adjustments

- **Risk Updates**:
  - New risks identified
  - Mitigation improvements
  - Risk priority changes

- **Technical Decisions**:
  - Key technical trade-offs made
  - Rationale for each decision
  - Alternatives considered

## Output Format
Create two files:

### 1. Updated Implementation Plan
Save at `/plans/implementation-plan-{product-name}-v{version}-{timestamp}.md` with:
- All accepted changes integrated
- Updated architecture diagrams
- Revised timelines and resources
- Modified risk assessments
- Updated implementation tickets
- Clear version header with revision history

### 2. Technical Change Log
Save at `/plans/changelog-implementation-{product-name}-{timestamp}.md` with:

```markdown
# Implementation Plan Change Log: {Product Name}
**Original Version:** {version}
**Updated Version:** {new version}
**Review Date:** {date}
**Technical Reviewers:** {list of team members and roles}

## Executive Summary of Changes
[High-level overview of major technical changes and timeline impacts]

## Architecture & Design Changes

### Change: {Description}
**Reviewer:** {Name, Role}
**Original Approach:** {Original design/technology}
**Updated Approach:** {New design/technology}
**Technical Rationale:** {Why this change improves the solution}
**Impact:** 
- Timeline: {impact}
- Resources: {impact}
- Risk: {impact}

[Repeat for each architecture change]

## Timeline & Resource Adjustments

### Adjustment: {Description}
**Reviewer:** {Name, Role}
**Original Estimate:** {time/resources}
**Updated Estimate:** {time/resources}
**Justification:** {Technical reasoning}
**Dependencies Affected:** {list}

## Risk Assessment Updates

### New Risk: {Description}
**Identified By:** {Name, Role}
**Category:** {Technical/Security/Performance/etc}
**Impact:** {High/Medium/Low}
**Mitigation Strategy:** {Approach}

### Updated Risk: {Description}
**Reviewer:** {Name, Role}
**Original Assessment:** {description}
**Updated Assessment:** {description}
**Improved Mitigation:** {strategy}

## Testing Strategy Improvements

### Enhancement: {Description}
**Suggested By:** {Name, Role}
**Area:** {Unit/Integration/Performance/Security}
**Change:** {What was added/modified}
**Expected Outcome:** {Quality improvement}

## Deferred Technical Improvements

### Item: {Description}
**Suggested By:** {Name, Role}
**Proposal:** {Technical approach suggested}
**Decision:** Deferred to {phase/future}
**Technical Rationale:** {Why deferred}
**Prerequisites:** {What needs to happen first}

## Declined Technical Suggestions

### Item: {Description}
**Suggested By:** {Name, Role}
**Proposal:** {Technical approach suggested}
**Decision:** Not incorporated
**Technical Justification:** {Detailed explanation}
**Alternative Approach:** {If applicable}

## Technical Conflict Resolutions

### Conflict: {Technical decision point}
**Option A:** {Description} - Proposed by {Name}
  - Pros: {list}
  - Cons: {list}
**Option B:** {Description} - Proposed by {Name}
  - Pros: {list}
  - Cons: {list}
**Resolution:** {Decision made}
**Technical Rationale:** {Detailed reasoning}

## Implementation Ticket Updates

### Ticket: {TICKET-XXX}
**Feedback From:** {Name, Role}
**Changes:**
- Effort: {original} → {updated}
- Dependencies: {added/removed}
- Technical notes: {additions}
- Acceptance criteria: {modifications}

## Outstanding Technical Questions

1. **For {Team/Role}:** {Technical question}
2. **For {Team/Role}:** {Technical question}

## Updated Metrics
- **Total Duration:** {original} → {updated}
- **Total Effort:** {original} → {updated}
- **Team Size:** {original} → {updated}
- **Critical Path Length:** {original} → {updated}
- **Risk Score:** {original} → {updated}

## Next Steps
- [ ] Conduct architecture review for {items}
- [ ] Update project tracking tools
- [ ] Communicate changes to development team
- [ ] Review updated estimates with stakeholders
- [ ] Schedule technical deep-dives for {topics}
```

## Interactive Guidelines

1. **Initial Setup**:
   - Confirm the implementation plan file to update
   - Ask how the user wants to provide feedback
   - Clarify the technical roles of reviewers

2. **Feedback Collection**:
   - If feedback lacks technical detail, ask for specifics
   - Probe for performance/scalability concerns
   - Understand security implications
   - Clarify resource availability constraints

3. **Technical Analysis**:
   - Validate technical feasibility of suggestions
   - Consider system-wide implications
   - Evaluate long-term maintainability
   - Assess technical debt implications

4. **Conflict Resolution**:
   - Present technical trade-offs clearly
   - Use data/benchmarks where available
   - Consider team expertise and comfort
   - Suggest proof-of-concept approaches for validation

5. **Quality Checks**:
   - Ensure changes maintain architectural coherence
   - Verify timeline remains achievable
   - Check resource allocations are realistic
   - Confirm risk mitigations are adequate
   - Validate test coverage remains comprehensive

6. **User Confirmation**:
   - Summarize major technical changes
   - Highlight timeline/resource impacts
   - Confirm critical technical decisions
   - Review version numbering

## Important Notes
- Maintain technical accuracy and feasibility
- Preserve architectural principles unless explicitly changed
- Keep estimates realistic based on team capabilities
- Document all technical decisions for future reference
- Consider operational and maintenance implications
- Ensure changes don't introduce technical contradictions
- Flag any changes that significantly impact system architecture
- Be precise when documenting technical rationale
- Always consider security and performance implications
- Track technical debt accumulation
- Ensure implementation remains aligned with PRD requirements
- Validate that testing strategy covers all changes
- Consider DevOps and deployment implications
- Maintain clear traceability between feedback and changes