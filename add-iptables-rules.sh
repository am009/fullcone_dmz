#!/bin/bash

iptables -t nat -F PREROUTING

if [ ! -z "${1}" ]; then
iptables -t nat -A PREROUTING -p udp -i eth0 --dport 1024:65535 -j DNAT --to-destination $1
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 1024:65535 -j DNAT --to-destination $1
fi
