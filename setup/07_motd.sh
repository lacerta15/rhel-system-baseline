#!/usr/bin/env bash
# Set informative MOTD
set -euo pipefail
cat > /etc/motd << 'EOF'
###############################################################
#  AUTHORIZED ACCESS ONLY                                     #
#  Unauthorized access is strictly prohibited and monitored. #
###############################################################
EOF
echo "MOTD set."
