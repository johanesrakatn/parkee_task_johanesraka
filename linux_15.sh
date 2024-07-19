#!/bin/bash

# set the threshold (80%)
threshold=80

# set the disk partition to monitor (e.g. /, /home, etc.)
partitions=$(df -P | awk '{print $1}' | grep '/dev/')

while true
do
  # get the disk usage percentage
  disk_usage=$(df -h --output=pcent $partition | awk '{print $1}' | sed 's/%//g')

  # loop through each partition
  for partition in $partitions
  do
    # get the disk usage for the current partition
    usage=$(df -P $partition | tail -n 1 | awk '{print $5}' | sed '/%//')

    # check if the disk usage exceeds the threshold
    if [ $usage -gt $threshold ]
    then
      # send a notification if the threshold is exceeded
      notify-send "Disk Usage Alert" "Disk usage on $partition is $disk_usage%!"
      # if usage exceeds threshold, sleep for 30 sec to prevent notification flood
      sleep 30
    fi
  done

  sleep 1
done