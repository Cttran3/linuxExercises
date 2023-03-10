#!/bin/bash

sum=0

for num in {1000..2000}; do
    if [[ $num =~ ^[01]+$ ]]; then
        sum=$((sum + num))
    fi
done

echo "The sum of numbers between 1000 and 2000 having digits only from the set {0, 1} is: $sum"

