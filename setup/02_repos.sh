#!/usr/bin/env bash
# Configure standard YUM/DNF repositories
set -euo pipefail
OS_VER=$(rpm -E %{rhel})
echo "RHEL version: $OS_VER"
if [[ "$OS_VER" -ge 8 ]]; then
    dnf install -y epel-release
    dnf config-manager --set-enabled codeready-builder-for-rhel-8-rhui-rpms 2>/dev/null || true
else
    yum install -y epel-release
fi
echo "Repos configured."
