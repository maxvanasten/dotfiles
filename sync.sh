#echo "-= [NEOVIM] =-"

#echo "Backing up ~/.config/nvim -> ~/.config/nvim_backup"
#rm -rf ~/.config/nvim_backup
#mkdir ~/.config/nvim_backup
#mv ~/.config/nvim/* ~/.config/nvim_backup/

#echo "Copying .config/nvim/* -> ~/.config/nvim/"
#mkdir ~/.config/nvim
#cp -r config/nvim/* ~/.config/nvim

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

echo "Backing up ~/.config/hypr/bindings.conf -> ~/.config/hypr/bindings.conf.backup"
mv ~/.config/hypr/bindings.conf ~/.config/hypr/bindings.conf.backup

echo "Copying config/hypr/bindings.conf -> ~/.config/hypr/bindings.conf"
cp ./config/hypr/bindings.conf ~/.config/hypr/bindings.conf 
