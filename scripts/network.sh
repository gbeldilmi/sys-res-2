#! /usr/bin/env bash

cp resources/interfaces /etc/network/interfaces
systemctl restart networking.service
