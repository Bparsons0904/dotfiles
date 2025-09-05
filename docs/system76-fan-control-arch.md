# System76 Fan Control on CachyOS/Arch Linux

## Overview

This guide provides a complete solution for System76 Thelio desktop fan control issues on CachyOS and other Arch-based distributions. The constant full-speed fan noise is caused by missing proprietary drivers for the custom Thelio Io daughterboard that controls all system fans.

## The Problem

System76 Thelio desktops use a custom **Thelio Io daughterboard** that intercepts all fan control from the motherboard. Without the proper drivers:
- Fans default to 100% speed as a hardware failsafe
- Standard Linux fan control tools (lm-sensors, fancontrol) cannot detect or control fans
- The system76_acpi module alone is insufficient

## The Solution

Install the complete System76 driver stack from the AUR:

### Prerequisites

Ensure you have the build tools and kernel headers:

```bash
# Install build tools
sudo pacman -S --needed base-devel git

# Install kernel headers (adjust for your kernel)
sudo pacman -S --needed linux-cachyos-headers

# Optional: Install an AUR helper (recommended)
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

### Install System76 Packages

Using an AUR helper (recommended):

```bash
paru -S system76-io-dkms system76-power system76-driver system76-dkms system76-firmware-daemon firmware-manager
```

Or manually for each package:

```bash
# Example for system76-io-dkms
git clone https://aur.archlinux.org/system76-io-dkms.git
cd system76-io-dkms
makepkg -srcif
```

### Package Descriptions

| Package | Purpose | Priority |
|---------|---------|----------|
| `system76-io-dkms` | Kernel module providing hwmon interface to Thelio Io board | **Critical** |
| `system76-power` | Daemon that controls fan speeds based on temperature | **Critical** |
| `system76-driver` | Base driver package with utilities | Required |
| `system76-dkms` | General DKMS module for hotkeys/other functions | Required |
| `system76-firmware-daemon` | Firmware update management | Recommended |
| `firmware-manager` | GUI for firmware updates | Recommended |

### Configuration

1. **Enable the power daemon:**
   ```bash
   sudo systemctl enable --now com.system76.PowerDaemon.service
   ```

2. **Add user to adm group:**
   ```bash
   sudo gpasswd -a $USER adm
   ```

3. **Reboot the system:**
   ```bash
   sudo reboot
   ```

## Verification

After rebooting, verify everything is working:

```bash
# Check loaded modules
lsmod | grep system76

# Check DKMS status
dkms status

# Verify daemon is running without errors
systemctl status com.system76.PowerDaemon.service

# Check fan speeds are now visible
sensors

# Look for new hwmon interfaces
ls /sys/class/hwmon/
```

**Success indicators:**
- `system76` and `system76_io` modules are loaded
- `sensors` command shows fan RPM readings
- Power daemon status shows no "platform hwmon not found" errors
- Fans operate quietly at idle and ramp up/down with temperature changes

## Troubleshooting

### Fans still at full speed after reboot

1. **Check module loading:**
   ```bash
   lsmod | grep system76
   cat /etc/modules-load.d/system76.conf
   ```

2. **Verify DKMS build:**
   ```bash
   dkms status
   # Should show system76-io built for current kernel
   ```

3. **Check daemon logs:**
   ```bash
   journalctl -u com.system76.PowerDaemon.service
   # Look for "platform hwmon not found" errors
   ```

### After kernel updates

DKMS should automatically rebuild modules, but if fans revert to full speed:

```bash
# Check kernel headers match running kernel
pacman -Q linux-cachyos-headers
uname -r

# Manually rebuild if needed
sudo dkms autoinstall
```

### File conflicts during installation

If you get `/etc/modules-load.d/system76.conf exists in filesystem`:

```bash
# Remove conflicting file and retry
sudo rm /etc/modules-load.d/system76.conf
paru -S system76-io-dkms system76-power system76-driver system76-dkms
```

## Architecture Details

The Thelio Mira uses a unique cooling architecture:

1. **Thelio Io Daughterboard**: Custom PCB that controls all system fans
2. **Hardware Abstraction**: All fans connect to daughterboard, not motherboard headers
3. **Driver Stack**: Two-part system:
   - `system76-io-dkms`: Kernel module creating hwmon interface
   - `system76-power`: User-space daemon implementing fan curves
4. **Failsafe Design**: Without drivers, fans default to 100% for thermal protection

This explains why standard Linux fan control tools are ineffective and why System76-specific drivers are mandatory.

## Hardware Compatibility

This guide applies to System76 Thelio desktops with proprietary firmware:
- Thelio Mira (all revisions)
- Thelio Major
- Thelio Massive
- Other Thelio models using the Thelio Io daughterboard

**Not applicable to:**
- System76 laptops (use different drivers)
- "Open Firmware" System76 systems
- Non-System76 hardware

## References

- [System76 Arch Linux Support](https://github.com/pop-os/system76-acpi-dkms)
- [Thelio Technical Documentation](https://tech-docs.system76.com/)
- [AUR Packages](https://aur.archlinux.org/packages/?K=system76)

---

**Last Updated**: September 2025  
**Tested On**: CachyOS with kernel 6.16.4-4-cachyos  
**Hardware**: System76 Thelio Mira B4.1