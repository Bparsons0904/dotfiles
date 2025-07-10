# NAS Reconnection Guide

This document outlines the process for reconnecting to a NAS drive at `/mnt/nas`.

## Setup Steps

1. Create credentials file:
```bash
sudo nvim ~/.smbcredentials
```

2. Add NAS credentials:
```
username=your_username
password=your_password
```

3. Secure the credentials file:
```bash
chmod 600 ~/.smbcredentials
```

4. Ensure mount point exists:
```bash
sudo mkdir -p /mnt/nas
```

5. Edit fstab for persistent mount:
```bash
sudo nvim /etc/fstab
```

6. Add the following line to fstab:
```
//nas_ip_address/share_name /mnt/nas cifs credentials=/home/your_username/.smbcredentials,iocharset=utf8,uid=1000,gid=1000 0 0
```

Replace:
- `nas_ip_address` with your NAS IP address
- `share_name` with the shared folder name
- `your_username` with your actual system username

7. Mount the drive:
```bash
sudo mount -a
```

## Troubleshooting

If you encounter issues:

1. Check connection to NAS:
```bash
ping nas_ip_address
```

2. Verify credentials are correct in the smbcredentials file

3. Check for additional required mount options:
```bash
sudo mount -t cifs //nas_ip_address/share_name /mnt/nas -o credentials=/home/your_username/.smbcredentials,iocharset=utf8,uid=1000,gid=1000,vers=3.0
```

4. Check system logs:
```bash
dmesg | grep cifs
```
