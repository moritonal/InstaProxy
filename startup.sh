#!/bin/sh

echo "Requesting Public IP"
IP="0.0.0.0"

echo "Building /etc/hosts.allow"
exec 3<> /etc/hosts.allow

    # Let's print some text to fd 3
    echo "sshd : ALL : allow" >&3
    echo "sockd : $allowed : allow" >&3
    echo "ALL : ALL : allow" >&3

# Close fd 3
exec 3>&-

echo "Starting SOCKS5 on 0.0.0.0:1080"
/home/dante/sbin/sockd -f /etc/danted.conf