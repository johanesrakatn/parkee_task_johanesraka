#!/bin/bash

#parse flags arg
while getopts s:u: flag
do
    case "${flag}" in
        s) unique_string=${OPTARG};;
        u) username=${OPTARG};;
    esac
done

user_home=$(eval echo "~$username")

authorized_keys_file="$user_home/.ssh/authorized_keys"

# delete key containing unique string
sed -i "/$unique_string/d" "$authorized_keys_file"

echo "Public key containing $unique_string removed from authorized_keys"