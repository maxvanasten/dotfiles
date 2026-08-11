echo "-= [NEOVIM] =-"
echo "Backing up ~/.config/nvim -> ~/.config/nvim_backup"
rm -rf ~/.config/nvim_backup
mkdir ~/.config/nvim_backup
mv ~/.config/nvim/* ~/.config/nvim_backup/
rm -rf ~/.config/nvim
echo "Copying .config/nvim/* -> ~/.config/nvim/"
mkdir ~/.config/nvim
cp -r config/nvim/* ~/.config/nvim

echo "-= [TMUX] =-"
echo "Backing up ~/.tmux.conf -> ~/.tmux.conf.backup"
mv ~/.tmux.conf ~/.tmux.conf.backup
echo "Copying .tmux.conf -> ~/.tmux.conf"
cp tmux.conf ~/.tmux.conf

echo "-= [.BASHRC] =-"
echo "Backing up ~/.bashrc -> ~/.bashrc.backup"
mv ~/.bashrc ~/.bashrc.backup
echo "Copying .bashrc -> ~/.bashrc"
cp bashrc ~/.bashrc

echo "-= [HYPRLAND] =-"
echo "Backing up ~/.config/hypr/bindings.lua -> ~/.config/hypr/bindings.lua.backup"
mv ~/.config/hypr/bindings.lua ~/.config/hypr/bindings.lua.backup
echo "Copying config/hypr/bindings.lua -> ~/.config/hypr/bindings.lua"
cp ./config/hypr/bindings.lua ~/.config/hypr/bindings.lua 
echo "Backing up ~/.config/hypr/looknfeel.lua -> ~/.config/hypr/looknfeel.lua.backup"
mv ~/.config/hypr/looknfeel.lua ~/.config/hypr/looknfeel.lua.backup
echo "Copying config/hypr/looknfeel.lua -> ~/.config/hypr/looknfeel.lua"
cp ./config/hypr/looknfeel.lua ~/.config/hypr/looknfeel.lua
hyprctl reload

echo "-= [Quotes] =-"
echo "Copying config/quotes.txt -> ~/.config/quotes.txt"
cp ./config/quotes.txt ~/.config/quotes.txt

echo "-= [Scripts] =-"
echo "Copying scripts/* -> /usr/bin/"
sudo cp ./scripts/* /usr/bin/

echo "-= [Prompts] =-"
echo "Copying prompts/ -> ~/.prompts"
sudo rm -rf ~/.prompts
mkdir ~/.prompts
sudo cp -r ./prompts/* ~/.prompts/
