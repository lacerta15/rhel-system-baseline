#!/usr/bin/env bash
# Set hostname and hosts file
set -euo pipefail
HOSTNAME=${1:?Usage: $0 <hostname>}
IP=${2:?Usage: $0 <hostname> <ip>}
hostnamectl set-hostname "$HOSTNAME"
grep -q "$HOSTNAME" /etc/hosts || echo "$IP $HOSTNAME" >> /etc/hosts
echo "Hostname set to $HOSTNAME"
