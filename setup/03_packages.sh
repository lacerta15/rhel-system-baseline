#!/usr/bin/env bash
# Install standard baseline packages
set -euo pipefail
PACKAGES=(
    vim wget curl git net-tools bind-utils
    sysstat iotop htop lsof strace tcpdump
    chrony ntp rsyslog logrotate
    policycoreutils-python-utils
    bash-completion tmux screen
    unzip tar gzip bzip2
    openssl ca-certificates
)
if command -v dnf &>/dev/null; then
    dnf install -y "${PACKAGES[@]}"
else
    yum install -y "${PACKAGES[@]}"
fi
echo "Packages installed."
