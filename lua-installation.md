# Installing Lua and LuaRocks

This guide explains how to install Lua and LuaRocks on PopOS.

## Method 1: Using Package Manager (Simple)

```bash
# Install Lua
sudo nala install lua5.4

# Install LuaRocks
sudo nala install luarocks
```

## Method 2: Building from Source (Latest versions)

### Prerequisites
```bash
sudo nala install build-essential libreadline-dev unzip wget
```

### Install Lua from Source
```bash
# Download and extract Lua (adjust version as needed)
wget https://www.lua.org/ftp/lua-5.4.6.tar.gz
tar -xzf lua-5.4.6.tar.gz
cd lua-5.4.6

# Build and install
make linux
sudo make install

# Verify installation
lua -v
```

### Install LuaRocks from Source
```bash
# Download and extract LuaRocks
wget https://luarocks.org/releases/luarocks-3.9.2.tar.gz
tar -xzf luarocks-3.9.2.tar.gz
cd luarocks-3.9.2

# Configure, build, and install
./configure
make
sudo make install

# Verify installation
luarocks --version
```

## Setting Up Your Environment

Add this to your ~/.zshrc to ensure Lua modules are in your path:

```bash
# Add Lua and LuaRocks paths
export LUA_PATH="$(luarocks path --lr-path);;"
export LUA_CPATH="$(luarocks path --lr-cpath);;"
```

## Installing Packages with LuaRocks

Example of installing a Lua package:
```bash
# Install a package
luarocks install --local luasocket

# List installed packages
luarocks list
```

## Troubleshooting

If you encounter dependency issues:
```bash
# Install common development libraries
sudo nala install libssl-dev
```

If you need to specify a specific Lua version for LuaRocks:
```bash
./configure --with-lua-interpreter=lua5.4
```
