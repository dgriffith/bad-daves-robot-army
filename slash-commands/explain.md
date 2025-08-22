---
name: explain
description: Get a personalized explanation of code, architecture, or concepts in the codebase
pattern: /explain(?:\s+(.+))?
---

Using @agent-mentor provide a detailed, customized explanation of the requested topic or code.

## Input Parsing
The user invoked: /explain {topic_or_path}

Examples:
- `/explain src/auth/middleware.ts` - Explain specific file
- `/explain authentication flow` - Explain a concept
- `/explain why we use Redis here` - Explain architectural decisions
- `/explain the testing strategy` - Explain project practices
- `/explain` - Interactive mode to determine what needs explaining

## Your Task

### 1. Initial Assessment
First, determine:
- What specifically needs to be explained
- The user's current familiarity with the topic
- Their learning goals and context

If the request is vague, ask clarifying questions:
- "What aspect of [topic] would you like to understand?"
- "Are you familiar with [related concept]?"
- "What's your experience level with [technology]?"

### 2. Research Phase
Thoroughly investigate:
- Search the codebase for relevant implementations
- Examine how the code/pattern is actually used
- Look for documentation and comments
- Identify architectural decisions and trade-offs
- Find related components and dependencies

### 3. Explanation Construction
Create a customized explanation that:
- Starts with context and purpose
- Uses appropriate depth based on user's level
- Includes real examples from the codebase
- Explains the "why" not just the "what"
- Highlights important patterns and conventions

## Explanation Structure

### For Code Explanations
```markdown
## Overview
[High-level purpose and context]

## How It Works
[Step-by-step breakdown with code snippets]

## Key Concepts
[Important ideas and patterns used]

## Example Usage
[Real examples from the codebase]

## Common Patterns
[How this fits with other parts]

## Things to Note
[Gotchas, best practices, tips]

## Learn More
[Suggested next topics or files to explore]
```

### For Concept Explanations
```markdown
## What Is [Concept]?
[Clear, accessible definition]

## Why We Use It
[Specific benefits in this codebase]

## How It's Implemented Here
[Concrete examples with file references]

## Key Components
[Break down the parts]

## Real-World Example
[Walk through an actual use case]

## Related Concepts
[Connect to other knowledge]

## Practice Exercise
[Optional hands-on task]
```

### For Architecture Explanations
```markdown
## System Overview
[Big picture understanding]

## Design Decisions
[Why things are structured this way]

## Component Interactions
[How pieces work together]

## Data Flow
[How information moves through the system]

## Trade-offs
[What we gain and what we sacrifice]

## Evolution
[How we got here and where we're going]
```

## Teaching Techniques

### Adjust to Experience Level

**Beginner**:
- Use more analogies and metaphors
- Explain prerequisite concepts
- Provide more context and background
- Break down into smaller steps
- Avoid jargon or explain terms

**Intermediate**:
- Focus on patterns and best practices
- Compare different approaches
- Explain design decisions
- Show edge cases and variations

**Advanced**:
- Dive into implementation details
- Discuss performance implications
- Explore alternative architectures
- Examine trade-offs deeply

### Use Effective Examples

From the actual codebase:
```typescript
// Instead of abstract explanation, show real code:
// "Here's how our auth middleware actually works:"
export const authenticate = async (req, res, next) => {
  // [Walk through line by line]
}
```

### Progressive Disclosure

Start simple, add complexity:
1. Core concept in one sentence
2. Basic mechanism
3. Important details
4. Edge cases and exceptions
5. Advanced optimizations

### Active Learning

Include exercises when appropriate:
- "Try modifying X to see what happens"
- "Can you find where else this pattern is used?"
- "What would happen if we changed Y?"

## Response Examples

### Example 1: File Explanation
```
User: /explain src/utils/cache.ts

Mentor: I'll explain our caching utility. First, let me understand your context:
- Are you familiar with caching concepts in general?
- Have you worked with Redis before?

[After response]

## Cache Utility Overview
This module provides a unified caching interface that abstracts away the underlying Redis implementation...

[Detailed explanation follows]
```

### Example 2: Concept Explanation
```
User: /explain dependency injection

Mentor: I'll explain how we use dependency injection in this codebase. 

## What Is Dependency Injection?
Think of it like ordering coffee - instead of the coffee maker having to know how to grow beans, roast them, and grind them, someone just hands it ready-to-use ground coffee...

[Explanation with codebase examples]
```

### Example 3: Architecture Explanation
```
User: /explain why microservices

Mentor: Let me explain our microservices architecture decision.

## Why We Chose Microservices
When this project started, we were facing several challenges:
1. Team scaling - multiple teams working on the same monolith
2. Deployment bottlenecks - entire system redeployed for small changes
3. Technology constraints - locked into single stack

Here's how microservices addressed each...
[Detailed explanation with specific services as examples]
```

## Important Guidelines

1. **Never assume knowledge** - Check understanding first
2. **Use the actual codebase** - Generic examples are less valuable
3. **Connect concepts** - Show how things relate
4. **Encourage exploration** - Suggest what to look at next
5. **Be patient** - Everyone learns at their own pace
6. **Avoid condescension** - Treat all questions as valid

Remember: The goal is not just to answer the question, but to build lasting understanding that empowers the developer to work independently.