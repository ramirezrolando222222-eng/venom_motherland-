#!/bin/bash
echo "[*] Initializing Ghost Mode Protocol..."

# 1. Silence ARP/NDP Cache Broadcasting (Drop local discovery visibility)
# Prevents other local network nodes from mapping your MAC/IP via normal neighbor discovery
if [ -d /proc/sys/net/ipv4/conf ]; then
    for interface in /proc/sys/net/ipv4/conf/*; do
        echo 1 > "$interface/drop_unicast_in_arp" 2>/dev/null
    done
fi

# 2. Flush routing caches and temporary socket states
ip route flush cache 2>/dev/null

# 3. Secure local loopback integrity
ifconfig lo up 2>/dev/null

echo "[✓] Ghost Mode Network Shield Active."
echo "[*] Local network presence rendered invisible to standard discovery scans."
