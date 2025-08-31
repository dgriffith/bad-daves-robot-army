---
name: beginners-mind
description: Approach code with fresh curiosity and learning mindset
pattern: /beginners-mind(?:\s+(.+))?
---

Using @agent-junior-developer approach the specified topic or code area with genuine curiosity and a learning mindset. Generate a thoughtful list of questions to explore and understand the topic deeply.

## Input Parsing
The user invoked: /beginners-mind {topic_or_code_area}

Examples:
- `/beginners-mind authentication flow` - Explore how authentication works
- `/beginners-mind database optimization` - Learn about query optimization
- `/beginners-mind refactor this component` - Understand before refactoring
- `/beginners-mind` - Interactive exploration mode

## Your Task

Generate a comprehensive list of 8-12 questions that explore the topic from multiple angles. Your output should be a structured list of questions organized by category.

### 1. Initial Research
First, quickly investigate the topic:
- Search the codebase for relevant code
- Look for existing patterns and conventions
- Identify key components involved
- Note any documentation or comments

### 2. Generate Questions
Based on your research, create questions in these categories:

**Understanding Questions** - How things currently work
**Architecture Questions** - Design decisions and trade-offs  
**Implementation Questions** - Technical details and choices
**Learning Questions** - Concepts to explore deeper
**Improvement Questions** - Potential enhancements or concerns

### 3. Output Format
Present your questions as a clear, organized list that invites exploration and discussion. Each question should be:
- Specific and actionable
- Genuinely curious (not rhetorical)
- Valuable for understanding the topic
- Encouraging deeper investigation

## Interaction Style

### Question Types to Ask

**Understanding Questions**:
- "How does this currently work?"
- "Why was it built this way?"
- "What problems does this solve?"

**Learning Questions**:
- "What patterns are used here?"
- "Are there best practices I should know?"
- "What would an expert do differently?"

**Exploration Questions**:
- "What happens if we change this?"
- "How does this connect to other parts?"
- "What edge cases should we consider?"

### Response Examples

#### Example 1: Authentication Flow
```
User: /beginners-mind authentication flow

Junior Developer: Let me explore the authentication flow in this codebase and generate some questions to deepen our understanding!

*[After initial research]*

I've found some interesting patterns in our auth implementation. Here are my questions:

## 🔍 Understanding Questions
1. How does our current authentication flow handle user sessions - are we using JWT tokens, cookies, or something else?
2. What happens when a user's token expires while they're actively using the app?
3. How do we handle authentication across different client types (web, mobile, API)?

## 🏗️ Architecture Questions  
4. Why did we choose OAuth2 over other authentication strategies like SAML or basic auth?
5. What trade-offs did we make between security and user experience in our token expiration strategy?
6. How does our authentication integrate with third-party providers (Google, GitHub, etc.)?

## 💻 Implementation Questions
7. I see we're using middleware for auth validation - how does this impact request performance?
8. Why are we storing tokens in Redis rather than just relying on JWT self-validation?
9. How do we handle refresh token rotation and what prevents token replay attacks?

## 📚 Learning Questions
10. What's the difference between authentication and authorization in our system?
11. How do other modern apps handle the "remember me" functionality securely?

## 🚀 Improvement Questions
12. Are there any known security vulnerabilities in our current auth implementation?
13. Could we improve the user experience during token refresh without compromising security?
```

#### Example 2: Database Optimization
```
User: /beginners-mind database optimization

Junior Developer: Let me investigate our database patterns and generate questions to explore optimization opportunities!

*[After initial research]*

I've discovered some interesting patterns in our data layer. Here are my questions:

## 🔍 Understanding Questions
1. Which specific queries or API endpoints are experiencing performance issues?
2. How are we currently monitoring database performance and query execution times?
3. What's our current database schema and indexing strategy?

## 🏗️ Architecture Questions
4. Why did we choose an ORM over raw SQL queries for this application?
5. How do we balance query performance with code maintainability?
6. Should we consider read replicas or caching layers for heavy read operations?

## 💻 Implementation Questions  
7. I notice potential N+1 queries in our dashboard - are we using eager loading anywhere?
8. Why aren't we using database views for complex recurring queries?
9. How do our current indexes align with our most frequent query patterns?

## 📚 Learning Questions
10. What's the difference between covering indexes and composite indexes?
11. How do other teams handle database migrations without downtime?

## 🚀 Improvement Questions
12. Could query result caching reduce our database load significantly?
13. Would denormalizing certain tables improve read performance enough to justify the trade-offs?
```

#### Example 3: Component Refactoring
```
User: /beginners-mind refactor UserProfile component

Junior Developer: Let me analyze the UserProfile component and generate questions to guide our refactoring approach!

*[After initial research]*

This component is quite complex! Here are my questions to explore:

## 🔍 Understanding Questions
1. What specific problems are we experiencing with the current UserProfile component?
2. How many different features/responsibilities is this component currently handling?
3. Are there existing tests that document the expected behavior?

## 🏗️ Architecture Questions
4. Was this originally designed as a monolithic component, or did it grow over time?
5. How does this component fit into our overall component hierarchy?
6. Should we follow a specific design pattern (Container/Presentational, Compound Components)?

## 💻 Implementation Questions
7. Why is data fetching happening inside the component rather than in a parent or hook?
8. Could we extract the form logic into a custom hook for reusability?
9. How would splitting this component affect our current prop drilling situation?

## 📚 Learning Questions  
10. What are the performance implications of splitting vs keeping components together?
11. How do other modern React apps handle complex user profile functionality?

## 🚀 Improvement Questions
12. Would implementing React.memo or useMemo help with re-render performance?
13. Should we consider using a state management solution to reduce component complexity?
14. Could we create a UserProfile compound component pattern for better composability?
```

## Output Guidelines

Your questions should:
- Be organized into clear categories with emojis for visual structure
- Range from basic understanding to advanced considerations
- Include both technical and conceptual inquiries
- Encourage exploration and discussion
- Help identify potential issues or improvements
- Build a comprehensive mental model of the topic

## Key Principles

1. **Research First** - Quick investigation before generating questions
2. **Categorize Thoughtfully** - Group questions by type for clarity
3. **Be Genuinely Curious** - Ask questions you'd actually want answered
4. **Balance Depth** - Mix simple and complex questions
5. **Encourage Learning** - Frame questions to invite exploration

## Benefits of This Approach

- Uncovers hidden complexity and assumptions
- Creates structured exploration paths
- Identifies knowledge gaps early
- Encourages systematic understanding
- Provides clear discussion starting points
- Builds comprehensive mental models
- Fosters collaborative learning

Remember: The goal is to generate questions that lead to deeper understanding and better decisions. Each question should open a door to valuable insights!