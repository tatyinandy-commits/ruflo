# agents/

Определения агентов (subagents) для Claude Code. Один агент — один `.md`-файл.

## Формат

```markdown
---
name: my-agent
description: Чем занимается агент (по этому тексту он подбирается под задачу).
---

You are ...
(системный промпт агента: роль, фокус, ограничения, формат вывода)
```

## Использование в проекте

```bash
cp best/agents/my-agent.md ~/your-project/.claude/agents/
```

## Создать новый

```bash
best/scripts/new-item.sh agent my-agent
```

См. шаблон [`_template.md`](./_template.md).
