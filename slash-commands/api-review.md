---
name: api-review
description: Analyze API design and create an API improvement plan
pattern: /api-review(?:\s+(.+))?
---

Using @agent-api-designer prepare an API review report. You must analyze API design patterns, RESTful practices, and interface consistency in the codebase and create a comprehensive plan WITHOUT making any changes.

## Input Parsing
The user invoked: /api-review {optional_scope}

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
1. First, understand the codebase and identify API patterns
2. Analyze API design, consistency, and documentation
3. Create a prioritized API improvement plan
4. Save your plan as a markdown file in the /plans directory

## Analysis Steps
1. **API Design Review**
   - RESTful compliance assessment
   - Endpoint naming consistency
   - HTTP method usage
   - Status code appropriateness
   - Request/response structure
   - API versioning strategy

2. **Documentation Assessment**
   - OpenAPI/Swagger coverage
   - Endpoint documentation quality
   - Example requests/responses
   - Error documentation
   - Authentication documentation
   - Rate limiting documentation

3. **Developer Experience Analysis**
   - API discoverability
   - Consistency across endpoints
   - Error message quality
   - SDK/client library support
   - Testing tools availability
   - Sandbox environment

## Output Format
Create a markdown file at `/plans/api-review-{timestamp}.md` with:

```markdown
# API Review Plan
Generated: {timestamp}
Scope: {full_path_or_entire_project}

## Executive Summary
Brief overview of API design quality and critical findings

## API Design Findings
### Critical Issues (Breaking Changes)
- [ ] Non-RESTful endpoint: /doAction
- [ ] Inconsistent authentication: Service Y
- [ ] Missing versioning: API Z

### High Priority Issues
- [ ] Inconsistent naming: Mix of camelCase/snake_case
- [ ] Wrong HTTP methods: GET with side effects
- [ ] Poor error responses: Generic 500 errors

### Medium Priority Issues
- [ ] Missing pagination: Large collections
- [ ] No HATEOAS: Resource links absent
- [ ] Incomplete documentation: Endpoints undocumented

## Current API Assessment
### API Inventory
- Total endpoints: X
- Public APIs: Y
- Internal APIs: Z
- Documented: N%
- Versioned: M%

### Design Patterns
- Architecture style: REST/GraphQL/RPC
- Naming convention: Current pattern
- Authentication: Method used
- Authorization: Approach
- Rate limiting: Implementation

## API Improvement Plan
### Immediate Actions (1-3 days)
1. Fix non-RESTful endpoints
2. Standardize error responses
3. Add missing authentication

### Short-term Improvements (1-2 weeks)
1. Implement consistent naming
2. Add comprehensive documentation
3. Standardize response formats

### Long-term Transformations (2-6 weeks)
1. Implement API versioning strategy
2. Add GraphQL layer if beneficial
3. Create developer portal

## RESTful Compliance
### Resource Design
- [ ] Nouns for resources
- [ ] Proper HTTP methods
- [ ] Stateless operations
- [ ] Consistent URL structure

### HTTP Standards
- [ ] Correct status codes
- [ ] Proper headers usage
- [ ] Content negotiation
- [ ] CORS configuration

## Documentation Improvements
### OpenAPI Specification
- Coverage target: 100%
- Missing endpoints: List
- Schema definitions needed
- Example additions required

### Developer Documentation
- Getting started guide
- Authentication guide
- Rate limiting explanation
- Error handling guide
- SDK documentation

## Consistency Enhancements
### Naming Conventions
- Endpoints: /resource-name pattern
- Fields: camelCase standard
- Query parameters: Consistent format
- Headers: Standard naming

### Response Structure
```json
{
  "data": {},
  "meta": {
    "timestamp": "",
    "version": ""
  },
  "errors": [],
  "links": {}
}
```

## Error Handling
### Error Response Standard
```json
{
  "error": {
    "code": "SPECIFIC_ERROR_CODE",
    "message": "Human readable message",
    "details": {},
    "timestamp": "",
    "path": "/api/endpoint"
  }
}
```

### Error Codes
- 400: Bad Request with details
- 401: Unauthorized access
- 403: Forbidden resource
- 404: Resource not found
- 422: Validation errors
- 429: Rate limit exceeded
- 500: Internal server error

## Performance Optimization
### Caching Strategy
- Cache headers implementation
- ETags usage
- Conditional requests
- CDN integration

### Pagination Implementation
- Limit/offset pattern
- Cursor-based pagination
- Default page sizes
- Maximum limits

## Security Enhancements
### Authentication
- OAuth 2.0 implementation
- API key management
- JWT token strategy
- Session handling

### Authorization
- Role-based access
- Resource-level permissions
- Scope definitions
- Policy enforcement

## Versioning Strategy
### Version Approach
- URL versioning: /v1/resource
- Header versioning: Accept-Version
- Deprecation policy
- Migration guides

### Backward Compatibility
- Breaking change policy
- Deprecation notices
- Sunset headers
- Migration timeline

## GraphQL Considerations
### When to Add GraphQL
- Complex data relationships
- Mobile app optimization
- Reducing over-fetching
- Client flexibility needs

### Implementation Plan
- Schema design
- Resolver patterns
- Performance considerations
- Migration strategy

## Developer Experience
### API Portal Features
- Interactive documentation
- API playground
- Code examples
- SDK downloads
- Webhook testing

### Client Libraries
- JavaScript/TypeScript SDK
- Python client
- Java library
- Mobile SDKs

## Monitoring and Analytics
### API Metrics
- Request volume
- Response times
- Error rates
- Usage patterns

### SLA Targets
- Availability: 99.9%
- Response time: < 200ms
- Error rate: < 0.1%

## Estimated Impact
- Developer satisfaction: +40%
- Integration time: -60%
- Support tickets: -50%
- API adoption: +100%

## Implementation Roadmap
### Phase 1: Standardization (Week 1-2)
- Fix critical issues
- Standardize responses
- Document existing APIs

### Phase 2: Enhancement (Week 3-4)
- Add versioning
- Improve documentation
- Implement pagination

### Phase 3: Excellence (Week 5-6)
- Developer portal
- Advanced features
- Performance optimization
```

Remember: DO NOT make any changes. Only analyze and report.