# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a custom Neovim configuration built on top of Lazy.nvim, featuring a modular architecture with comprehensive LSP support, extensive keybindings, and a curated set of plugins for modern development workflows.

## Architecture

### Configuration Structure
- **`init.lua`**: Main entry point that loads core modules and sets colorscheme
- **`lua/core/`**: Core configuration modules
  - `init.lua`: Loads all core modules (keymaps, options, autocmds, commands)
  - `lazy.lua`: Lazy.nvim package manager setup with plugin imports
  - `options.lua`: Vim options and editor settings
  - `keymaps.lua`: Global keybindings and keymap utilities
  - `commands.lua`: Custom user commands
  - `autocmds/`: Directory containing autocommands (title, yank highlighting)
- **`lua/plugins/`**: Individual plugin configurations as separate files
- **`lua/colorschemes/`**: Color scheme configurations
- **`lazy-lock.json`**: Locked plugin versions for reproducible installs

### Plugin System
Uses Lazy.nvim with automatic plugin loading from:
- `plugins/` directory for functionality plugins
- `colorschemes/` directory for theme plugins

Key plugins include:
- **LSP**: nvim-lspconfig with Mason for automatic LSP/tool installation
- **Completion**: blink.cmp for completion engine
- **Fuzzy Finding**: Telescope with fzf-native and smart-open extensions
- **Git Integration**: Gitsigns, git-blame, LazyGit integration
- **Language Support**: Go, TypeScript, Templ, HTML, Lua with dedicated tools
- **UI Enhancement**: Lualine, Neo-tree, Noice, Flash for navigation

### Theme System
Centralized theme management in `lua/core/init.lua` with theme table:
```lua
local themes = {
  tokyo = "tokyonight",
  tokyonight = "tokyonight-night", 
  eldritch = "eldritch",
  stoics = "stoics",
  nightfall = "nightfall",
}
```
Currently using `eldritch` theme.

## Common Commands

### Plugin Management
```bash
# Update plugins
:Lazy update

# Install new plugins
:Lazy install

# Check plugin status
:Lazy
```

### LSP Operations
```bash
# Restart LSP server
<leader>lr  # or :LspRestart

# Mason tool management
:Mason

# Check LSP status
:LspInfo
```

### File Navigation
```bash
# Smart file finder (excludes tests)
<leader>ff

# Find test files specifically  
<leader>ft

# Find all files
<leader>fo

# Live grep search
<leader>fg

# Recent files
<leader>fr

# File tree
# Uses Neo-tree (check plugins/neo-tree.lua for keybindings)
```

### Development Workflow
```bash
# Git operations
<leader>gg  # LazyGit (if configured)

# Buffer management  
<leader>bb  # Previous buffer
<leader>bn  # Next buffer
<leader>1-9 # Go to buffer by number

# LSP navigation
gd          # Go to definition (Telescope)
gR          # Show references (Telescope) 
gi          # Show implementations (Telescope)
gt          # Show type definitions (Telescope)
```

### Custom Commands
```bash
:GitIgnore  # Locally ignore changes to current file
:GitTrack   # Stop ignoring changes to current file
```

## Development Patterns

### Adding New Plugins
1. Create new file in `lua/plugins/` with plugin specification
2. Use the established pattern with configuration function
3. Add keymaps using the global `addKeyMaps()` utility from `core/keymaps.lua`

### Keymap Conventions  
- Leader key: `<Space>`
- File operations: `<leader>f*` prefix
- LSP operations: `<leader>l*` prefix  
- Buffer operations: `<leader>b*` prefix
- Git operations: `<leader>g*` prefix (when configured)

### LSP Configuration
LSP servers are configured in `lua/plugins/lsp.lua` with:
- Mason for automatic installation of LSP servers and tools
- Capabilities from blink.cmp for completion integration
- Server-specific settings in the `servers` table
- Tools auto-installed via `ensure_installed` list

### Language-Specific Features
- **Go**: Full LSP support with gofumpt, goimports, golangci-lint
- **TypeScript/JavaScript**: ESLint integration with typescript-tools
- **Templ**: Go template language support with dedicated LSP
- **HTML**: HTML LSP with HTMX and Emmet support
- **Lua**: Lua LSP with Neovim API completion via lazydev.nvim

## Configuration Customization

### Changing Themes
Modify the `themes` table in `lua/core/init.lua` and update the `vim.cmd.colorscheme()` call.

### Adding Keymaps
Use the global utilities in `lua/core/keymaps.lua`:
```lua
addToKeyMap(mode, key, cmd, desc, opts)
addKeyMaps(keymaps_table)
```

### Performance Settings
Key performance optimizations already configured:
- Disabled native plugins in lazy.nvim setup
- LSP logging set to ERROR level only
- Change detection disabled for lazy.nvim
- Optimized updatetime and timeoutlen settings