#!/bin/bash

check_ip() {
    local ip="$1"
    local host="$2"
    local dns_server="$3"

    if [[ "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        nslookup "$host" "$dns_server" > /dev/null 2>&1
        if [[ $? -eq 0 ]]; then
            echo "Hostul $host este asociat cu IP-ul valid $ip (DNS: $dns_server)"
        else
            echo "Hostul $host NU este asociat corect cu IP-ul $ip (DNS: $dns_server)"
        fi
    else
        echo "IP invalid: $ip pentru hostul: $host"
    fi
}

while read -r ip host; do
    [[ "$ip" =~ ^# ]] || [[ -z "$ip" ]] && continue

    check_ip "$ip" "$host" "8.8.8.8"
done < /etc/hosts
