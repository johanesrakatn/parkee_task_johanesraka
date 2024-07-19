#!/bin/bash

#parse flags arg
while getopts a:s: flag
do
    case "${flag}" in
        a) action=${OPTARG};;
        s) service=${OPTARG};;
    esac
done

# Define the command to use for each action
case $action in
  start)
    sudo systemctl start $service
    ;;
  stop)
    sudo systemctl stop $service
    ;;
  status)
    sudo systemctl status $service
    ;;
  *)
    echo "Invalid action: $action"
    exit 1
    ;;
esac

# Execute the command
eval $command