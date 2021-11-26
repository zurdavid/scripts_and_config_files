#!/usr/bin/env bash
rm $HOME/.config/nvim/init.vim $HOME/.bashrc $HOME/.zshrc $HOME/.tmux.conf
ln -s $(pwd)/nvim/init.vim $HOME/.config/nvim
ln -s $(pwd)/shell/.bashrc $HOME/.bashrc
ln -s $(pwd)/shell/.zshrc $HOME/.zshrc
ln -s $(pwd)/shell/.tmux.conf $HOME/.tmux.conf

