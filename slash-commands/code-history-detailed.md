---
name: code-history-detailed
description: Comprehensive code evolution analysis through git history, PRs, and collaborative development patterns
pattern: /code-history-detailed(?:\s+(.+))?
---

Using @agent-code-historian analyze the code history and evolution patterns. You must create a comprehensive, detailed historical analysis report WITHOUT making any changes.

## Input Parsing
The user invoked: /code-history-detailed {optional_scope}

Valid scopes:
- **No argument**: Analyze the entire project's history
- **File/directory path**: Track evolution of specific file or directory
- **"file.js author:name"**: Focus on specific author's changes to a file
- **"last 30 days"**: Analyze recent history within timeframe
- **"PR #123"**: Analyze history related to a specific PR
- **"hotspots"**: Identify most frequently changed files
- **"co-changes"**: Find files that change together

### Scope Resolution
1. If scope is a file or directory path:
   - Use `git log --follow --stat -- <path>` to track changes
   - Use `git blame <path>` for line-level authorship
   - Identify all commits affecting this path

2. If scope includes "author:":
   - Extract author name
   - Use `git log --author="<name>"` to filter commits
   - Focus on that author's contributions

3. If scope includes time period:
   - Parse timeframe (e.g., "last 30 days", "since 2024-01-01")
   - Use `git log --since="<date>"` to filter by date
   - Analyze recent evolution patterns

4. If scope is "PR #N":
   - Use `gh pr view <N>` to get PR details
   - Use `gh pr diff <N>` to see changes
   - Use `git log --grep="<PR reference>"` to find related commits

5. If scope is "hotspots":
   - Use `git log --all --numstat --format="%H"` to count changes per file
   - Identify top 20 most frequently modified files
   - Analyze change frequency and patterns

6. If scope is "co-changes":
   - Analyze commits to find files frequently changed together
   - Use `git log --name-only --pretty=format:"%H"` to group files by commit
   - Calculate co-change frequency matrix

7. If no scope provided:
   - Analyze overall project history
   - Identify key contributors, hotspots, and patterns

## Your Task
1. Gather git history data using appropriate git and gh commands
2. Analyze patterns in code evolution
3. Identify collaboration patterns and frequently co-changed files
4. Create a comprehensive historical analysis report
5. Save your report as a markdown file in the /reports directory

## Analysis Steps
1. **Data Collection**
   - Extract commit history with authors, dates, and messages
   - Gather PR data using gh cli
   - Identify file modification patterns
   - Track authorship and contributions

2. **Timeline Construction**
   - Build chronological view of changes
   - Identify major refactoring events
   - Track feature development through commits
   - Note significant architectural changes

3. **Authorship Analysis**
   - Identify primary contributors by file/module
   - Track contributor activity over time
   - Identify code ownership patterns
   - Analyze collaboration between authors

4. **Co-change Pattern Detection**
   - Find files that change together
   - Identify module coupling through change patterns
   - Detect architectural boundaries from change clusters
   - Find tightly coupled components

5. **Hotspot Identification**
   - Rank files by change frequency
   - Identify unstable/frequently modified code
   - Correlate hotspots with bug fixes
   - Flag potential technical debt areas

6. **PR Pattern Analysis**
   - Analyze PR size and scope patterns
   - Track feature development cycles
   - Identify review patterns
   - Correlate PRs with commit history

## Output Format
Create a markdown file at `/reports/code-history-{scope}-{timestamp}.md` with:

```markdown
# Code History Analysis
Generated: {timestamp}
Scope: {scope_description}
Analysis Period: {date_range}

## Executive Summary
Brief overview of code evolution patterns and key findings

## Timeline
### Major Events
- YYYY-MM-DD: {significant change description} (commit: abc123)
- YYYY-MM-DD: {feature introduction} (PR #456)
- YYYY-MM-DD: {refactoring event} (commit: def789)

### Evolution Visualization
```
{ASCII timeline or text-based visualization}
```

## Authorship Analysis
### Top Contributors
| Author | Commits | Files Changed | Lines Added | Lines Removed |
|--------|---------|---------------|-------------|---------------|
| Alice  | 150     | 45            | 5000        | 2000          |
| Bob    | 120     | 38            | 4500        | 1800          |

### Code Ownership
- **Module A**: Primarily Alice (60%), Bob (30%)
- **Module B**: Primarily Bob (70%), Charlie (20%)

### Collaboration Patterns
- Alice and Bob frequently collaborate on auth module
- Charlie works independently on UI components

## Change Frequency Analysis
### Hotspots (Top 20)
| File | Changes | Authors | First Modified | Last Modified |
|------|---------|---------|----------------|---------------|
| src/auth.js | 45 | 3 | 2023-01-15 | 2024-12-01 |

### Interpretation
- High churn files indicate:
  - Unstable requirements
  - Technical debt areas
  - Complex business logic

## Co-change Patterns
### Files That Change Together
| File Pair | Co-change Count | Coupling Strength |
|-----------|-----------------|-------------------|
| auth.js + user.js | 23 | High |
| api.js + routes.js | 18 | Medium |

### Change Clusters
- **Cluster 1**: Authentication system (auth.js, user.js, session.js)
- **Cluster 2**: API layer (api.js, routes.js, middleware.js)

### Architectural Insights
- Co-change patterns reveal module boundaries
- High coupling between X and Y suggests refactoring opportunity

## Pull Request Analysis
### PR Statistics
- Total PRs: X
- Average PR size: Y files changed
- Average review time: Z hours

### Notable PRs
- **PR #123** (2024-06-15): Major refactoring of auth system
  - Files: 15 changed
  - Impact: Touched multiple modules

### PR Patterns
- Feature PRs typically involve 5-8 files
- Bug fixes usually touch 1-3 files
- Refactorings can affect 10+ files

## Commit Patterns
### Commit Message Analysis
- X% follow conventional commits
- Common prefixes: feat, fix, refactor, docs
- Quality varies by author

### Commit Size
- Average files per commit: X
- Median lines changed: Y
- Large commits (>500 lines): Z

## Historical Insights
### Code Stability
- Stable modules (few changes): {list}
- Unstable modules (many changes): {list}

### Development Velocity
- Commits per week trend: {description}
- Active development periods: {list}

### Technical Debt Indicators
- Files with >20 commits: {list}
- Frequent bug fixes in: {list}
- Refactoring candidates: {list}

## Key Findings
1. {Finding with supporting data}
2. {Finding with supporting data}
3. {Finding with supporting data}

## Appendix
### Command Reference
```bash
# Commands used for this analysis
git log --all --since="X" --format="%h|%an|%at|%s"
gh pr list --state merged --limit 100
```

### Data Sources
- Git commits: X analyzed
- Pull requests: Y analyzed
- Date range: {start} to {end}
```

Remember: DO NOT make any changes. Only analyze and report. Focus on building insights from historical data to inform future development decisions.
