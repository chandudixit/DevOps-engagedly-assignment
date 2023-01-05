#!/bin/bash
root_dir="/root/mynewdir"
yml_files=$(find "$mynewdir" -name "*.yml")
echo "$yml_files"
file_count=$(find "$mynewdir" -type f | wc -l)
echo "Number of files: $file_count"

