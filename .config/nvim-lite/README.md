# Neovim Lite Configuration

A lightweight Neovim configuration designed for remote servers and minimal environments.

## Features

- **Tokyo Night** theme
- **LSP support** for YAML, JSON, and shell files (.env)
- **Formatting** with Prettier
- **All core keymaps** from your main configuration
- **System clipboard** integration with yank highlighting
- **Mason** for easy LSP server management

## Usage

To use this configuration:

```bash
# From the nvim-lite directory
NVIM_APPNAME=nvim-lite nvim

# Or add an alias to your shell config
alias nvim-lite='NVIM_APPNAME=nvim-lite nvim'
```

## Installation

1. Copy this directory to your remote server
2. Launch nvim with `NVIM_APPNAME=nvim-lite nvim`
3. Lazy.nvim will auto-install all plugins on first run
4. Mason will install the required LSP servers

## Key Mappings

All your familiar keymaps are preserved, plus built-in alternatives to telescope:

### Core Operations
- `<leader>ww` - Save file
- `<leader>wq` - Save and quit all
- `<leader>a` - Select entire file
- `<leader>h` - Clear search highlights

### Navigation
- `<C-h/j/k/l>` - Window navigation
- `<leader>bb/bn` - Buffer navigation
- `<leader><leader>` - Toggle between recent buffers

### File Management (Built-in alternatives)
- `<leader>fe` - Open file explorer (netrw - `:Explore`)
- `<leader>ff` - Find file by name (`:find`)
- `<leader>fo` - Open/edit file (`:e`)
- `<leader>fr` - Show recent files (`:oldfiles`)
- `<leader>fb` - List buffers and switch

### Search & Quickfix
- `<leader>fg` - Grep search in files (`:vimgrep`)
- `<leader>fq` - Open quickfix list
- `<leader>fn/fp` - Next/previous quickfix item

### LSP & Formatting
- `<leader>lc` - Format buffer
- `<leader>lh` - Toggle inlay hints
- `gd/gr/gi/gt` - LSP navigation
- `K` - Show documentation
- `<leader>d` - Show diagnostics
- `<leader>la` - Code actions
- `<leader>rn` - Rename symbol

## Plugins

- **folke/lazy.nvim** - Plugin manager
- **folke/tokyonight.nvim** - Theme
- **neovim/nvim-lspconfig** - LSP client
- **williamboman/mason.nvim** - LSP server manager
- **stevearc/conform.nvim** - Formatting
- **saghen/blink.cmp** - Completion
- **b0o/schemastore.nvim** - JSON schemas