#!/bin/bash
set -e

echo "Caching sudo credentials..."
sudo -v

while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

echo "Installing packages with paru..."
core_packages=(
  docker
  docker-compose
  beekeeper-studio
  air
  tilt-bin
  lazygit
  lazydocker
  zellij
  fzf
  ripgrep
)

for pkg in "${core_packages[@]}"; do
  echo "Installing $pkg..."
  paru -S --skipreview --noconfirm --needed "$pkg"
done

echo "Installing nvm and Node.js 22"
if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  \. "$HOME/.nvm/nvm.sh"
  echo "Intalling node"
  nvm install 22
else
  echo "nvm already installed, skipping..."
fi

if ! command -v claude-code &>/dev/null; then
  echo "Installing Claude Code..."
  npm install -g @anthropic-ai/claude-code
else
  echo "Claude Code already installed, skipping..."
fi

if ! command -v gemini &>/dev/null; then
  echo "Installing Gemini..."
  npm install -g @google/gemini-cli
else
  echo "Gemini already installed, skipping..."
fi

mkdir -p $HOME/Development

echo "Setup complete!"
