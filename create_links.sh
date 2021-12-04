#!/usr/bin/env bash
# neovim
rm -f -- $HOME/.config/nvim/init.vim
rm -rf $HOME/.config/nvim/sub
ln -s $(pwd)/nvim/init.vim $HOME/.config/nvim
ln -s $(pwd)/nvim/sub $HOME/.config/nvim

rm -f -- $HOME/.bashrc
rm -f -- $HOME/.inputrc
rm -f -- $HOME/.zshrc
rm -f -- $HOME/.tmux.conf
ln -s $(pwd)/shell/.bashrc $HOME/.bashrc
ln -s $(pwd)/shell/.zshrc $HOME/.zshrc
ln -s $(pwd)/shell/.tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/shell/.inputrc $HOME/.inputrc
