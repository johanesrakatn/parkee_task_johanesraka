#!/bin/bash

#parse flags arg
while getopts p:u: flag
do
    case "${flag}" in
        p) pub_key=${OPTARG};;
        u) username=${OPTARG};;
    esac
done

# check if pubkey exist
if [ ! -f "$pub_key" ]; then
    echo "Public key $pub_key not found"
    exit 1
fi

user_home=$(eval echo "~$username")

# if .ssh doesn't exist, create a secure .ssh directory
if [ ! -d "$user_home/.ssh" ]; then
    mkdir -p "$user_home/.ssh"
    chown "$username":"$username" "$user_home/.ssh"
    chmod 700 "$user_home/.ssh"
fi

# add public key to authorized_keys
cat "$pub_key" >> "$user_home/.ssh/authorized_keys"

# set permission for authorized_keys
chown "$username":"$username" "$user_home/.ssh/authorized_keys"
chmod 600 "$user_home/.ssh/authorized_keys"

echo "Public key added to authorized_keys of user $username."