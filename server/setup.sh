#! /usr/bin/env bash

# Install packages
apt install -y isc-dhcp-server iptables net-tools


# Set up the network interface
cp ./resources/interfaces /etc/network/interfaces
cp ./resources/sysctl.conf /etc/sysctl.conf
sysctl -p
#systemctl restart networking.service


# Set up iptables
iptables -F
iptables -X
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A FORWARD -ptcp --dport http -i enp3s0 -o eno1 -j ACCEPT
iptables -A FORWARD -ptcp --dport https -i enp3s0 -o eno1 -j ACCEPT
iptables -A FORWARD -ptcp --dport domain -i enp3s0 -o eno1 -j ACCEPT
iptables -A FORWARD -pudp --dport domain -i enp3s0 -o eno1 -j ACCEPT

iptables -A FORWARD -i enp3s0 -o enp1s0 -j ACCEPT
iptables -A FORWARD -i enp1s0 -o enp3s0 -j ACCEPT

iptables -A FORWARD -m state --state ETABLISHED,RELATED -i eno1 -o enp3s0

iptables -t nat -A POSTROUTING -s 42.42.42.0/24 -j MASQUERADE 
iptables-save > /etc/iptables/rules.v4


# Set up ssh
cp ./resources/sshd_config /etc/ssh/sshd_config
systemctl enable sshd.service


# Set up dhcp server
cp ./resources/iscdhcp-server /etc/default/isc-dhcp-server
cp ./resources/dhcpd.conf /etc/dhcp/dhcpd.conf
service isc-dhcp-server restart



