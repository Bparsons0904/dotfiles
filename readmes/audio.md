# Linux Audio Configuration Changes

## Current Configuration

### PipeWire Sample Rate Configuration

Location: `~/.config/pipewire/pipewire.conf.d/99-sample-rate.conf`

```conf
context.properties = {
    default.clock.rate = 96000
    default.clock.quantum = 512
    default.clock.min-quantum = 32
    default.clock.max-quantum = 2048
    default.clock.force-rate = 96000
}
```

### USB Audio Quirks Configuration

Location: `/etc/modprobe.d/audio.conf`

```conf
options snd-usb-audio vid=0x262a pid=0x0001 quirk=0x4
```

## How to Undo Changes

### Remove PipeWire Sample Rate Configuration

```bash
rm ~/.config/pipewire/pipewire.conf.d/99-sample-rate.conf
systemctl --user restart pipewire pipewire-pulse
```

### Remove USB Audio Quirks

1. Remove the configuration file:

```bash
sudo rm /etc/modprobe.d/audio.conf
```

2. Rebuild initramfs:

```bash
sudo update-initramfs -u
```

3. Reboot the system:

```bash
sudo reboot
```

## Original Issue

- DAC would suddenly jump to 352kHz sample rate after extended playback
- Audio would become distorted when sample rate jumped
- Issue occurred with both 192kHz and 96kHz base configurations

## Changes Made

1. Created custom PipeWire configuration to set optimal sample rate and quantum values
2. Added USB quirks to prevent sample rate renegotiation
3. System requires full restart after changing PipeWire configuration for changes to take effect

## Hardware Details

- DAC: Douk Audio USB DAC (SAVITECH Corp. USB HIFI Audio)
- USB ID: 262a:0001
- Features: AKM and ESS chips
- Maximum supported rates:
  - PC-USB: PCM 32bit / 384KHz DSD256
  - Coaxial / Optical: 24bit / 192KHz
