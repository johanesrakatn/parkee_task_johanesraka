#!/bin/bash

# find file in directory

#parse flags arg
while getopts d:e: flag
do
    case "${flag}" in
        d) dir=${OPTARG};;
        e) ext=${OPTARG};;
    esac
done

# check if dir exist
if [ ! -d "$dir" ]; then
    echo "Error: Directory $dir does not exist."
    exit 1
fi

# find file
find "$dir" -type f -name "*.$ext" -print