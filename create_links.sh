#!/usr/bin/env bash
rm  $HOME/.bashrc $HOME/.zshrc $HOME/.tmux.conf
# nvim
rm $HOME/.config/nvim/init.vim
rm -rf $HOME/.config/nvim/sub
ln -s $(pwd)/nvim/init.vim $HOME/.config/nvim
ln -s $(pwd)/nvim/sub $HOME/.config/nvim 

ln -s $(pwd)/shell/.bashrc $HOME/.bashrc
ln -s $(pwd)/shell/.zshrc $HOME/.zshrc
ln -s $(pwd)/shell/.tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/shell/.inputrc $HOME/.inputrc

