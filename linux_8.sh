#!/bin/bash

#parse flags arg
while getopts u:i: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
        i) dest_ip=${OPTARG};;
    esac
done

if [ -z "$batch_mode" ]; then
    ssh "$username@$dest_ip" 'exit'
fi

# copy pub key to server
ssh -o BatchMode=yes -o ConnectTimeout=5 "$username@$dest_ip" true

# Print result
if [ $? -eq 0 ]; then
    echo "Koneksi SSH ke server $dest_ip dengan user $username berhasil."
else
    echo "Koneksi SSH ke server $dest_ip dengan user $username gagal."
fi