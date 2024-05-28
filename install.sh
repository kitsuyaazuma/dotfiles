#!/bin/bash

# https://qiita.com/ganyariya/items/d9adffc6535dfca6784b
set -u
BASEDIR=$(dirname $0)
cd $BASEDIR
ln -snfv ${PWD}/.vimrc ~/

# https://github.com/junegunn/vim-plug
if [ -f ~/.vim/autoload/plug.vim ]; then
    echo "vim-plug already installed"
else
    echo "install vim-plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# https://github.com/VundleVim/Vundle.vim
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Vundle.vim already installed"
else
    echo "install Vundle.vim"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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

# https://github.com/airblade/vim-gitgutter
if [ -d ~/.vim/pack/airblade/start/vim-gitgutter ]; then
    echo "vim-gitgutter already installed"
else
    echo "install vim-gitgutter"
    git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/airblade/start/vim-gitgutter
    vim -u NONE -c "helptags vim-gitgutter/doc" -c q
fi

mkdir -p ~/.vim/config
if [ -f ~/.vim/config/coc-example-config.vim ]; then
    echo "coc.nvim already configured"
else
    echo "configure coc.nvim"
    wget https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim -P ~/.vim/config/
fi
ln -snfv ${PWD}/coc-settings.json ~/.vim/
