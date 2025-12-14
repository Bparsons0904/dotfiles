#!/usr/bin/env zsh

# Function to print colored output
print_step() {
  echo "\033[0;34m==>\033[0m \033[1m$1\033[0m"
}

print_error() {
  echo "\033[0;31mError:\033[0m \033[1m$1\033[0m"
}

print_success() {
  echo "\033[0;32mSuccess:\033[0m \033[1m$1\033[0m"
}

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to install Rust
install_rust() {
  if ! command_exists rustc; then
    print_step "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
  else
    print_success "Rust is already installed"
  fi
}

# Function to setup zsh configurations
setup_zsh_config() {
  if ! grep -q "source.*fzf.*completion" ~/.zshrc; then
    print_step "Setting up fzf for zsh..."
    cat >>~/.zshrc <<'EOF'
# Load fzf bindings (location varies by distro)
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
elif [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi
EOF
  fi
}

# Function to install npm global packages
install_npm_packages() {
  print_step "Installing global npm packages..."
  npm install -g neovim tree-sitter-cli
}

# Detect operating system
if [[ "$(uname)" == "Darwin" ]]; then
  # macOS installation
  print_step "Detected macOS system"

  # Install Homebrew if not present
  if ! command_exists brew; then
    print_step "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install packages
  print_step "Installing packages via Homebrew..."
  brew install go node lua luarocks fzf cmake gcc ripgrep

  # Setup fzf for zsh
  setup_zsh_config

  # Install Rust
  install_rust

elif command_exists pacman; then
  # Arch Linux installation
  print_step "Detected Arch Linux system"

  print_step "Installing base development tools and packages..."
  sudo pacman -S --noconfirm base-devel go nodejs npm lua luarocks fzf cmake inotify-tools ripgrep wl-clipboard

  # Setup fzf for zsh
  setup_zsh_config

  # Install Rust
  install_rust

elif command_exists apt; then
  # Debian/Ubuntu installation
  print_step "Detected Debian/Ubuntu system"

  print_step "Updating package lists..."
  sudo apt update

  print_step "Installing base development tools..."
  sudo apt install -y build-essential

  print_step "Installing packages..."
  # Install Node.js from NodeSource
  if ! command_exists node; then
    print_step "Setting up NodeSource repository..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  fi

  sudo apt install -y golang-go nodejs lua5.4 luarocks fzf cmake python3-pip python3-venv python3-dev ripgrep wl-clipboard

  # Setup fzf for zsh
  setup_zsh_config

  # Install Rust
  install_rust

else
  print_error "Unsupported operating system"
  exit 1
fi

# Common steps for all platforms
install_npm_packages

# Build telescope-fzf-native
print_step "Building telescope-fzf-native..."
TELESCOPE_FZF_PATH="$HOME/.local/share/nvim/lazy/telescope-fzf-native.nvim"
if [[ -d "$TELESCOPE_FZF_PATH" ]]; then
  cd "$TELESCOPE_FZF_PATH"
  if make; then
    print_success "telescope-fzf-native built successfully"
  else
    print_error "Failed to build telescope-fzf-native"
  fi
else
  print_error "telescope-fzf-native directory not found. Install it through your Neovim package manager first."
fi

# Verify installations
print_step "Verifying installations..."

COMMANDS=(
  "go:Go"
  "node:Node.js"
  "npm:npm"
  "rustc:Rust"
  "cargo:Cargo"
  "lua:Lua"
  "luarocks:LuaRocks"
  "fzf:fzf"
  "cmake:CMake"
  "rg:ripgrep"
  "python3:Python"
  "pip3:pip"
)

for cmd in "${COMMANDS[@]}"; do
  IFS=":" read -r command name <<<"$cmd"
  if command_exists $command; then
    print_success "$name is installed"
    $command --version
  else
    print_error "$name is not installed"
  fi
done

print_step "Installation complete! Please restart your terminal for all changes to take effect."
print_step "After restart, run :checkhealth in Neovim to verify all dependencies."
