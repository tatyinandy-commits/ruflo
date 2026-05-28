#!/usr/bin/env bash
#
# new-item.sh — скаффолдит новый элемент коллекции `best` из шаблона.
#
# Usage:
#   new-item.sh <type> <name>
#     type: skill | agent | command | prompt
#     name: имя в kebab-case
#
set -euo pipefail

# Корень коллекции = родительская папка этого скрипта.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BEST_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

usage() {
  cat >&2 <<EOF
Usage: new-item.sh <type> <name>
  type: skill | agent | command | prompt
  name: имя в kebab-case (например, pdf-extractor)

Примеры:
  new-item.sh skill   pdf-extractor
  new-item.sh agent   sql-reviewer
  new-item.sh command deploy-check
  new-item.sh prompt  commit-message
EOF
  exit 1
}

[ $# -eq 2 ] || usage
type="$1"
name="$2"

# Валидация имени: kebab-case.
if ! printf '%s' "$name" | grep -Eq '^[a-z0-9]+(-[a-z0-9]+)*$'; then
  echo "Ошибка: имя '$name' должно быть в kebab-case (a-z, 0-9, дефисы)." >&2
  exit 1
fi

create_file() {
  # $1 = путь, $2 = содержимое
  if [ -e "$1" ]; then
    echo "Ошибка: '$1' уже существует." >&2
    exit 1
  fi
  mkdir -p "$(dirname "$1")"
  printf '%s\n' "$2" > "$1"
  echo "Создано: ${1#"$BEST_DIR"/}"
}

case "$type" in
  skill)
    path="$BEST_DIR/skills/$name/SKILL.md"
    content="---
name: $name
description: |
  TODO: что делает скилл и КОГДА его применять (используется для автоподбора).
---

# $name

## Overview
TODO

## Когда применять
- TODO

## Как использовать
\`\`\`bash
# TODO
\`\`\`
"
    ;;
  agent)
    path="$BEST_DIR/agents/$name.md"
    content="---
name: $name
description: TODO — чем занимается агент и для каких задач его выбирать.
---

You are a TODO specialist.

ФОКУС:
- TODO

ОГРАНИЧЕНИЯ:
- TODO
"
    ;;
  command)
    path="$BEST_DIR/commands/$name.md"
    content="---
description: TODO — кратко, что делает команда.
---

Опиши задачу. Аргументы пользователя: \$ARGUMENTS

Шаги:
1. TODO
"
    ;;
  prompt)
    path="$BEST_DIR/prompts/$name.md"
    content="# $name

## Когда использовать
TODO

## Промпт
\`\`\`
TODO
\`\`\`

## Заметки
- TODO
"
    ;;
  *)
    echo "Неизвестный тип: '$type'." >&2
    usage
    ;;
esac

create_file "$path" "$content"
echo "Готово. Заполни содержимое и добавь запись в best/catalog.json."
