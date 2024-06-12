#!/bin/bash

rm -rf $HOME/.config/nvim $HOME/.config/coc $HOME/.cache/dein
mkdir -p $HOME/.config/nvim

ln -s `pwd`/nvim/conf.d/init.vim $HOME/.config/nvim/init.vim
ln -s `pwd`/nvim/conf.d/dein.toml $HOME/.config/nvim/dein.toml
ln -s `pwd`/nvim/conf.d/dein_lazy.toml $HOME/.config/nvim/dein_lazy.toml
ln -s `pwd`/nvim/conf.d/coc-settings.json $HOME/.config/nvim/coc-settings.json

nvim --headless -u $HOME/.config/nvim/init.vim +qall

# Install coc.nvim extensions
if (type "anyenv" > /dev/null 2>&1); then
    eval "$(anyenv init -)"
fi
