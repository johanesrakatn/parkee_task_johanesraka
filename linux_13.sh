#!/bin/bash

while getopts f: flag
do
    case "${flag}" in
        f) python_script=${OPTARG};;
    esac
done

# Set the variables
service_name="${python_script}_service"
systemd_dir="/etc/systemd/system/"

# Create the systemd service file
cat > ${systemd_dir}${service_name}.service << EOF
[Unit]
Description=A python service
After=network.target

[Service]
User=myuser
ExecStart=/usr/bin/python ${python_script}
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload the systemd daemon
systemctl daemon-reload
