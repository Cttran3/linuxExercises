#!/bin/bash

# Create the main directory 'five'
mkdir five

# Create the five subdirectories using a nested loop
for i in {1..5}; do
  sub_dir=five/dir$i
  mkdir -p $sub_dir  # -p flag creates parent directories if necessary
  # Create the four files with a nested loop inside the subdirectory
  for j in {1..4}; do
    file=$sub_dir/file$j
    content=$(printf "%${j}s" | tr ' ' $j)
    echo $content > $file
  done
done
