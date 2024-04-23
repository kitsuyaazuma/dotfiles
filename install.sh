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
if [ -f ~/.vim/autoload/plug.vim ]; then
    echo "vim-plug already installed"
else
    echo "install vim-plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# https://github.com/ku1ik/vim-monokai
mkdir -p ~/.vim/colors
if [ -f ~/.vim/colors/monokai.vim ]; then
    echo "vim-monokai already installed"
else
    echo "install vim-monokai"
    wget https://raw.githubusercontent.com/ku1ik/vim-monokai/master/colors/monokai.vim -P ~/.vim/colors/
fi

# https://github.com/github/copilot.vim
if [ -d ~/.vim/pack/github/start/copilot.vim ]; then
    echo "copilot.vim already installed"
else
    echo "install copilot.vim"
    git clone https://github.com/github/copilot.vim.git ~/.vim/pack/github/start/copilot.vim
    #TODO :Copilot setup
fi

