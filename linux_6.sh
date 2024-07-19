#!/bin/bash

#parse flags arg
while getopts d:n: flag
do
    case "${flag}" in
        d) directory=${OPTARG};;
        n) name=${OPTARG};;
    esac
done

# if backup location don't exist, make it
if [ ! -d "$directory" ]; then
    mkdir -p $directory
fi

# generate ssh key
ssh-keygen -t ed25519 -f "$directory/$name" -N ""