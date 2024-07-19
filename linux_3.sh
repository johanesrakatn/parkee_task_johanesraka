#!/bin/bash

#count row, words, and character in all text file in a directory

#parse flags arg
while getopts d: flag
do
    case "${flag}" in
        d) directory=${OPTARG};;
    esac
done

# check if directory exist
if [ ! -d "$directory" ]; then
    echo "Error: Directory $directory does not exist."
    exit 1
fi

# Header 
printf "%s %5s %5s %10s\n" "File Name" "Lines" "Words" "Characters"
printf "%s %5s %5s %10s\n" "---------" "-----" "-----" "----------"

# count row, words, and character per txt file
total_lines=0
total_words=0
total_chars=0

for file in "$directory"/*; do
    if [ -f "$file" ] && [[ "$file" == *.txt ]]; then
        lines=$(wc -l < "$file")
        words=$(wc -w < "$file")
        chars=$(wc -m < "$file")
        
        printf "%s %5d %5d %10d\n" "$(basename "$file")" "$lines" "$words" "$chars"
        
        total_lines=$((total_lines + lines))
        total_words=$((total_words + words))
        total_chars=$((total_chars + chars))
    fi
done

# Print total
printf "%s %5s %5s %10s\n" "---------" "-----" "-----" "----------"
printf "%s %5d %5d %10d\n" "Total" "$total_lines" "$total_words" "$total_chars"