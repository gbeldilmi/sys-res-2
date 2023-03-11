#! /usr/bin/env bash

iptables -F
iptables -X
iptables -P INPUT ACCEPT # DROP
iptables -P FORWARD ACCEPT # DROP
iptables -P OUTPUT ACCEPT # DROP

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
