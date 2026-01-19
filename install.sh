sudo pacman -Syu
# Install yay package manager
sudo pacman -S --needed git base-devel
mkdir ~/yay
git clone https://aur.archlinux.org/yay-bin.git ~/yay
cd ~/yay
makepkg -si
rm -rf ~/yay
# Install nodejs and npm
yay -S nodejs npm
# Install bibletui
sudo npm install -g bibletui
# Install neovim
yay -S neovim-nightly-bin
