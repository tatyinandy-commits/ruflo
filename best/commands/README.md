# commands/

Slash-команды для Claude Code. Один файл — одна команда (`/<имя-файла>`).

## Формат

```markdown
---
description: Краткое описание команды (показывается в списке).
---

Инструкции, которые выполнит Claude при вызове команды.
Доступен placeholder $ARGUMENTS — туда подставляются аргументы вызова.
```

## Использование в проекте

```bash
cp best/commands/my-command.md ~/your-project/.claude/commands/
# вызов: /my-command <аргументы>
```

## Создать новую

```bash
best/scripts/new-item.sh command my-command
```

См. шаблон [`_template.md`](./_template.md).
