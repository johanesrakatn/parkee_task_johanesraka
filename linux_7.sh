#!/bin/bash

#parse flags arg
while getopts p:u:i: flag
do
    case "${flag}" in
        p) pub_key=${OPTARG};;
        u) username=${OPTARG};;
        i) dest_ip=${OPTARG};;
    esac
done

# check if pub_key exist
if [ ! -f "$pub_key" ]; then
    echo "Public key $pub_key not found"
    exit 1
fi

# copy pub key to server
ssh-copy-id -i "$pub_key" "$username@$dest_ip"