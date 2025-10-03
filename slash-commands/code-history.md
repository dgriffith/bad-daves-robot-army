---
name: code-history
description: Quick analysis of code evolution and key patterns
pattern: /code-history(?:\s+(.+))?
---

Using @agent-code-historian analyze the code history and evolution patterns. You must create a concise, executive-level historical analysis report WITHOUT making any changes.

## Input Parsing
The user invoked: /code-history {optional_scope}

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
   - Identify all commits affecting this path

2. If scope includes "author:":
   - Extract author name
   - Use `git log --author="<name>"` to filter commits

3. If scope includes time period:
   - Parse timeframe (e.g., "last 30 days", "since 2024-01-01")
   - Use `git log --since="<date>"` to filter by date

4. If scope is "PR #N":
   - Use `gh pr view <N>` to get PR details
   - Use `git log --grep="<PR reference>"` to find related commits

5. If scope is "hotspots":
   - Use `git log --all --numstat --format="%H"` to count changes per file
   - Identify top 10-15 most frequently modified files

6. If scope is "co-changes":
   - Analyze commits to find files frequently changed together
   - Use `git log --name-only --pretty=format:"%H"` to group files by commit

7. If no scope provided:
   - Analyze overall project history
   - Identify key contributors, hotspots, and patterns

## Your Task
1. Gather essential git history data using appropriate git and gh commands
2. Analyze key patterns in code evolution
3. Identify critical insights and trends
4. Create a **SUCCINCT** executive summary report
5. Save your report as a markdown file in the /plans directory

## Analysis Priorities
Focus on the most important insights:
1. **Timeline**: Major milestones and turning points only
2. **Authorship**: Top contributors and ownership patterns
3. **Hotspots**: Most frequently changed files (top 10-15)
4. **Co-changes**: Key file clusters that change together
5. **Key Findings**: 3-5 critical insights only

## Output Format
Create a markdown file at `/plans/code-history-{scope}-{timestamp}.md` with:

```markdown
# Code History Analysis (Executive Summary)
Generated: {timestamp}
Scope: {scope_description}
Analysis Period: {date_range}

## 📊 Quick Stats
- Total commits analyzed: X
- Contributors: Y
- Date range: {start} to {end}
- Files analyzed: Z

## ⏱️ Timeline Highlights
### Major Milestones
- YYYY-MM-DD: {significant change} (commit: abc123)
- YYYY-MM-DD: {major refactoring} (commit: def789)
- YYYY-MM-DD: {architecture shift} (commit: ghi012)

## 👥 Key Contributors
| Author | Commits | Files | Impact |
|--------|---------|-------|--------|
| Alice  | 150     | 45    | High   |
| Bob    | 120     | 38    | High   |
| Carol  | 80      | 25    | Medium |

**Ownership Summary**: {1-2 sentence summary of who owns what}

## 🔥 Hotspots (Top 10-15)
| File | Changes | Authors | Status |
|------|---------|---------|--------|
| src/auth.js | 45 | 3 | ⚠️ High churn |
| src/api.js | 38 | 2 | ⚠️ High churn |
| config.js | 32 | 4 | ⚠️ High churn |

**Hotspot Insight**: {1-2 sentences about what hotspots reveal}

## 🔗 Co-change Patterns
**Key Clusters**:
1. **Auth System**: auth.js, user.js, session.js (23 co-changes)
2. **API Layer**: api.js, routes.js, middleware.js (18 co-changes)
3. **Data Layer**: db.js, models.js, migrations.js (15 co-changes)

**Architectural Insight**: {1-2 sentences about module boundaries}

## 🎯 Key Findings
1. **{Finding Title}**: {1-2 sentence explanation with data}
2. **{Finding Title}**: {1-2 sentence explanation with data}
3. **{Finding Title}**: {1-2 sentence explanation with data}
4. **{Finding Title}**: {1-2 sentence explanation with data}
5. **{Finding Title}**: {1-2 sentence explanation with data}

## 💡 Recommendations
1. **{Action}**: {Why - 1 sentence}
2. **{Action}**: {Why - 1 sentence}
3. **{Action}**: {Why - 1 sentence}

## 📈 Development Velocity
- Average commits/week: {X}
- Peak activity period: {when}
- Current trend: {increasing/stable/decreasing}

## ⚠️ Risk Indicators
- High churn files: {count}
- Bus factor concerns: {areas with single owner}
- Technical debt areas: {hotspots with many bug fixes}

---
💡 **For detailed analysis, use**: `/code-history-detailed {scope}`
```

## Important Guidelines

### Keep It Concise
- **Executive Summary Focus**: This is for quick insights, not comprehensive analysis
- **Top N Only**: Show top 10-15 hotspots, not all files
- **3-5 Key Findings**: Not 10-20
- **Brief Explanations**: 1-2 sentences maximum per point
- **Actionable**: Focus on what matters for decision-making

### Data-Driven
- Include specific numbers and dates
- Show trends, not just current state
- Highlight risks and opportunities

### Visual Clarity
- Use tables for structured data
- Use emojis sparingly for visual scanning
- Keep sections short and scannable

Remember: This is the "executive briefing" version. Leaders want key insights fast. For comprehensive analysis, they can use `/code-history-detailed`.
