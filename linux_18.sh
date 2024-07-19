#!/bin/bash

# Create a new netplan configuration file
sudo tee /etc/netplan/01-netcfg.yaml > /dev/null <<EOF
network:
  version: 2
  eth0:
    dhcp: no
    addresses:
      - 192.168.1.100/24
    gateway4: 192.168.1.1
    nameservers:
      addresses: [8.8.8.8, 8.8.4.4]
EOF

# Apply the new netplan configuration
sudo netplan apply

# Restart the networking service to apply the changes
sudo service networking restart