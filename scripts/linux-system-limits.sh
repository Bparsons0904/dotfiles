#!/bin/bash
# linux-system-limits.sh
# Author: Claude
# Date: March 15, 2025
# Description: Script to configure system limits for development work
# Usage: sudo bash linux-system-limits.sh

# Ensure running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root: sudo bash $0"
  exit 1
fi

# Define colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Print section header
section() {
  echo -e "\n${GREEN}=== $1 ===${NC}"
}

# Print info message
info() {
  echo -e "${YELLOW}INFO:${NC} $1"
}

# Print error message
error() {
  echo -e "${RED}ERROR:${NC} $1"
}

# Print success message
success() {
  echo -e "${GREEN}SUCCESS:${NC} $1"
}

# File descriptor limits - number of files a process can have open simultaneously
FD_SOFT_LIMIT=65536
FD_HARD_LIMIT=65536
FD_SYSTEM_LIMIT=2097152

# Process limits - number of processes/threads a user can have
PROC_SOFT_LIMIT=65536
PROC_HARD_LIMIT=65536
PROC_SYSTEM_LIMIT=65536
PID_MAX=131072  # Increased from 65536 for more headroom

# Memory limits - amount of memory that can be locked by a process
MEM_SOFT_LIMIT="32GB"
MEM_HARD_LIMIT="48GB"

# Stack size limits
STACK_SOFT_LIMIT=16384
STACK_HARD_LIMIT=16384

# File watch limits - for IDEs and build tools that watch files
WATCHES_LIMIT=524288
INSTANCES_LIMIT=512
QUEUED_EVENTS_LIMIT=16384

# Network settings
SOCKET_MEM=16777216  # 16MB
SOMAXCONN=65535
BACKLOG=65536
NEIGH_GC_THRESH1=2048
NEIGH_GC_THRESH2=4096
NEIGH_GC_THRESH3=8192

# Virtual memory settings - using percentage-based approach
SWAPPINESS=10  # Decreased from 15 to further prefer RAM over swap
DIRTY_RATIO=40
DIRTY_BG_RATIO=5  # Increased from 3 to start background writes earlier

# Shared memory limits
SHMMAX=34359738368  # 32GB
SHMALL=8388608
SHMMNI=8192
MSGMAX=65536
MSGMNB=65536

section "Configuring /etc/security/limits.conf"

# Backup original file
cp /etc/security/limits.conf /etc/security/limits.conf.bak
info "Backed up original limits.conf to limits.conf.bak"

# Get current username
CURRENT_USER=$(logname || echo $SUDO_USER || echo $USER)
info "Detected current user: $CURRENT_USER"

# Create new limits.conf file
cat > /etc/security/limits.conf << EOF
# /etc/security/limits.conf
# This file sets the resource limits for the users logged in via PAM.
# It does not affect resource limits of the system services.
#
# Modified by linux-system-limits.sh on $(date)

# File descriptors - for handling many open files
* soft nofile $FD_SOFT_LIMIT
* hard nofile $FD_HARD_LIMIT
$CURRENT_USER soft nofile $FD_SOFT_LIMIT
$CURRENT_USER hard nofile $FD_HARD_LIMIT

# Process limits - for running many concurrent processes/threads
* soft nproc $PROC_SOFT_LIMIT
* hard nproc $PROC_HARD_LIMIT
$CURRENT_USER soft nproc $PROC_SOFT_LIMIT
$CURRENT_USER hard nproc $PROC_HARD_LIMIT

# Memory limits - for locking memory in RAM (databases, real-time apps)
* soft memlock $MEM_SOFT_LIMIT
* hard memlock $MEM_HARD_LIMIT
$CURRENT_USER soft memlock $MEM_SOFT_LIMIT
$CURRENT_USER hard memlock $MEM_HARD_LIMIT

# Stack size - for deeply recursive apps or large stack frames
* soft stack $STACK_SOFT_LIMIT
* hard stack $STACK_HARD_LIMIT
$CURRENT_USER soft stack $STACK_SOFT_LIMIT
$CURRENT_USER hard stack $STACK_HARD_LIMIT

# End of file
EOF

success "Updated /etc/security/limits.conf"

section "Configuring /etc/sysctl.conf"

# Backup original file
cp /etc/sysctl.conf /etc/sysctl.conf.bak
info "Backed up original sysctl.conf to sysctl.conf.bak"

# Create or append to sysctl.conf
cat >> /etc/sysctl.conf << EOF

# Added by linux-system-limits.sh on $(date)
# File descriptor limits - system-wide
fs.file-max = $FD_SYSTEM_LIMIT
fs.nr_open = $FD_SYSTEM_LIMIT

# File watch limits - for IDEs, build tools, etc.
fs.inotify.max_user_watches = $WATCHES_LIMIT
fs.inotify.max_user_instances = $INSTANCES_LIMIT
fs.inotify.max_queued_events = $QUEUED_EVENTS_LIMIT

# Shared Memory settings - for databases, large apps
kernel.shmmax = $SHMMAX
kernel.shmall = $SHMALL
kernel.shmmni = $SHMMNI

# TCP Network Tuning - for better network performance
net.core.rmem_max = $SOCKET_MEM
net.core.wmem_max = $SOCKET_MEM
net.ipv4.tcp_rmem = 4096 87380 $SOCKET_MEM
net.ipv4.tcp_wmem = 4096 87380 $SOCKET_MEM
net.core.somaxconn = $SOMAXCONN
net.ipv4.tcp_max_syn_backlog = $BACKLOG
net.ipv4.tcp_window_scaling = 1

# Virtual Memory settings - using percentage-based approach
vm.swappiness = $SWAPPINESS
vm.dirty_ratio = $DIRTY_RATIO
vm.dirty_background_ratio = $DIRTY_BG_RATIO
# Using percentage-based approach, comment out byte-based settings
#vm.dirty_bytes = 4294967296
#vm.dirty_background_bytes = 1073741824

# Process/Threads limits
kernel.threads-max = $PROC_SYSTEM_LIMIT
kernel.pid_max = $PID_MAX

# Docker networking
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.neigh.default.gc_thresh1 = $NEIGH_GC_THRESH1
net.ipv4.neigh.default.gc_thresh2 = $NEIGH_GC_THRESH2
net.ipv4.neigh.default.gc_thresh3 = $NEIGH_GC_THRESH3

# Message Queues
kernel.msgmnb = $MSGMNB
kernel.msgmax = $MSGMAX
EOF

success "Updated /etc/sysctl.conf"

section "Configuring /etc/systemd/system.conf and user.conf"

# Backup original system.conf file
cp /etc/systemd/system.conf /etc/systemd/system.conf.bak
info "Backed up original system.conf to system.conf.bak"

# Update systemd file descriptor limits in system.conf
if grep -q "^DefaultLimitNOFILE=" /etc/systemd/system.conf; then
  # Replace existing setting
  sed -i "s/^DefaultLimitNOFILE=.*/DefaultLimitNOFILE=$FD_SOFT_LIMIT:$FD_HARD_LIMIT/" /etc/systemd/system.conf
else
  # Add new setting
  echo "DefaultLimitNOFILE=$FD_SOFT_LIMIT:$FD_HARD_LIMIT" >> /etc/systemd/system.conf
fi

# Backup original user.conf file
cp /etc/systemd/user.conf /etc/systemd/user.conf.bak
info "Backed up original user.conf to user.conf.bak"

# Update systemd file descriptor limits in user.conf
if grep -q "^DefaultLimitNOFILE=" /etc/systemd/user.conf; then
  # Replace existing setting
  sed -i "s/^DefaultLimitNOFILE=.*/DefaultLimitNOFILE=$FD_SOFT_LIMIT:$FD_HARD_LIMIT/" /etc/systemd/user.conf
else
  # Add new setting
  echo "DefaultLimitNOFILE=$FD_SOFT_LIMIT:$FD_HARD_LIMIT" >> /etc/systemd/user.conf
fi

success "Updated /etc/systemd/system.conf and /etc/systemd/user.conf"

section "Configuring Docker limits"

# Ensure docker directory exists
mkdir -p /etc/docker

# Create or update Docker daemon.json
cat > /etc/docker/daemon.json << EOF
{
  "default-ulimits": {
    "nofile": {
      "Name": "nofile",
      "Hard": $FD_HARD_LIMIT,
      "Soft": $FD_SOFT_LIMIT
    }
  }
}
EOF

success "Updated /etc/docker/daemon.json"

section "Configuring PAM session limits"

# Ensure pam_limits is included in common-session
if [ -f /etc/pam.d/common-session ]; then
  if ! grep -q "pam_limits.so" /etc/pam.d/common-session; then
    echo "session required pam_limits.so" >> /etc/pam.d/common-session
    success "Added pam_limits.so to /etc/pam.d/common-session"
  else
    info "pam_limits.so already configured in /etc/pam.d/common-session"
  fi
fi

# Ensure pam_limits is included in common-session-noninteractive
if [ -f /etc/pam.d/common-session-noninteractive ]; then
  if ! grep -q "pam_limits.so" /etc/pam.d/common-session-noninteractive; then
    echo "session required pam_limits.so" >> /etc/pam.d/common-session-noninteractive
    success "Added pam_limits.so to /etc/pam.d/common-session-noninteractive"
  else
    info "pam_limits.so already configured in /etc/pam.d/common-session-noninteractive"
  fi
fi

section "Applying changes"

# Load module for bridge settings
modprobe br_netfilter || info "br_netfilter module not available, some bridge settings may not apply"

# Apply sysctl changes
info "Applying sysctl changes..."
sysctl -p

# Reload systemd
info "Reloading systemd..."
systemctl daemon-reload

# Check if Docker is running and restart if necessary
if systemctl is-active --quiet docker; then
  info "Restarting Docker service..."
  systemctl restart docker
  systemctl status docker --no-pager
else
  info "Docker service is not running. No need to restart."
fi

section "Verification"

# Verify file descriptor limits
current_fd_limit=$(ulimit -n)
info "Current file descriptor limit: $current_fd_limit (expected $FD_SOFT_LIMIT)"

# Verify process limits
current_proc_limit=$(ulimit -u)
info "Current process limit: $current_proc_limit (expected $PROC_SOFT_LIMIT)"

# Verify watch limit
current_watch_limit=$(cat /proc/sys/fs/inotify/max_user_watches)
info "Current watch limit: $current_watch_limit (expected $WATCHES_LIMIT)"

section "Summary"

echo "System limits have been configured for high-performance development."
echo ""
echo "Changes made:"
echo "  - File descriptor limits: $FD_SOFT_LIMIT (soft) / $FD_HARD_LIMIT (hard)"
echo "  - Process limits: $PROC_SOFT_LIMIT (soft) / $PROC_HARD_LIMIT (hard)"
echo "  - Memory lock limits: $MEM_SOFT_LIMIT (soft) / $MEM_HARD_LIMIT (hard)"
echo "  - File watch limits: $WATCHES_LIMIT watches"
echo "  - Docker file descriptor limits: $FD_SOFT_LIMIT"
echo ""
echo "To make these changes permanent across reboots, the script has:"
echo "  - Updated /etc/security/limits.conf"
echo "  - Updated /etc/sysctl.conf"
echo "  - Updated /etc/systemd/system.conf"
echo "  - Updated /etc/docker/daemon.json"
echo ""
echo "Backups of the original files have been created:"
echo "  - /etc/security/limits.conf.bak"
echo "  - /etc/sysctl.conf.bak"
echo "  - /etc/systemd/system.conf.bak"
echo "  - /etc/systemd/user.conf.bak"
echo ""
echo "For changes to take full effect, you might need to log out and log back in"
echo "or reboot your system."

exit 0
