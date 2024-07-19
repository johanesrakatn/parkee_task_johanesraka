#!/bin/bash

# Flush existing rules
iptables -F
iptables -X

# Allow all outgoing connections
iptables -A OUTPUT -j ACCEPT

# Allow incoming connections on specific ports
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Reject all other incoming connections
iptables -A INPUT -j REJECT