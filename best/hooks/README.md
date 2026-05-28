# hooks/

Хуки Claude Code и автоматизация. Хранятся как фрагменты для `settings.json`
плюс при необходимости скрипты-обработчики.

## Формат

Хуки настраиваются в `.claude/settings.json`. Здесь храним переиспользуемые блоки
и копируем нужное в целевой проект.

Пример блока — авто-форматирование после редактирования файла:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          { "type": "command", "command": "best/hooks/format.sh \"$CLAUDE_FILE\"" }
        ]
      }
    ]
  }
}
```

## Использование

1. Скопируй нужный блок в `hooks` секцию `.claude/settings.json` целевого проекта.
2. Скопируй сопровождающий скрипт (если есть) и проверь путь к нему.

См. пример [`settings.example.json`](./settings.example.json).
