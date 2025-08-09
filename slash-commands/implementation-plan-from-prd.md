Using the development manager subagent, create a comprehensive implementation plan from a Product Requirements Document (PRD).

## Input Parsing
The user invoked: /implementation-plan-from-prd {prd_file_path}
- Parse the prd_file_path parameter (should be a path to a file in /prds directory)
- If no file path provided, list available PRDs and ask user to specify

## Your Task
You need to analyze the provided PRD and generate a comprehensive technical implementation plan. The plan should help development managers and technical leads translate product requirements into actionable development work.

### Step 1: Read and Analyze the PRD
- Read the PRD file from the provided path
- Identify key sections: executive summary, requirements, user stories, constraints, success metrics
- Understand the project scope, complexity, and technical implications

### Step 2: Detect Project Type
Analyze the PRD to determine the project type:
- Web application
- Mobile application  
- API service
- Data processing system
- Infrastructure project
- Integration project
- Other/hybrid

### Step 3: Generate Implementation Plan Components

Create a comprehensive plan with ALL of the following sections:

#### 1. Technical Architecture Breakdown
- System architecture design (with ASCII diagrams where helpful)
- Technology stack recommendations based on requirements
- Database schema considerations
- API design patterns and endpoints
- Integration points and interfaces
- Scalability and performance considerations
- Security architecture

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

#### 7. Implementation Tickets
Generate 8-15 implementation tickets that are:
- More detailed than epics but less granular than individual tasks
- Each representing 3-10 days of development work
- Organized by development phase
- Include clear acceptance criteria
- Note which tickets can be worked in parallel
- Flag tickets that may need further decomposition

Format each ticket as:
```
### TICKET-[NUMBER]: [Title]
**Phase:** [Phase number]
**Estimated Effort:** [X-Y days]
**Dependencies:** [List any dependent tickets]
**Skills Required:** [frontend/backend/etc]

**Description:**
[2-3 sentences describing the work]

**Acceptance Criteria:**
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

**Technical Notes:**
[Any important technical considerations]
```

### Step 4: Quality Checks
Before finalizing, ensure the plan:
- Addresses all functional and non-functional requirements from the PRD
- Includes realistic time estimates with appropriate buffers
- Identifies all major technical risks
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
- Consider technical debt and maintainability in your recommendations
- Ensure estimates are realistic for a professional development team
- Flag any areas where the PRD lacks sufficient detail for planning
- Adapt the level of detail based on project complexity
- Remember this is for dev managers and tech leads - be technically detailed but also consider resource management aspects