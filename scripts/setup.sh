#! /bin/zsh

# Create alias on currently existing .zshrc
echo "alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> $HOME/.zshrc

# Add .dotfiles to gitignore
echo ".dotfiles" >> .gitignore

# Clone bare repo
git clone --bare git@github.com:theofficialnar/.dotfiles.git $HOME/.dotfiles

# Rename existing .zshrc and .bashrc files
mv $HOME/.zshrc $HOME/.zshrc_bak
mv $HOME/.bashrc $HOME/.bashrc_bak

# Put all the files into their designated folders
dotfile checkout

# Only track files specifically added
dotfile config --local status.showUntrackedFiles no