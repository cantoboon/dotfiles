#!/bin/bash

set -e

echo "Setting up environment..."
echo ""

echo "Installing zsh"
sudo apt update
sudo apt install zsh -y

# Install Oh my ZSH
echo "Installing oh-my-zsh"
if [ -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Powerline 10k
echo "Installing Powerline 10k"
if [ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Setup dotfiles
echo "Cloning dotfiles repo"
if [ -d ~/.dotfiles ]; then
  git clone https://github.com/labooner/dotfiles ~/.dotfiles
fi

echo "Create symlinks for dot files"
ln -sfn ~/.dotfiles/.vimrc ~/.vimrc
ln -sfn ~/.dotfiles/.gitignore ~/.gitignore
ln -sfn ~/.dotfiles/.zshrc ~/.zshrc

# Setup SSH keys
echo "Generate an SSH keypair: ssh -t ed25519 -C \"labooner.github.com\""

# Setup GPG keys
echo "Generate a GPG key: gpg --full-generate-key"
