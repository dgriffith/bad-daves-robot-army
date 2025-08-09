---
name: process-prd-feedback
description: Process stakeholder feedback on a PRD and create an updated version incorporating their input
pattern: /process-prd-feedback(?:\s+(.+))?
---

Using @agent-product-manager, process stakeholder feedback on an existing Product Requirements Document (PRD) and create an updated version that incorporates their input while maintaining document coherence and tracking changes.

## Context
This command helps product managers systematically process feedback from various stakeholders (engineering, design, business, customers) and create a revised PRD that addresses concerns, incorporates suggestions, and documents decisions about what feedback was accepted or deferred.

## Input Parsing
The user invoked: /process-prd-feedback {prd_file_path}
- Parse the prd_file_path parameter (should be a path to a file in /prds directory)
- If no file path provided, list available PRDs and ask user to specify

## Your Task
You need to gather stakeholder feedback, analyze it, and create an updated PRD version that thoughtfully incorporates the input while maintaining document quality and coherence.

### Step 1: Read and Understand the Original PRD
- Read the PRD file from the provided path
- Understand the current scope, requirements, and constraints
- Note any areas marked as "open questions" or "needs validation"
- Identify sections that commonly receive feedback

### Step 2: Gather Stakeholder Feedback
Ask the user to provide feedback in one of these formats:
1. **Structured feedback** (preferred):
   - Stakeholder name and role
   - Specific section or requirement being addressed
   - Nature of feedback (concern, suggestion, requirement change)
   - Priority/severity of the feedback

2. **Unstructured feedback**:
   - Raw comments, emails, or meeting notes
   - You'll need to parse and categorize this feedback

3. **Multiple stakeholder inputs**:
   - Collect feedback from different stakeholders
   - Note any conflicting feedback that needs resolution

### Step 3: Categorize and Analyze Feedback

Organize feedback into categories:
- **Critical Changes** - Must be addressed (blockers, compliance, feasibility issues)
- **Important Enhancements** - Should be incorporated (significant improvements)
- **Minor Suggestions** - Nice to have (polish, future considerations)
- **Clarifications** - Areas needing more detail or explanation
- **Conflicts** - Contradictory feedback from different stakeholders

For each piece of feedback, determine:
- Impact on scope, timeline, or resources
- Dependencies on other requirements
- Alignment with product vision
- Technical feasibility concerns

### Step 4: Process and Integrate Feedback

For each feedback item:
1. **Accept and Integrate**:
   - Modify relevant PRD sections
   - Update acceptance criteria
   - Adjust success metrics if needed
   - Note the change in revision history

2. **Defer to Future Phase**:
   - Document in "Future Enhancements" section
   - Explain rationale for deferral
   - Set expectation for when it might be addressed

3. **Decline with Rationale**:
   - Document why feedback wasn't incorporated
   - Provide clear explanation
   - Suggest alternatives if applicable

4. **Request Clarification**:
   - Flag items needing more information
   - Prepare specific questions for stakeholders

### Step 5: Resolve Conflicts
When stakeholders provide conflicting feedback:
- Document both perspectives
- Analyze trade-offs
- Recommend a resolution based on:
  - Product vision alignment
  - User impact
  - Technical feasibility
  - Resource constraints
- Flag for executive decision if needed

### Step 6: Update PRD Sections

Systematically update the PRD:
1. **Executive Summary** - Reflect any major scope changes
2. **Requirements** - Modify based on accepted feedback
3. **User Stories** - Adjust or add based on input
4. **Success Metrics** - Update if goals have shifted
5. **Timeline** - Adjust if scope changes impact schedule
6. **Risks** - Add new risks identified through feedback
7. **Dependencies** - Update based on technical feedback

### Step 7: Create Change Summary

Generate a comprehensive change summary including:
- **Version Information**:
  - New version number
  - Date of revision
  - Review participants

- **Changes Incorporated**:
  - List of accepted changes by section
  - Rationale for each change
  - Impact assessment

- **Feedback Deferred**:
  - Items moved to backlog
  - Reasoning for deferral
  - Potential future consideration

- **Feedback Declined**:
  - Items not incorporated
  - Clear rationale for decisions

- **Outstanding Items**:
  - Questions needing clarification
  - Decisions pending stakeholder alignment

## Output Format
Create two files:

### 1. Updated PRD
Save at `/prds/prd-{product-name}-v{version}-{timestamp}.md` with:
- All accepted changes integrated
- Clear version header with revision history
- Highlighted changes (using markdown formatting)
- Updated sections maintaining document flow

### 2. Change Log
Save at `/prds/changelog-{product-name}-{timestamp}.md` with:

```markdown
# PRD Change Log: {Product Name}
**Original Version:** {version}
**Updated Version:** {new version}
**Review Date:** {date}
**Participants:** {list of stakeholders}

## Executive Summary of Changes
[High-level overview of major changes]

## Accepted Changes

### Section: {Section Name}
**Stakeholder:** {Name, Role}
**Original:** {Original text/requirement}
**Updated:** {New text/requirement}
**Rationale:** {Why this change was accepted}
**Impact:** {Scope/Timeline/Resource impact}

[Repeat for each accepted change]

## Deferred Items

### Item: {Description}
**Stakeholder:** {Name, Role}
**Request:** {What was requested}
**Decision:** Deferred to {phase/backlog}
**Rationale:** {Why deferred}

## Declined Feedback

### Item: {Description}
**Stakeholder:** {Name, Role}
**Request:** {What was requested}
**Decision:** Not incorporated
**Rationale:** {Clear explanation}
**Alternative:** {If applicable}

## Conflict Resolutions

### Conflict: {Description}
**Stakeholder A Position:** {Description}
**Stakeholder B Position:** {Description}
**Resolution:** {Decision made}
**Rationale:** {Reasoning}

## Outstanding Questions

1. **For {Stakeholder}:** {Question}
2. **For {Stakeholder}:** {Question}

## Next Steps
- [ ] Follow up on outstanding questions
- [ ] Schedule review of updated PRD
- [ ] Communicate changes to team
```

## Interactive Guidelines

1. **Initial Setup**:
   - Confirm the PRD file to update
   - Ask how the user wants to provide feedback
   - Set expectations about the process

2. **Feedback Collection**:
   - If feedback seems incomplete, ask for more details
   - Probe for stakeholder roles and priorities
   - Clarify ambiguous feedback

3. **Conflict Resolution**:
   - When conflicts arise, present trade-offs clearly
   - Suggest compromises where possible
   - Escalate to user for decision when needed

4. **Quality Checks**:
   - Ensure changes maintain document coherence
   - Verify requirements remain testable
   - Check that success metrics are still measurable
   - Confirm timeline remains realistic

5. **User Confirmation**:
   - Summarize major changes before finalizing
   - Allow user to review and adjust decisions
   - Confirm version numbering

## Important Notes
- Maintain document quality and readability after changes
- Preserve the original product vision unless explicitly changed
- Keep requirements specific and measurable
- Document all decisions for future reference
- Consider downstream impacts (development, testing, deployment)
- Ensure changes don't introduce contradictions
- Flag any changes that significantly impact timeline or resources
- Be diplomatic when documenting declined feedback
- Always provide clear rationale for decisions