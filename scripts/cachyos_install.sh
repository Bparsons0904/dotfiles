#!/bin/bash
set -e

echo "Caching sudo credentials..."
sudo -v

# Keep sudo alive in background
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

echo "Setting up SSH key..."
if [ ! -f ~/.ssh/id_ed25519 ]; then
  echo "Generating new SSH key..."
  ssh-keygen -t ed25519 -C "deadstylebp@gmail.com" -f ~/.ssh/id_ed25519 -N ""
  echo "SSH key generated at ~/.ssh/id_ed25519"
else
  echo "SSH key already exists, skipping..."
fi

cat ~/.ssh/id_ed25519.pub | wl-copy
echo "Public key copied to clipboard"
echo "Add this SSH key to GitHub"
echo ""
echo ""

echo "Installing packages"
echo "Installing paru"
sudo pacman -S --needed paru

echo "Installing packages with paru..."
core_packages=(
  stow
  google-chrome
  neovim
  zoxide
  oh-my-posh
  ghostty
)

for pkg in "${core_packages[@]}"; do
  echo "Installing $pkg..."
  paru -S --skipreview --noconfirm --needed "$pkg"
done

echo "Removing default configs..."
rm -f ~/.zshrc
rm -f ~/.bashrc
rm -rf ~/.config/hypr
rm -rf ~/.config/waybar

git --global config user.email "deadstylebp@gmail.com"
git --global config user.name "Bob Parsons"

echo "Setting up dotfiles..."
if [ ! -d ~/dotfiles ]; then
  echo "Cloning dotfiles..."
  git clone git@github.com:Bparsons0904/dotfiles.git ~/dotfiles
else
  echo "dotfiles already exists, skipping clone..."
fi

cd ~/dotfiles
git checkout neo-lsp
stow .
