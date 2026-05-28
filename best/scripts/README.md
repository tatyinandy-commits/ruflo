# scripts/

CLI / dev-утилиты для работы с коллекцией и повседневных задач.

| Скрипт | Назначение |
|--------|------------|
| [`new-item.sh`](./new-item.sh) | Скаффолдит новый элемент (skill/agent/command/prompt) из шаблона |

## new-item.sh

```bash
best/scripts/new-item.sh <type> <name>
#   type: skill | agent | command | prompt
#   name: имя в kebab-case

# примеры
best/scripts/new-item.sh skill   pdf-extractor
best/scripts/new-item.sh agent   sql-reviewer
best/scripts/new-item.sh command deploy-check
best/scripts/new-item.sh prompt  commit-message
```

Создаёт файл из соответствующего шаблона. После создания заполни содержимое
и добавь запись в `best/catalog.json`.
