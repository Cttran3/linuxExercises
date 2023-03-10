#!/bin/bash

# Print usage statement if the script is called with the wrong number of arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <dir> <n>" 1>&2  # Redirect to stderr
  exit 1
fi

dir=$1
n=$2

# Check that the directory exists
if [ ! -d $dir ]; then
  echo "Error: directory $dir does not exist" 1>&2  # Redirect to stderr
  exit 1
fi

# Use find to locate the files larger than n bytes and delete them with rm
find $dir -type f -size +${n}c -delete
