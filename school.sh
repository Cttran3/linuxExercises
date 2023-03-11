#!/bin/bash

# select lines containing "MADISON SCHOOLS" and TotalAssessedValue column, then compute sum and average
cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d ',' -f 7 | { 
    sum=0
    count=0
    while read value; do
        sum=$((sum + value))
        count=$((count + 1))
    done
    echo "Sum of TotalAssessedValue for MADISON SCHOOLS properties: $sum"
    echo "Average TotalAssessedValue for MADISON SCHOOLS properties: $((sum/count))"
}

# ignore file in git
echo "Property_Tax_Roll.csv" > .gitignore
