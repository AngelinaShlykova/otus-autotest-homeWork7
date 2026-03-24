#!/bin/bash

# Инициализация переменных
files=()
extension=""
replacement=""

# Парсинг аргументов
while [[ $# -gt 0 ]]; do
    case "$1" in
        --file)
            files+=("$2")
            shift 2
            ;;
        --extension)
            extension="$2"
            shift 2
            ;;
        --replacement)
            replacement="$2"
            shift 2
            ;;
        *)
            echo "Неизвестный параметр: $1"
            exit 1
            ;;
    esac
done

# Проверка обязательных параметров
if [[ ${#files[@]} -eq 0 || -z "$extension" || -z "$replacement" ]]; then
    echo "Использование: $0 --file <файл> [--file <файл>...] --extension <старое> --replacement <новое>"
    exit 1
fi

# Замена расширения и вывод результата
for file in "${files[@]}"; do
    if [[ -f "$file" ]]; then
        # Получаем абсолютный путь
        abs_path=$(realpath "$file")
        # Заменяем расширение
        new_file="${abs_path%.$extension}.$replacement"
        # Переименовываем файл
        mv "$abs_path" "$new_file"
        echo "$new_file"
    else
        echo "Файл не найден: $file" >&2
    fi
done
