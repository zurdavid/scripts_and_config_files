#!/usr/bin/env bash
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage ~/bin
rm -f -- ~/.local/bin/nvim
ln -s ~/bin/nvim.appimage ~/.local/bin/nvim
