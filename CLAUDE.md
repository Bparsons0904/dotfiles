# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Structure

This is a personal dotfiles repository using GNU Stow for symlink management. The configuration is organized into:

- **Shell Configuration**: Modular zsh setup with OS-specific configurations and tool-specific modules
- **Neovim Configurations**: Multiple Neovim setups including LazyVim and a custom "neo" configuration
- **Terminal Tools**: Kitty terminal, Oh My Posh themes, and various CLI tool configurations
- **Hyprland Desktop**: Hyprland window manager with Waybar status bar configuration
- **System Scripts**: Development environment setup and system limit configuration

## Common Commands

### Dotfile Management
```bash
# Apply dotfiles using GNU Stow
stow .

# Navigate to dotfiles directory
dot  # alias for cd ~/dotfiles/
```

### Shell Configuration
The zsh configuration is modular and loads configurations in this order:
1. `~/.config/zsh/env.zsh` - Environment variables
2. OS-specific configuration (`~/.config/zsh/os/darwin.zsh` or `~/.config/zsh/os/linux.zsh`)
3. Tool configurations from `~/.config/zsh/tools/*.zsh`
4. `~/.config/zsh/aliases.zsh` and `~/.config/zsh/functions.zsh`

### Development Environment Setup
```bash
# Setup Neovim development dependencies
./scripts/nvim-setup.zsh

# Configure system limits for development (requires sudo)
sudo ./scripts/linux-system-limits.sh
```

### Important: Claude Code Command Usage
**CRITICAL**: This repository uses `alias cd='z'` (zoxide). Claude Code must use absolute paths or `\cd` to avoid failures.

**Examples:**
- ✅ `ls ~/dotfiles/.config/nvim/`
- ✅ `\cd ~/dotfiles && ls`  
- ❌ `cd ~/dotfiles && ls` (will fail)

### Navigation and Aliases
Key aliases defined in `.config/zsh/aliases.zsh`:
- `neo` - Launch Neovim (same as `nvim`, kept for consistency)
- `nvim_old` - Launch backup Neovim configuration (`NVIM_APPNAME=nvim-old nvim`)
- `nvim-lite` - Launch lightweight Neovim configuration (`NVIM_APPNAME=nvim-lite nvim`)
- `lg` - LazyGit
- `zj` - Zellij terminal multiplexer
- `rc` - Edit zshrc (`nvim ~/.zshrc`)
- `src` - Source zshrc (`source ~/.zshrc`)
- `dot` - Navigate to dotfiles directory (`cd ~/dotfiles/`)

Development directory shortcuts:
- `dev` - ~/Development/
- `bp` - ~/Development/bobparsons.dev/
- `ncon` - ~/.config/nvim/
- `kcon` - ~/.config/kitty/

Extensive project shortcuts are defined in the aliases file.

## Architecture Overview

### Shell Environment
- **Primary Shell**: Zsh with modular configuration system in `.config/zsh/`
- **Bash Compatibility**: Minimal `.bashrc` for scripts and compatibility
- **Package Managers**: Homebrew (Linux/macOS), NVM for Node.js
- **CLI Tools**: Integrated configurations for fzf, zoxide, thefuck, oh-my-posh
- **Development Tools**: Go, Rust, Node.js, Lua toolchains configured

### Editor Configurations
- **Primary Neovim Setup**: Custom configuration with modular plugin architecture
- **Backup Neovim Setup**: LazyVim-based configuration kept as `nvim-old` for emergencies
- **Lightweight Neovim Setup**: Minimal configuration as `nvim-lite` for quick editing
- **Plugin Architecture**: Modular plugin configuration with theme system

### System Configuration
- **Terminals**: Kitty and Ghostty with custom themes and configurations
- **Terminal Multiplexer**: Zellij configuration for session management
- **Prompt**: Oh My Posh with multiple theme options
- **File Management**: GNU Stow for dotfile deployment
- **Development Tools**: Lunar IDE configuration included

## Development Patterns

When working with this dotfiles repository:

1. **Shell Configuration Changes**: Modify files in `.config/zsh/` and source appropriate files
2. **Neovim Plugin Changes**: Add plugins to appropriate `lua/plugins/` directory
3. **Theme Changes**: Modify theme files in respective theme directories
4. **System Scripts**: Shell scripts in `scripts/` directory for environment setup

## File Organization

- `.config/zsh/` - Modular zsh configuration system (primary shell)
- `.config/nvim/` - Primary Neovim configuration (custom setup)
- `.config/nvim-old/` - Backup Neovim configuration (LazyVim-based)
- `.config/nvim-lite/` - Lightweight Neovim configuration
- `.config/kitty/` - Kitty terminal configuration
- `.config/ghostty/` - Ghostty terminal configuration
- `.config/zellij/` - Zellij terminal multiplexer configuration
- `.config/hypr/` - Hyprland window manager configuration
- `.config/waybar/` - Waybar status bar configuration
- `.config/lunar/` - Lunar IDE configuration
- `.config/oh-my-posh/themes/` - Prompt themes
- `scripts/` - System setup and utility scripts
- `.bashrc` - Minimal bash compatibility configuration
- `.zshrc` - Zsh configuration entry point
- `archive/bash/` - Archived comprehensive bash configurations