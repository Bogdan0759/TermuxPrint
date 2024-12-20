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

# Пример использования команд
to "Hello, World!"
are "a=5"
are "b=10"
with "$a" "$b"