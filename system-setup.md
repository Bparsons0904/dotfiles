# System Setup Documentation

## Completed Steps
- Install Chrome and Deezer flatpaks
- Install nala (apt replacement)
- Install Neovim
- Configure Git username and email
- Install Zsh
- Install Homebrew

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
