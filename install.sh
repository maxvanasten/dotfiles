#!/usr/bin/env bash

sudo pacman -Syu --noconfirm
# Install yay package manager
sudo pacman -S --needed --noconfirm git base-devel
mkdir ~/yay
git clone https://aur.archlinux.org/yay-bin.git ~/yay
cd ~/yay
makepkg -si --noconfirm
rm -rf ~/yay
# Install dependencies
yay -S --noconfirm nodejs npm fastfetch neovim-nightly-bin
# Install random_quote
cd ~
git clone https://github.com/maxvanasten/random_quote ~/random_quote
cd ~/random_quote
go build ~/random_quote/cmd/main.go
sudo mv ~/random_quote/main /usr/bin/random_quote
rm -rf ~/random_quote

# Get dotfiles
cd ~
git clone https://github.com/maxvanasten/dotfiles ~/dotfiles
cd ~/dotfiles
bash sync.sh
rm -rf ~/dotfiles
