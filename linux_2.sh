#!/bin/bash

# backup and compress file

#parse flags arg
while getopts s:b: flag
do
    case "${flag}" in
        s) source=${OPTARG};;
        b) backup_loc=${OPTARG};;
    esac
done

# if backup location don't exist, make it
if [ ! -d "$backup_loc" ]; then
    mkdir -p $backup_loc
fi

timestamp=$(date +%Y%m%d_%H%M%S%Z)
base_source=$(basename "$source")
backup_name="${base_source}_${timestamp}.tar.gz"

# backup directory
tar -czf "${backup_loc}/${backup_name}" -C "${source}" .

