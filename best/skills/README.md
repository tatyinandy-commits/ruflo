# skills/

Claude Code скиллы. Каждый скилл — отдельная папка с файлом `SKILL.md`.

## Формат

```
skills/
└── my-skill/
    ├── SKILL.md        # обязательный, с frontmatter name + description
    ├── scripts/        # опционально: вспомогательные скрипты
    └── references/     # опционально: справочные материалы
```

`SKILL.md` начинается с YAML-frontmatter:

```markdown
---
name: my-skill
description: Что делает скилл и когда его применять (по этому тексту он подбирается).
---

# My Skill
## Overview
...
```

## Использование в проекте

```bash
cp -r best/skills/my-skill ~/your-project/.claude/skills/
```

## Создать новый

```bash
best/scripts/new-item.sh skill my-skill
```

См. шаблон в [`_template/SKILL.md`](./_template/SKILL.md).
