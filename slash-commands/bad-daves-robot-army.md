---
name: bad-daves-robot-army
description: Display the comprehensive guide to Bad Dave's Robot Army capabilities
pattern: /bad-daves-robot-army
---

```bash
# Display the Bad Dave's Robot Army comprehensive guide
# Try multiple possible locations for the guide file
if [ -f "./docs/ROBOT_ARMY_GUIDE.md" ]; then
    cat "./docs/ROBOT_ARMY_GUIDE.md"
elif [ -f "../docs/ROBOT_ARMY_GUIDE.md" ]; then
    cat "../docs/ROBOT_ARMY_GUIDE.md"
elif [ -f "$(git rev-parse --show-toplevel 2>/dev/null)/docs/ROBOT_ARMY_GUIDE.md" ]; then
    cat "$(git rev-parse --show-toplevel)/docs/ROBOT_ARMY_GUIDE.md"
else
    echo "# 🤖 Bad Dave's Robot Army - Quick Reference

Could not find the full guide at docs/ROBOT_ARMY_GUIDE.md

## What is Bad Dave's Robot Army?

A comprehensive suite of specialized AI agents and commands for Claude Code that transforms your development workflow.

## Key Features:
- **20+ Specialized Subagents**: Each expert in their domain
- **Comprehensive Review Commands**: Security, performance, quality, architecture, and more
- **PRD → Production Pipeline**: From requirements to deployed code
- **Personalized Learning**: The @mentor agent provides customized teaching
- **Intelligent Workflows**: Automated issue decomposition and implementation

## Quick Commands:
- \`/codebase-overview\` - Understand any codebase
- \`/explain [file/concept]\` - Get personalized explanations
- \`/process-prd [file]\` - Transform requirements into actionable plans
- \`/implement-issue [number]\` - Implement GitHub issues with the right specialist
- \`/*-review\` - Run comprehensive reviews (security, performance, quality, etc.)

## Learn More:
Check the repository at: https://github.com/dgriffith/bad-daves-robot-army

For the full guide, ensure docs/ROBOT_ARMY_GUIDE.md exists in your project root."
fi
```