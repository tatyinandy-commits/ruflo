# best — личная коллекция инструментов и скиллов

> Курируемый набор самых полезных инструментов для работы: Claude Code скиллы/агенты,
> MCP-интеграции, база знаний/промпты и CLI/dev-скрипты. Наполняется итеративно.

Формат **нейтральный/смешанный**: всё лежит как обычные файлы (markdown / JSON / YAML / скрипты),
совместимо с форматами Claude Code, чтобы любой элемент можно было скопировать в `.claude/`
другого проекта и сразу использовать.

## Структура

| Папка | Что там | Формат |
|-------|---------|--------|
| [`skills/`](./skills/) | Claude Code скиллы | папка на скилл с `SKILL.md` (frontmatter `name` + `description`) |
| [`agents/`](./agents/) | Определения агентов (subagents) | `.md` с frontmatter `name`/`description` + системный промпт |
| [`commands/`](./commands/) | Slash-команды | `.md` с описанием команды |
| [`hooks/`](./hooks/) | Хуки и автоматизация | JSON-фрагменты для `settings.json` + скрипты |
| [`mcp/`](./mcp/) | MCP-интеграции | `.mcp.json`-фрагменты и обёртки |
| [`prompts/`](./prompts/) | База знаний, промпты, шпаргалки | markdown |
| [`scripts/`](./scripts/) | CLI / dev-утилиты | bash / python / ts |
| [`docs/`](./docs/) | Заметки, best practices | markdown |

## Как пользоваться

**Найти нужное** — открой [`catalog.json`](./catalog.json) (машиночитаемый индекс) или README нужной папки.

**Добавить новый элемент** — самый быстрый путь через скрипт:

```bash
# из корня репозитория
best/scripts/new-item.sh skill   my-skill        # создаст best/skills/my-skill/SKILL.md
best/scripts/new-item.sh agent   my-agent        # создаст best/agents/my-agent.md
best/scripts/new-item.sh prompt  my-prompt       # создаст best/prompts/my-prompt.md
best/scripts/new-item.sh command my-command      # создаст best/commands/my-command.md
```

**Использовать в другом проекте** — скопируй элемент в `.claude/` целевого проекта:

```bash
cp -r best/skills/my-skill   ~/your-project/.claude/skills/
cp    best/agents/my-agent.md ~/your-project/.claude/agents/
```

## Принципы коллекции

1. **Каждый элемент самодостаточен** — работает после копирования без правок.
2. **Минимум зависимостей** — скрипты на bash/POSIX там, где можно.
3. **Документировано** — у каждого элемента есть назначение и пример использования.
4. **Проверено** — добавляем то, что реально использовали, а не «на будущее».

См. [CONTRIBUTING.md](./CONTRIBUTING.md) — как мы вместе наполняем этот проект.
