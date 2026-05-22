#!/usr/bin/env bash
# Run all baseline setup scripts in order
set -euo pipefail
DIR=$(dirname "$(realpath "$0")")
HOSTNAME=${1:?Usage: $0 <hostname> <ip>}
IP=${2:?Usage: $0 <hostname> <ip>}
bash "$DIR/01_hostname.sh" "$HOSTNAME" "$IP"
bash "$DIR/02_repos.sh"
bash "$DIR/03_packages.sh"
bash "$DIR/04_ntp.sh"
bash "$DIR/05_sysctl.sh"
bash "$DIR/06_limits.sh"
bash "$DIR/07_motd.sh"
echo "Baseline setup complete for $HOSTNAME"
