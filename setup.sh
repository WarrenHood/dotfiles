#! /usr/bin/env bash

echo "Setting up the stuff..."

echo "Updating arch"
sudo pacman -Syyu
sudo pacman -S ripgrep fd neovim make stow


# tmux plugin manager and theme
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

