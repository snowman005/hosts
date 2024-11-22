#!/bin/bash

while read -r ip host; do
    [[ "$ip" =~ ^# ]] || [[ -z "$ip" ]] && continue
    
    if [[ "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo "IP valid: $ip pentru hostul: $host"
    else
        echo "IP invalid: $ip pentru hostul: $host"
    fi
done < /etc/hosts
