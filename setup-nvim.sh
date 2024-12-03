#!/bin/bash

set -u
BASE_DIR=$(dirname $0)
cd $BASE_DIR
NVIM_DIR=${HOME}/.config/nvim
rm -rf ${NVIM_DIR}
ln -snfv ${PWD}/nvim ${NVIM_DIR}

OS=$(uname -s)

if ! command -v nvim &> /dev/null; then
    echo "install Neovim"
    # https://github.com/neovim/neovim/blob/master/INSTALL.md
    case "${OS}" in
    Darwin)
	    brew install neovim
	;;
    Linux)
	    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	    mkdir -p ~/.local/bin/nvim
            mv ./nvim.appimage ~
	    chmod +x ~/nvim.appimage
	    echo 'alias nvim="~/nvim.appimage"' >> ~/.bashrc
            source ~/.bashrc
	;;
    esac
fi


