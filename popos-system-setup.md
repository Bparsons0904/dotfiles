# Pop!_OS System Setup Documentation

## Completed Steps
- Install Chrome and Deezer flatpaks
- Install nala (apt replacement)
- Install Neovim (see detailed instructions below)
- Configure Git username and email
- Install Zsh
- Install Homebrew

## Neovim Installation (Official Tarball Method)

This system uses the official Neovim tarball release for better version control and consistency.

### Download
1. Visit https://github.com/neovim/neovim/releases
2. Download the latest `nvim-linux-x86_64.tar.gz`
3. Save to `~/Downloads/`

### Installation Steps
```bash
# Remove old installation if exists
sudo rm -rf /opt/nvim-linux-x86_64
sudo rm -f /usr/local/bin/nvim

# Extract tarball to /opt
sudo tar -C /opt -xzf ~/Downloads/nvim-linux-x86_64.tar.gz

# Create symlink in /usr/local/bin
sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim

# Verify installation
nvim --version
```

### Update Process
To update Neovim to a newer version:
1. Download the new tarball to `~/Downloads/`
2. Run the installation steps above (the removal steps will clean up the old version)
3. Restart any open terminal sessions

## Current Steps
### GitHub Setup with SSH
- Generate SSH key for GitHub
- Add SSH key to GitHub account
- Test GitHub SSH connection

### Shell Environment Setup
- Set Zsh as default shell
- Install Oh My Posh
- Install Zoxide

### Fonts
- Install Nerd Fonts

### Development Tools
- Install Rust and Cargo
- Install Zig (specifically version 0.13.x required for Ghostty)
- Install CMake
- Install Ghostty terminal
- Install Lua and LuaRocks

### Issues Encountered
- Chrome Flatpak PWA installation error: "This Flatpak does not have write access to ~/.local/share/applications and ~/.local/share/icons"
  - Solution: Install Flatseal and grant Chrome access to these directories
  
- Ghostty installation error: "error: expected enum literal .name = \"ghostty\","
  - Solution: Manually install Zig version 0.13.0:
  ```bash
  # Extract the downloaded tar file
  tar -xf zig-linux-x86_64-0.13.0.tar.xz
  
  # Move to a suitable location (optional)
  sudo mv zig-linux-x86_64-0.13.0 /usr/local/
  
  # Create symlink to make zig available system-wide
  sudo ln -sf /usr/local/zig-linux-x86_64-0.13.0/zig /usr/local/bin/zig
  
  # Verify installation
  zig version    # Should show 0.13.0
  ```
  - Ensure Zig 0.13.0 is in your PATH before attempting to build Ghostty

## Next Steps
- Reconnect NAS drive (see nas-reconnect.md)
- Pull in configuration files from GitHub
