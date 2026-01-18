# Backup neovim config
rm -rf ~/.config/nvim_backup
mkdir ~/.config/nvim_backup
mv ~/.config/nvim/* ~/.config/nvim_backup/
# Copy neovim config
cp -r .config/nvim/* ~/.config/nvim

# Backup tmux config
mv ~/.tmux.conf ~/.tmux.conf.backup
# Copy tmux config
cp .tmux.conf ~/.tmux.conf

# Backup .bashrc
mv ~/.bashrc ~/.bashrc.backup
# Copy and source .bashrc
cp .bashrc ~/.bashrc
source ~/.bashrc
