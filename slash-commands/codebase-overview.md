---
name: codebase-overview
description: Generate a comprehensive, beginner-friendly overview of the entire codebase
pattern: /codebase-overview(?:\s+(.+))?
---

Using @agent-mentor create a comprehensive overview of the codebase tailored to the user's experience level, saving the output to the reports directory.

## Input Parsing
The user invoked: /codebase-overview {optional_focus}

Examples:
- `/codebase-overview` - Complete overview
- `/codebase-overview frontend` - Focus on frontend architecture
- `/codebase-overview for beginners` - Simplified overview
- `/codebase-overview data flow` - Focus on how data moves
- `/codebase-overview for new contributors` - Contribution-focused overview

## Your Task

### 1. Assess the Audience
Determine or ask:
- Experience level with the technologies used
- Familiarity with similar codebases
- Specific interests or goals
- Role (developer, reviewer, architect, etc.)

### 2. Analyze the Codebase
Systematically explore:
- Project structure and organization
- Core technologies and frameworks
- Architectural patterns and decisions
- Key modules and their relationships
- Development workflow and tools
- Testing and deployment strategies

### 3. Create Tailored Overview
Build an overview that:
- Matches the user's technical level
- Highlights what matters for their goals
- Provides clear navigation aids
- Includes practical next steps

### 4. Save Output
Create a markdown file at `/reports/codebase-overview-{focus}-{timestamp}.md` with the comprehensive overview.

## Overview Structure

```markdown
# Codebase Overview: [Project Name]

## Quick Start
**What this project does**: [One sentence description]
**Tech stack**: [Main technologies]
**Architecture style**: [e.g., microservices, monolith, etc.]

## Project Structure

### Directory Layout
```
project-root/
├── src/              # Main source code
│   ├── api/          # API endpoints
│   ├── services/     # Business logic
│   ├── models/       # Data models
│   └── utils/        # Shared utilities
├── tests/            # Test suites
├── docs/             # Documentation
└── config/           # Configuration files
```

### Key Directories Explained

#### `/src/api`
**Purpose**: Handles all incoming HTTP requests
**Key files**:
- `routes.ts` - Route definitions
- `middleware/` - Request processing

**Start here if**: You're adding new endpoints

#### `/src/services`
**Purpose**: Core business logic
**Key concepts**: Service layer pattern
**Important classes**:
- `UserService` - User management
- `DataProcessor` - ETL operations

**Start here if**: You're implementing features

[Continue for each major directory...]

## Architecture Overview

### High-Level Design
```
[ASCII or mermaid diagram showing system architecture]

Client → API Gateway → Services → Database
           ↓              ↓
        Cache         Message Queue
```

### Design Principles
1. **Separation of Concerns**: Each module has one responsibility
2. **Dependency Injection**: Services are injected, not instantiated
3. **Event-Driven**: Components communicate through events

### Data Flow
1. Request arrives at API endpoint
2. Middleware validates and authenticates
3. Service layer processes business logic
4. Data layer handles persistence
5. Response formatted and returned

**Example Flow**: User Registration
```
POST /api/register
  → ValidationMiddleware (check email format)
  → AuthController.register()
  → UserService.createUser()
  → UserRepository.save()
  → EmailService.sendWelcome()
  → Return success response
```

## Core Components

### Authentication System
**Location**: `/src/auth`
**How it works**: JWT-based with refresh tokens
**Key files**:
- `auth.service.ts` - Token generation/validation
- `auth.middleware.ts` - Route protection

### Data Layer
**Location**: `/src/database`
**Technology**: [e.g., PostgreSQL with TypeORM]
**Patterns**: Repository pattern, migrations

### API Layer
**Location**: `/src/api`
**Framework**: [e.g., Express.js]
**Documentation**: [Link to API docs]

## Key Patterns & Conventions

### Coding Standards
- **Naming**: camelCase for variables, PascalCase for classes
- **File structure**: One class/component per file
- **Imports**: Absolute paths from /src

### Common Patterns

#### Service Pattern
```typescript
// All business logic in services
class UserService {
  constructor(private repo: UserRepository) {}
  
  async createUser(data: CreateUserDto) {
    // Business logic here
  }
}
```

#### Error Handling
```typescript
// Consistent error handling
try {
  await riskyOperation();
} catch (error) {
  throw new AppError('User-friendly message', 400);
}
```

## Development Workflow

### Getting Started
1. Clone repository
2. Install dependencies: `npm install`
3. Set up environment: Copy `.env.example` to `.env`
4. Run database migrations: `npm run migrate`
5. Start development: `npm run dev`

### Making Changes
1. Create feature branch
2. Make changes with tests
3. Run linters: `npm run lint`
4. Submit PR with description

### Testing
- **Unit tests**: `npm test`
- **Integration tests**: `npm run test:integration`
- **E2E tests**: `npm run test:e2e`

## Important Files to Know

### Configuration
- `.env` - Environment variables
- `config/database.ts` - Database settings
- `tsconfig.json` - TypeScript configuration

### Entry Points
- `src/index.ts` - Application start
- `src/app.ts` - Express app setup
- `src/routes.ts` - All route definitions

### Key Utilities
- `src/utils/logger.ts` - Logging
- `src/utils/validation.ts` - Input validation
- `src/utils/errors.ts` - Error classes

## Common Tasks

### Adding a New Feature
1. Start with the route in `/src/api/routes`
2. Create service in `/src/services`
3. Add data model if needed in `/src/models`
4. Write tests in `/tests`

### Debugging Issues
1. Check logs in `/logs` directory
2. Use debugger with VS Code launch config
3. Common issues documented in `/docs/troubleshooting.md`

### Performance Optimization
- Profiling tools in `/tools/profile`
- Caching layer in `/src/cache`
- Database query optimization guide in docs

## Technology Deep Dives

### [Main Framework]
**Why we use it**: [Reasoning]
**Key concepts to understand**:
- [Concept 1]
- [Concept 2]
**Learn more**: [Resources]

### Database
**Type**: [SQL/NoSQL]
**Why this choice**: [Reasoning]
**Important to know**:
- Migration system
- Query optimization
- Connection pooling

## Where to Start

### For New Contributors
1. Read `/docs/CONTRIBUTING.md`
2. Try the tutorial in `/docs/tutorial`
3. Pick a "good first issue" from GitHub
4. Join our Discord/Slack for questions

### For Feature Development
1. Understand the service layer pattern
2. Review similar existing features
3. Follow the pattern in `/src/services/example`

### For Bug Fixes
1. Reproduce locally first
2. Check existing tests
3. Add test for the bug
4. Fix and verify

## Resources & Documentation

### Internal Docs
- Architecture Decision Records: `/docs/adr`
- API Documentation: `/docs/api`
- Development Guide: `/docs/development.md`

### External Resources
- [Framework Documentation]
- [Database Documentation]
- [Team Wiki/Confluence]

## Getting Help

### Quick Questions
- Check `/docs/FAQ.md`
- Search existing issues
- Ask in team chat

### Deep Dives
- Use `/explain [topic]` for detailed explanations
- Schedule pairing session
- Review similar PRs

## Glossary

**Common Terms in This Codebase**:
- **DTO**: Data Transfer Object - shapes for API data
- **Repository**: Data access layer abstraction
- **Middleware**: Request processing functions
- **Service**: Business logic container
[Add project-specific terms]

## Next Steps

Based on your goals:
- **To contribute**: Start with a good first issue
- **To understand deeply**: Follow the `/learn` path
- **To modify**: Pick a simple feature to trace through
- **To review**: Start with recent PRs for context
```

## Customization Levels

### For Beginners
Focus on:
- Simple, clear explanations
- Avoid technical jargon
- More analogies and examples
- Step-by-step instructions
- Visual aids and diagrams

### For Experienced Developers
Include:
- Technical details and trade-offs
- Performance considerations
- Advanced patterns
- Architecture decisions
- Optimization opportunities

### For Architects/Reviewers
Emphasize:
- System design decisions
- Scalability considerations
- Technical debt areas
- Future roadmap
- Integration points

## Interactive Elements

When focus is unclear:
```
Mentor: I'll create a codebase overview for you. To make it most helpful:
- What's your experience with [main technology]?
- Are you planning to contribute or just understand?
- Any specific areas you're most interested in?
```

## Important Guidelines

1. **Start with the forest, then trees** - Big picture first
2. **Use actual paths and files** - Not generic examples
3. **Provide clear navigation** - Where to find things
4. **Include practical examples** - Show, don't just tell
5. **Suggest concrete next steps** - What to do after reading

Remember: A good overview is a map that helps developers navigate confidently, not a exhaustive catalog of every detail.