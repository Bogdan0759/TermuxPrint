#!/bin/bash

# Функция для обработки команды To (text)
to() {
    echo "$1"
}

# Функция для обработки команды Are (.)=...
are() {
    eval "$1"
}

# Функция для обработки команды With () ()
with() {
    result=$(( $1 + $2 ))
    echo "Result: $result"
}

# Основной цикл для обработки команд
while IFS= read -r line; do
    line=$(echo "$line" | xargs)  # Убираем пробелы в начале и конце строки

    # Обработка команды To (text)
    if [[ $line =~ ^To\ (.*)$ ]]; then
        text="${BASH_REMATCH[1]}"
        to "$text"

    # Обработка команды Are (.)=...
    elif [[ $line =~ ^Are\ (.*)\ =\ (.*)$ ]]; then
        var="${BASH_REMATCH[1]}"
        value="${BASH_REMATCH[2]}"
        are "$var=$value"

    # Обработка команды With () ()
    elif [[ $line =~ ^With\ (.*)\ (.*)$ ]]; then
        var1="${BASH_REMATCH[1]}"
        var2="${BASH_REMATCH[2]}"
        with "$var1" "$var2"
    fi
done