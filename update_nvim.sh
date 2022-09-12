#!/usr/bin/env bash
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage

APPDIR=$HOME/Apps
mkdir -p $APPDIR

mv nvim.appimage $APPDIR
rm -f -- ~/.local/bin/nvim
ln -s $APPDIR/nvim.appimage ~/.local/bin/nvim
