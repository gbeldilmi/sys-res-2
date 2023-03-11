#! /usr/bin/env bash

apt install -y isc-dhcp-server iptables net-tools bind9

res_etc=$(cd 'resources/etc' && pwd)
host_etc=$(cd '/etc' && pwd)
cp -r $res_etc/* $host_etc/
