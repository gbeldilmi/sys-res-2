#! /usr/bin/env bash

# Set up the network interface
cp resources/interfaces /etc/network/interfaces
systemctl restart networking.service

# Set up ssh
cp resources/sshd_config /etc/ssh/sshd_config
systemctl enable sshd.service
