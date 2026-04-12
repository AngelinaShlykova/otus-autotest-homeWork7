#!/bin/bash

if [[ -z "$1" || ! "$1" =~ ^[0-9]+$ ]]; then
    echo "Использование: $0 <число>"
    exit 1
fi

n=$1
mid=$((n / 2))

mult=1
for ((i=1; i<=mid; i++)); do
    mult=$((mult * i))
done

sum=0
start=$((n % 2 == 1 ? mid + 2 : mid + 1))
for ((i=start; i<=n; i++)); do
    sum=$((sum + i))
done

echo "mult: $mult"
echo "sum: $sum"
