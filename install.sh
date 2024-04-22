#!/bin/bash

# https://qiita.com/ganyariya/items/d9adffc6535dfca6784b
set -u
BASEDIR=$(dirname $0)
cd $BASEDIR
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    ln -snfv ${PWD}/"$f" ~/
done

# https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# https://github.com/ku1ik/vim-monokai
mkdir -p ~/.vim/colors
wget https://raw.githubusercontent.com/ku1ik/vim-monokai/master/colors/monokai.vim -P ~/.vim/colors/

# https://github.com/github/copilot.vim
git clone https://github.com/github/copilot.vim.git \
  ~/.vim/pack/github/start/copilot.vim
# :Copilot setup

