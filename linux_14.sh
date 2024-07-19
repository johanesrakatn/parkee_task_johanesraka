#!/bin/bash

# set the log file
log_file="/var/log/cpu_usage.log"

# set the threshold (75%)
threshold=75

while true
do
  # get the average cpu usage over 1 minute
  cpu_usage=$(mpstat -a | awk '$12 ~ /[0-9.]+/ { print 100 - $12 }' | awk '{print 100 - $1}')

  # check if the cpu usage exceeds the threshold
  if [ $(echo "$cpu_usage > $threshold" | bc) -eq 1 ]; then
    # log the information
    echo "$(date) - cpu usage: $cpu_usage%" >> $log_file
  fi

  # sleep for 1 minute
  sleep 60
done