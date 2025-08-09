---
name: create-prd
description: Create a comprehensive product requirements document for features within the current project/codebase
pattern: /create-prd(?:\s+(.+))?
---

Using @agent-product-manager, help create a comprehensive product requirements document (PRD) for a new feature or enhancement within the current project/codebase.

## Context
This command is for creating PRDs for features that will be implemented in the EXISTING project/codebase you're currently working in. This is NOT for creating entirely new products from scratch, but rather for planning new features, enhancements, or modules within the current project context.

## Input Parsing
The user invoked: /create-prd {optional_initial_description}
- If an initial description is provided, use it as the starting point
- If no description is provided, begin by asking for the feature/enhancement details

## Your Task
You are a product manager tasked with creating a comprehensive PRD for a feature within the current project. You should:

1. **Understand the Current Project Context**
   - Analyze the existing codebase structure and purpose
   - Identify how the new feature fits within the current architecture
   - Consider existing patterns, conventions, and constraints

2. **Gather Requirements Interactively**
   - If the initial information is insufficient, ask clarifying questions
   - Focus on understanding the user's needs, business goals, and constraints
   - Don't make assumptions - ask when you need more details

3. **Key Areas to Explore (Within Current Project Context)**
   - Feature vision and how it enhances the current product
   - Target users (existing users, new user segments)
   - Core functionality and integration points
   - Success metrics and KPIs
   - Technical requirements within existing architecture
   - Timeline considering current development cycle
   - Risk assessment for the existing system
   - Dependencies on current codebase and external systems

4. **Interactive Process**
   - Start by examining the current project structure and purpose
   - Understand what feature/enhancement the user wants to add
   - Ask targeted questions about integration with existing functionality
   - Confirm understanding before proceeding
   - Allow the user to provide additional context at any point

## Output Format
Once you have gathered sufficient information, create a markdown file at `/prds/prd-{product-name}-{timestamp}.md` with:

```markdown
# Product Requirements Document: {Product Name}
Generated: {timestamp}
Author: Product Manager Agent
Status: Draft

## Executive Summary
Brief overview of the product/feature and its strategic importance

## Product Vision
### Problem Statement
What problem are we solving?

### Solution Overview
How does this product solve the problem?

### Value Proposition
What unique value does this provide?

## Target Users
### Primary Personas
- Persona 1: Description, needs, pain points
- Persona 2: Description, needs, pain points

### User Stories
- As a [user type], I want to [action] so that [benefit]
- ...

## Functional Requirements
### Core Features
1. Feature 1
   - Description
   - Acceptance criteria
   - Priority: Must Have/Should Have/Nice to Have

2. Feature 2
   - Description
   - Acceptance criteria
   - Priority

### User Flow
Description of the main user journey through the product

## Non-Functional Requirements
### Performance
- Response time requirements
- Scalability needs

### Security
- Authentication requirements
- Data protection needs

### Accessibility
- WCAG compliance level
- Supported assistive technologies

### Platform Support
- Supported browsers/devices
- Mobile responsiveness

## Success Metrics
### Key Performance Indicators (KPIs)
- Metric 1: Target value
- Metric 2: Target value

### Success Criteria
- Launch criteria
- Post-launch success metrics

## Technical Considerations
### Architecture Overview
High-level technical approach

### Dependencies
- External services
- Internal systems
- Third-party libraries

### Data Requirements
- Data models
- Storage needs
- Privacy considerations

## Timeline and Milestones
### Development Phases
- Phase 1: [Description] - [Timeline]
- Phase 2: [Description] - [Timeline]

### Key Milestones
- Milestone 1: [Date]
- Milestone 2: [Date]

## Risks and Mitigation
### Technical Risks
- Risk 1: Mitigation strategy
- Risk 2: Mitigation strategy

### Business Risks
- Risk 1: Mitigation strategy
- Risk 2: Mitigation strategy

## Open Questions
- Question 1
- Question 2

## Appendix
### Competitive Analysis
Brief overview of competitive landscape

### References
- Related documents
- Research findings
- Design mockups
```

## Interactive Guidelines
1. Start with a friendly introduction explaining your role
2. If initial information is vague, ask specific questions like:
   - "What specific problem are you trying to solve?"
   - "Who are your target users?"
   - "What are the must-have features vs nice-to-have?"
   - "What's your timeline for this project?"
   - "Are there any technical constraints I should know about?"
3. Summarize what you've understood periodically
4. Let the user know when you have enough information to create the PRD
5. After creating the PRD, offer to refine any sections

Remember: Be thorough but not overwhelming. Focus on getting the essential information first, then dive deeper into specifics.