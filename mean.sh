#!/bin/bash

# Print usage statement if not enough arguments
if [ $# -lt 1 ]; then
  echo "usage: $0 <column> [file.csv]" 1>&2
  exit 1
fi

# Assign command line arguments to variables
column="$1"
file="${2:-/dev/stdin}"

# Extract the required column from the CSV file
cut -d ',' -f "$column" "$file" | tail -n +2 | {
  # Initialize sum and line count variables
  sum=0
  count=0

  # Loop over each line and add the value to the sum
  while read -r value; do
    sum=$(echo "$sum+$value" | bc)
    count=$((count + 1))
  done

  # Calculate the mean and print it
  mean=$(echo "$sum/$count" | bc -l)
  echo "$mean"
}
