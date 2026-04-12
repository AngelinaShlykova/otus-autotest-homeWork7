#!/bin/bash

file=""
search=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --file)
            file="$2"
            shift 2
            ;;
        --search)
            search="$2"
            shift 2
            ;;
        *)
            echo "Неизвестный параметр: $1"
            exit 1
            ;;
    esac
done

if [[ -z "$file" || -z "$search" ]]; then
    echo "Использование: $0 --file <путь> --search <строка>"
    exit 1
fi

if [[ ! -f "$file" ]]; then
    echo "Файл не найден: $file" >&2
    exit 1
fi

abs_path=$(realpath "$file")
count=$(grep -c -F "$search" "$abs_path" 2>/dev/null || echo 0)

if [[ $count -gt 0 ]]; then
    echo "$count"
else
    echo "Не найдено ни одного совпадения в файле $abs_path"
fi
