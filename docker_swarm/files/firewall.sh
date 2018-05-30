#!/bin/bash

firewall-cmd --permanent --add-port 2376/tcp
firewall-cmd --permanent --add-port 2377/tcp
firewall-cmd --permanent --add-port 7946/tcp
firewall-cmd --permanent --add-port 7946/udp
firewall-cmd --permanent --add-port 4789/udp

firewall-cmd --reload

