#! /usr/bin/env bash

# Install packages
apt install -y tree vim htop isc-dhcp-server iptables iptables-persistent

# Set up the network interface
cp resources/interfaces /etc/network/interfaces
systemctl restart networking.service

# Set up ssh
cp resources/sshd_config /etc/ssh/sshd_config
systemctl enable sshd.service

# Set up dhcp server
cp resources/iscdhcp-server /etc/default/isc-dhcp-server
cp resources/dhcpd.conf /etc/dhcp/dhcpd.conf
service isc-dhcp-server restart

# Set up iptables
iptables-restore < resources/iptables.rules
iptables-save > /etc/iptables/rules.v4

