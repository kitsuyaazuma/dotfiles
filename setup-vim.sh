#!/bin/bash

# https://qiita.com/ganyariya/items/d9adffc6535dfca6784b
set -u
BASEDIR=$(dirname $0)
cd $BASEDIR
ln -snfv ${PWD}/vim/.vimrc ~/

if ! command -v node &> /dev/null; then
    echo "install Node.js"

    if ! command -v nvm &> /dev/null; then
	echo "install nvm"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
	export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    fi

    nvm install --lts
fi

# https://github.com/ryanoasis/nerd-fonts
if [ -d ~/nerd-fonts ]; then
    echo "nerd-fonts already installed"
else
    echo "install nerd-fonts"
    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
    pushd ~/nerd-fonts; chmod +x install.sh; ./install.sh Hack; popd
fi

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

# https://github.com/airblade/vim-gitgutter
if [ -d ~/.vim/pack/airblade/start/vim-gitgutter ]; then
    echo "vim-gitgutter already installed"
else
    echo "install vim-gitgutter"
    git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/airblade/start/vim-gitgutter
    vim -u NONE -c "helptags vim-gitgutter/doc" -c q
fi

# https://github.com/juliosueiras/terraform-lsp
if [ -d ~/.vim/pack/juliosueiras/start/terraform-lsp ]; then
    echo "terraform-lsp already installed"
else
    echo "install terraform-lsp"
    git clone https://github.com/juliosueiras/terraform-lsp.git ~/.vim/pack/juliosueiras/start/terraform-lsp
    pushd ~/.vim/pack/juliosueiras/start/terraform-lsp
    GO111MODULE=on go mod download
    make
    make copy
    popd
    echo 'export PATH=$PATH:~/.bin' >> ~/.zshrc
    # source ~/.zshrc
fi

mkdir -p ~/.vim/config
if [ -f ~/.vim/config/coc-example-config.vim ]; then
    echo "coc.nvim already configured"
else
    echo "configure coc.nvim"
    wget https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim -P ~/.vim/config/
fi
ln -snfv ${PWD}/vim/coc-settings.json ~/.vim/
