#!/bin/bash

set -u
BASE_DIR=$(dirname $0)
cd $BASE_DIR
NVIM_DIR=${HOME}/.config/nvim
mkdir -p ${NVIM_DIR}
ln -snfv ${PWD}/nvim/ ${NVIM_DIR}

OS=$(uname -s)

if ! command -v nvim &> /dev/null; then
    echo "install Neovim"

    case "${OS}" in
    Darwin)
	ARCH=$(uname -m)
	if [ "${ARCH}" = "arm64" ]; then
	    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz
            tar xzf nvim-macos-arm64.tar.gz
	    mv mv nvim-macos-arm64 ~/bin
	    rm nvim-macos-arm64.tar.gz
        elif [ "${ARCH}" = "x86_64" ]; then
	    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz
            tar xzf nvim-macos-x86_64.tar.gz
	    mv nvim-macos-x86_64 ~/bin
	    rm nvim-macos-x86_64.tar.gz
	fi
	;;
    Linux)
	    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	    mkdir -p ~/.local/bin/nvim
            mv ./nvim.appimage ~/.local/bin/nvim
	    chmod +x ~/.local/bin/nvim/nvim.appimage
	;;
    esac
fi


