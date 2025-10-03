---
name: learn
description: Create a personalized learning path for mastering the codebase or specific technologies
pattern: /learn(?:\s+(.+))?
---

Using @agent-mentor create a customized learning path based on the user's goals and current knowledge level, saving the output to the reports directory.

## Input Parsing
The user invoked: /learn {topic_or_goal}

Examples:
- `/learn this codebase` - Overall codebase familiarization
- `/learn React hooks` - Specific technology in the project
- `/learn how to add new features` - Process-oriented learning
- `/learn testing best practices` - Skill development
- `/learn` - Interactive goal setting

## Your Task

### 1. Learning Assessment
Determine:
- What the user wants to learn
- Their current skill level
- Available time commitment
- Preferred learning style
- Specific goals or projects

Ask clarifying questions like:
- "What's your experience with [technology]?"
- "What would you like to build or accomplish?"
- "How much time can you dedicate to learning?"
- "Do you prefer hands-on practice or reading first?"

### 2. Codebase Analysis
Research:
- Identify key concepts in the codebase
- Find good example code for learning
- Locate existing documentation
- Discover learning prerequisites
- Map dependencies between concepts

### 3. Path Construction
Create a structured learning journey:
- Start with foundations
- Build complexity gradually
- Include practical exercises
- Provide checkpoints for understanding
- Suggest real tasks from the codebase

### 4. Save Output
Create a markdown file at `/reports/learning-path-{topic}-{timestamp}.md` with the personalized learning path.

## Learning Path Format

```markdown
# Learning Path: [Topic]

## Your Current Level
[Assessment of starting point]

## Learning Objectives
By completing this path, you will:
- [ ] Understand [concept 1]
- [ ] Be able to [skill 1]
- [ ] Know how to [task 1]

## Prerequisites
Before starting, you should:
- ✓ [Things they already know]
- ⚠️ [Things to review]
- ✗ [Things to learn first]

## Learning Journey

### Phase 1: Foundations (Week 1)
**Goal**: [What they'll achieve]

#### Day 1-2: [Topic]
- **Read**: [Specific files to examine]
- **Understand**: [Key concepts]
- **Exercise**: [Hands-on task]
- **Check**: Can you explain [concept]?

#### Day 3-4: [Next Topic]
- **Explore**: [Code to study]
- **Try**: [Practical exercise]
- **Build**: [Small feature]

#### Day 5: Practice & Review
- **Challenge**: [Consolidation exercise]
- **Review**: [Key takeaways]

### Phase 2: Deep Dive (Week 2)
**Goal**: [Advanced understanding]

[Continue pattern...]

### Phase 3: Mastery (Week 3+)
**Goal**: [Independent capability]

[Advanced topics and projects...]

## Hands-On Projects

### Starter Project
**Modify an existing feature**
- File: `src/features/example.ts`
- Task: Add parameter validation
- Learning: Error handling patterns

### Intermediate Project
**Build a new component**
- Similar to: `src/components/UserList`
- Requirements: [Specifications]
- Learning: Component architecture

### Advanced Project
**Implement a complete feature**
- Reference: Issue #42
- Scope: [Full description]
- Learning: End-to-end development

## Resources

### In This Codebase
- Examples: [Specific files that demonstrate concepts]
- Patterns: [Where to find best practices]
- Tests: [Good test examples to study]

### Documentation
- Internal: [Project docs to read]
- External: [Helpful articles/tutorials]

### Code Tours
1. **Authentication Flow**
   - Start: `src/auth/login.ts`
   - Follow: [Step-by-step path through code]

2. **Data Processing Pipeline**
   - Start: `src/pipeline/input.ts`
   - Trace: [How data flows]

## Practice Exercises

### Exercise 1: [Name]
**Objective**: [What they'll learn]
**Task**: [Specific instructions]
**Hint**: Look at [file] for an example
**Solution**: Available in [location]

### Exercise 2: [Name]
[Continue pattern...]

## Knowledge Checks

### After Phase 1, you should be able to:
- [ ] Explain how [system] works
- [ ] Modify [component] successfully
- [ ] Write tests for [feature]
- [ ] Debug [common issue]

### After Phase 2, you should be able to:
- [ ] Design [new component]
- [ ] Optimize [performance aspect]
- [ ] Refactor [complex code]

### After Phase 3, you should be able to:
- [ ] Architect [new feature]
- [ ] Review code for [quality aspect]
- [ ] Mentor others on [topic]

## Common Challenges

### Challenge: [Typical struggle]
**Why it's hard**: [Explanation]
**Strategy**: [How to overcome]
**Example**: [From the codebase]

## Next Steps

After completing this path:
1. Consider learning: [Related topic]
2. Try building: [Suggested project]
3. Contribute: [How to help the project]

## Tips for Success

- **Code alongside reading** - Don't just read, experiment
- **Break things** - Learn by seeing what happens
- **Ask questions** - Use `/explain` for deep dives
- **Track progress** - Check off completed items
- **Take breaks** - Let concepts solidify
- **Apply immediately** - Use new knowledge in real tasks
```

## Customization Examples

### For Beginners
```markdown
## Phase 1: Getting Started (Week 1)
Let's start with the basics. Don't worry about understanding everything at once.

Day 1: Environment Setup
- Install dependencies (I'll guide you through each step)
- Run the project locally
- Make your first small change (just change a string!)
- Celebrate! You've modified the codebase

Day 2: Understanding Structure
- Tour the folder structure (start with just /src)
- Identify the main entry point
- Trace a simple request...
```

### For Intermediate Developers
```markdown
## Phase 1: Architecture Deep Dive (3-4 days)
You know the basics, let's understand the design decisions.

Study Sessions:
1. Examine the layered architecture in /src/layers
2. Understand our dependency injection in /src/container
3. Analyze the event-driven patterns in /src/events

Challenge: Refactor the UserService to use events
```

### For Advanced Developers
```markdown
## Fast Track: System Mastery (1 week)
You're experienced. Here's the critical path to productivity.

Priority Understanding:
1. Our custom ORM abstraction (2 hours)
2. The build pipeline modifications (1 hour)
3. Performance optimizations in place (2 hours)

First PR Goal: Optimize the data synchronization module
```

## Interactive Learning

When topic is unclear, guide discovery:

```
Mentor: What would you like to learn about this codebase?

User: I want to contribute but don't know where to start

Mentor: Let me help you find the right learning path. A few questions:
1. What's your experience level with [main technology]?
2. Are you more interested in frontend, backend, or full-stack?
3. Do you have a specific feature you'd like to work on?

[Based on responses, create customized path]
```

## Important Principles

1. **Meet them where they are** - Don't assume prior knowledge
2. **Make it achievable** - Better to start small and build confidence
3. **Connect to real code** - Abstract examples don't stick
4. **Provide milestones** - Clear progress indicators motivate
5. **Encourage exploration** - Discovery deepens understanding
6. **Adapt as needed** - Modify the path based on progress

Remember: The best learning path is one that gets followed. Make it engaging, practical, and rewarding.