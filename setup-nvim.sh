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
	apt install neovim
	# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
	# chmod u+x nvim-linux-x86_64.appimage
	# ./nvim-linux-x86_64.appimage --appimage-extract
	# ./squashfs-root/AppRun --version
	# sudo mv squashfs-root /
	# sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
	;;
    esac
fi

# https://github.com/ryanoasis/nerd-fonts
if [ -d ~/nerd-fonts ]; then
    echo "nerd-fonts already installed"
else
    echo "install nerd-fonts"
    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
    pushd ~/nerd-fonts; chmod +x install.sh; ./install.sh Hack; popd
fi
