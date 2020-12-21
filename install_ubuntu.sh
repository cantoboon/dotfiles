#!/bin/bash

set -e

echo "Setting up environment..."
echo ""

echo "Installing zsh"
sudo apt update
sudo apt install zsh -y

# Install Oh my ZSH
echo "Installing oh-my-zsh"
[[ -d ~/.oh-my-zsh ]] || sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerline 10k
echo "Installing Powerline 10k"
[[ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Setup dotfiles
echo "Cloning dotfiles repo"
[[ -d ~/.dotfiles ]] || git clone https://github.com/labooner/dotfiles ~/.dotfiles

echo "Create symlinks for dot files"
ln -sfn ~/.dotfiles/.vimrc ~/.vimrc
ln -sfn ~/.dotfiles/.gitignore ~/.gitignore
ln -sfn ~/.dotfiles/.zshrc ~/.zshrc

# Setup SSH keys
echo "Generate an SSH keypair: ssh -t ed25519 -C \"labooner.github.com\""

# Setup GPG keys
echo "Generate a GPG key: gpg --full-generate-key"
