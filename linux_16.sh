#!/bin/bash

# Display hostname
echo "Hostname: $(hostname)"

# Display current system time
echo "Current Time: $(date)"

# Display number of users currently logged in
echo "Number of Users Logged In: $(who | wc -l)"