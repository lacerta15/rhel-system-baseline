#!/usr/bin/env bash
# Apply performance and security sysctl settings
set -euo pipefail
cat > /etc/sysctl.d/99-baseline.conf << 'EOF'
# Network
net.ipv4.tcp_syncookies = 1
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.tcp_max_syn_backlog = 4096
net.core.somaxconn = 65535
# VM
vm.swappiness = 10
vm.dirty_ratio = 20
vm.dirty_background_ratio = 5
# File descriptors
fs.file-max = 2097152
EOF
sysctl -p /etc/sysctl.d/99-baseline.conf
echo "sysctl applied."
