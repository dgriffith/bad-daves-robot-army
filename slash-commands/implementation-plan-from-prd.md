Using the development manager subagent, create a comprehensive implementation plan from a Product Requirements Document (PRD) for features within the current project/codebase.

## Context
This command generates implementation plans for features that will be developed within the EXISTING project/codebase you're currently working in. The plan should consider the current architecture, existing patterns, and technical constraints of the project. This is NOT for planning entirely new products from scratch.

## Input Parsing
The user invoked: /implementation-plan-from-prd {prd_file_path}
- Parse the prd_file_path parameter (should be a path to a file in /prds directory)
- If no file path provided, list available PRDs and ask user to specify

## Your Task
You need to analyze the provided PRD and generate a comprehensive technical implementation plan that fits within the current project context. The plan should help development managers and technical leads translate product requirements into actionable development work that integrates with the existing codebase.

### Step 1: Understand Current Project Context
- Analyze the existing codebase structure and architecture
- Identify current technology stack and patterns
- Review existing modules and their interactions
- Understand the project's conventions and constraints

### Step 2: Read and Analyze the PRD
- Read the PRD file from the provided path
- Identify key sections: executive summary, requirements, user stories, constraints, success metrics
- Understand how the feature fits within the current project scope
- Assess integration points with existing functionality

### Step 3: Detect Feature Type
Analyze the PRD to determine the feature type within the current project:
- New module or component
- Enhancement to existing functionality
- API endpoint additions
- Data model extensions
- Integration with external services
- Performance optimization
- UI/UX improvements
- Infrastructure changes

### Step 4: Generate Implementation Plan Components

Create a comprehensive plan with ALL of the following sections:

#### 1. Technical Architecture Breakdown
- How the feature integrates with current architecture (with ASCII diagrams where helpful)
- Leverage existing technology stack and patterns
- Database schema changes or extensions needed
- New API endpoints or modifications to existing ones
- Integration points with current modules
- Impact on system scalability and performance
- Security considerations within existing framework

#### 2. Development Phases and Milestones
- Break implementation into logical phases (typically 3-5)
- Define clear deliverables for each phase
- Identify MVP scope vs. full feature set
- Set milestone checkpoints with success criteria
- Explain phase dependencies and ordering rationale
- Include buffer time for unknowns

#### 3. Resource Allocation and Estimates
- Time estimates for each phase (in weeks/sprints)
- Required skill sets (frontend, backend, DevOps, QA, etc.)
- Team size recommendations
- Effort distribution across phases
- Critical path identification
- Include 20-30% buffer for complexity and unknowns

#### 4. Risk Assessment and Mitigation
- Technical risks (categorized by impact: High/Medium/Low)
- Third-party dependency risks
- Performance and scalability risks
- Security vulnerabilities
- Integration risks
- For each risk: provide specific mitigation strategies
- Include contingency plans for high-impact risks

#### 5. Dependencies and Blockers
- Internal dependencies between components/phases
- External dependencies (APIs, services, teams)
- Infrastructure prerequisites
- Data migration requirements
- Licensing or compliance requirements
- Create dependency graph showing critical path
- Identify potential blockers and resolution strategies

#### 6. Testing Strategy
- Unit testing approach and coverage targets
- Integration testing plan
- End-to-end testing scenarios
- Performance testing requirements and benchmarks
- Security testing considerations
- User acceptance testing process
- Test automation strategy
- Testing timeline aligned with development phases

**Technical Notes:**
[Any important technical considerations]
```

### Step 5: Quality Checks
Before finalizing, ensure the plan:
- Addresses all functional and non-functional requirements from the PRD
- Properly integrates with the existing codebase architecture
- Follows current project conventions and patterns
- Includes realistic time estimates with appropriate buffers
- Identifies risks to the existing system
- Provides clear, actionable next steps
- Is suitable for import into project management tools

### Output Format
Create a markdown file at `/plans/implementation-plan-{product-name}-{timestamp}.md` with the complete plan.

The output should include:
1. A table of contents for easy navigation
2. All sections clearly formatted with consistent heading hierarchy
3. Summary metrics at the top (total duration, team size, key risks)
4. Executive summary for stakeholders

## Important Notes
- Be specific and actionable - avoid generic recommendations
- Work within the constraints of the existing codebase and architecture
- Leverage existing patterns, libraries, and conventions already in use
- Consider how the feature impacts technical debt and maintainability
- Ensure estimates are realistic for a team familiar with the codebase
- Flag any areas where the PRD conflicts with existing architecture
- Adapt the level of detail based on feature complexity
- Remember this is for dev managers and tech leads working on an existing project - focus on integration and consistency with current implementation
- Do _not_ create individual tickets for this work yet.  That will be done once this top-level plan is completed and reviewed