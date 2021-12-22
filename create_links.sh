#!/usr/bin/env bash
# neovim
echo "Linking neovim config files..." 
rm -f -- $HOME/.config/nvim/init.vim
rm -rf $HOME/.config/nvim/sub
rm -rf $HOME/.config/nvim/ftplugin
ln -s $(pwd)/nvim/init.vim $HOME/.config/nvim
ln -s $(pwd)/nvim/sub $HOME/.config/nvim
ln -s $(pwd)/nvim/ftplugin $HOME/.config/nvim

for dotfile in .bashrc .inputrc .zshrc .tmux.conf .gitconfig ; do
  echo "Linking $dotfile..." 
  rm -f -- $HOME/$dotfile  
  ln -s $(pwd)/dotfiles/$dotfile $HOME/$dotfile
done

# git
GITTEMPPATH=$HOME/.config/git/template
mkdir -p $GITTEMPPATH 
cp $(pwd)/git/HEAD $GITTEMPPATH 
