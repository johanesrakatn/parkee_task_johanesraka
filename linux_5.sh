#!/bin/bash

# Define the package manager based on the Linux family
if [ -f /etc/debian_version ]; then
  package_manager="apt"
  update_command="sudo apt update && sudo apt full-upgrade -y"
  log="/var/log/apt-update.log"
elif [ -f /etc/redhat-release ]; then
  package_manager="yum"
  update_command="sudo yum update -y"
  log="/var/log/yum-update.log"
elif [ -f /etc/arch-release ]; then
  package_manager="pacman"
  update_command="sudo pacman -Syyu --noconfirm"
  log="/var/log/pacman-update.log"
else
  echo "Unsupported Linux family"
  exit 1
fi

# Create the log file if it doesn't exist
touch $log

# Update the packages and log the output
echo "[$(date)] Starting package update..." >> $log
$update_command >> $log 2>&1
echo "[$(date)] Package update completed." >> $log