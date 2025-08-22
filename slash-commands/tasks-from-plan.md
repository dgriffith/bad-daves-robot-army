---
name: tasks-from-plan
description: Convert a review plan into GitHub issues for tracking
pattern: /tasks-from-plan(?:\s+(.+))?
---

Convert a plan file into GitHub issues for systematic implementation. Each task in the plan will become a GitHub issue with appropriate labels and assignment recommendations.

## Input Parsing
The user invoked: /tasks-from-plan {plan_file_path}
- The path should point to a plan file (typically in /plans directory)
- If no path is provided, list available plan files and ask user to specify

## Your Task
1. Read the specified plan file
2. Parse the plan to identify discrete tasks
3. Group tasks by priority/phase
4. Create GitHub issues for each actionable task
5. Be sure to create any tags you wish for the issues BEFORE trying to create the issues
5. DO NOT implement any tasks - only create tracking issues

## Issue Creation Strategy

### For Each Task:
1. **Title**: Concise, actionable task description
2. **Body**: Include:
   - Task details from the plan
   - Priority level (Critical/High/Medium/Low)
   - Phase/timeline information
   - Recommended specialist agent for implementation
   - Success criteria if specified
   - Dependencies on other tasks
3. **Labels**: Add appropriate labels:
   - Priority label (priority-critical, priority-high, priority-medium, priority-low)
   - Type label based on review type (security, performance, architecture, etc.)
   - Phase label if applicable (phase-1, phase-2, etc.)
   - Agent recommendation label

## Agent Assignment Mapping

Based on the review type and task nature, recommend the appropriate specialist:

| Task Type | Recommended Agent |
|-----------|------------------|
| Security fixes | @agent-security-master |
| Performance optimization | @agent-performance-optimizer |
| Architecture changes | @agent-architect |
| Documentation | @agent-code-documentor |
| Testing improvements | @agent-test-automator |
| Refactoring | @agent-refactorer |
| Modernization | @agent-code-modernizer |
| Build/CI/CD | @agent-build-master |
| Configuration | @agent-configuration-manager |
| Debugging/fixes | @agent-debugger |
| Error handling | @agent-exception-handling-master |
| Logging | @agent-logging-master |
| Developer tooling | @agent-toolsmith |
| Internationalization | @agent-internationalization-specialist |
| Accessibility | @agent-accessibility-specialist |

## Issue Template

```markdown
## Task Overview
{task_description}

## Priority
{Critical/High/Medium/Low}

## Phase
{phase_number_and_name}

## Implementation Details
{detailed_requirements_from_plan}

## Success Criteria
- [ ] {criterion_1}
- [ ] {criterion_2}

## Dependencies
- {list_any_prerequisite_tasks}

## Recommended Specialist
This task should be handled by {agent_name} for optimal implementation.

## Notes
- Generated from: {plan_file_name}
- Review type: {review_type}
```

## Execution Steps

1. **Validate Plan File**
   - Check if file exists
   - Verify it's a valid plan format
   - Identify the review type

2. **Parse Tasks**
   - Extract all actionable items (usually marked with checkboxes or bullets)
   - Group by priority or phase
   - Identify dependencies between tasks

3. **Create Issues**
   - Use `gh issue create` for each task
   - Apply appropriate labels
   - Include cross-references for dependent tasks
   - Add milestone if phases are defined

4. **Summary Report**
   After creating all issues, provide a summary:
   - Total issues created
   - Distribution by priority
   - Links to created issues
   - Suggested implementation order

## Example Commands

```bash
# Create an issue with labels
gh issue create \
  --title "Fix SQL injection vulnerability in user login" \
  --body "..." \
  --label "priority-critical,security,phase-1"

# List created issues
gh issue list --label "generated-from-plan"
```

## Important Notes
- DO NOT attempt to implement any of the tasks
- Focus only on creating well-structured tracking issues
- Ensure each issue is self-contained with enough context
- Add cross-references between related issues
- Tag issues appropriately for filtering and tracking

Remember: Your role is to transform the plan into actionable, trackable work items that can be systematically addressed by the appropriate specialists.