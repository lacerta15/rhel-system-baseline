#!/usr/bin/env bash
# Configure NTP/Chrony
set -euo pipefail
NTP_SERVER=${1:-pool.ntp.org}
cat > /etc/chrony.conf << EOF
server $NTP_SERVER iburst
driftfile /var/lib/chrony/drift
makestep 1.0 3
rtcsync
logdir /var/log/chrony
EOF
systemctl enable chronyd --now
chronyc tracking
