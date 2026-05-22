#!/usr/bin/env bash
# Set ulimits for production workloads
set -euo pipefail
cat > /etc/security/limits.d/99-baseline.conf << 'EOF'
* soft nofile 65536
* hard nofile 65536
* soft nproc  65536
* hard nproc  65536
root soft nofile 65536
root hard nofile 65536
EOF
echo "Limits configured."
