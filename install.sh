#!/usr/bin/env bash

sudo pacman -Syu
# Install yay package manager
sudo pacman -S --needed git base-devel
mkdir ~/yay
git clone https://aur.archlinux.org/yay-bin.git ~/yay
cd ~/yay
makepkg -si
rm -rf ~/yay
# Install dependencies
yay -S nodejs npm fastfetch neovim-nightly-bin
# Install random_quote
git clone https://github.com/maxvanasten/random_quote ~/random_quote
cd ~/random_quote
go build cmd/main.go
sudo mv main /usr/bin/random_quote
