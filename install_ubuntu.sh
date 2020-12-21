#!/bin/bash

set -e

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# ====================================================

echo "${Blue}Setting up environment...${Color_Off}"
echo ""

echo "${Yellow}Installing zsh.${Color_Off}"
sudo apt update
sudo apt install zsh -y
echo "${Green}zsh installed.${Color_Off}"

# Install Oh my ZSH
if [ ! -d ~/.oh-my-zsh ]; then
  echo "${Yellow}Installing oh-my-zsh.${Color_Off}"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "${Green}oh-my-zsh already installed.${Color_Off}"
else
  echo "${Green}oh-my-zsh is already installed.${Color_Off}"
fi

# Install Powerline 10k
if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
  echo "${Yellow}Installing Powerline 10k${Color_Off}"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  echo "${Green}Powerline 10k installed successfully.${Color_Off}"
else
  echo "${Green}Powerline 10k already installed.${Color_Off}"
fi

# Setup dotfiles

if [ ! -d ~/.dotfiles ]; then
  echo "${Yellow}Cloning dotfiles repo.${Color_Off}"
  git clone https://github.com/labooner/dotfiles ~/.dotfiles
  echo "${Green}dotfiles successfully cloned.${Color_Off}"
else
  echo "${Yellow}dotfiles already exist. Trying to update with git pull...${Color_Off}"
  cd ~/.dotfiles
  git pull
  cd -
  echo "${Green}Update complete.${Color_Off}"
fi

echo "${Yellow}Create symlinks for dot files.${Color_Off}"
ln -sfn ~/.dotfiles/.vimrc ~/.vimrc
ln -sfn ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sfn ~/.dotfiles/.zshrc ~/.zshrc
ln -sfn ~/.dotfiles/.p10k.zsh ~/.p10k.zsh

# Setup SSH keys
echo "Generate an SSH keypair: ssh -t ed25519 -C \"labooner.github.com\""

# Setup GPG keys
echo "Generate a GPG key: gpg --full-generate-key"
