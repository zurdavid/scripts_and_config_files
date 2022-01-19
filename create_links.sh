#!/usr/bin/env bash
# neovim
echo "Linking neovim config files..." 
rm -f -- $HOME/.config/nvim/init.vim
rm -rf $HOME/.config/nvim/sub
rm -rf $HOME/.config/nvim/ftplugin
mkdir $HOME/.config/nvim -p
ln -s $(pwd)/nvim/init.vim $HOME/.config/nvim
ln -s $(pwd)/nvim/sub $HOME/.config/nvim
ln -s $(pwd)/nvim/ftplugin $HOME/.config/nvim

# neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]
then
  echo "git clone tmux"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
for dotfile in .bashrc .inputrc .zshrc .tmux.conf .gitconfig ; do
  echo "Linking $dotfile..." 
  rm -f -- $HOME/$dotfile  
  ln -s $(pwd)/dotfiles/$dotfile $HOME/$dotfile
done

# git
GITTEMPPATH=$HOME/.config/git/template
mkdir -p $GITTEMPPATH 
cp $(pwd)/git/HEAD $GITTEMPPATH 
