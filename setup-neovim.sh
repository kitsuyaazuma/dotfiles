#!/bin/bash

set -u
BASE_DIR=$(dirname $0)
cd $BASE_DIR
NVIM_DIR=${HOME}/.config/nvim
rm -rf ${NVIM_DIR}
mkdir -p ${HOME}/.config
ln -snfv ${PWD}/neovim ${NVIM_DIR}

OS=$(uname -s)

if ! command -v mise &> /dev/null; then
    echo "install mise"
    # https://mise.jdx.dev/installing-mise.html

    if [ -n "$BASH_VERSION" ]; then
        curl https://mise.run/bash | sh
        # Installs mise and adds activation to ~/.bashrc
    elif [ -n "$ZSH_VERSION" ]; then
        curl https://mise.run/zsh | sh
        # Installs mise and adds activation to ~/.zshrc
    fi
    # mise use --global golang
    # mise use --global terraform
    # mise use --global python
fi

if ! command -v node &> /dev/null; then
    echo "install Node.js"
    # https://nodejs.org/en/download

    if ! command -v nvm &> /dev/null; then
	echo "install nvm"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
	export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    fi

    nvm install --lts
fi

if ! command -v nvim &> /dev/null; then
    echo "install Neovim"
    # https://github.com/neovim/neovim/blob/master/INSTALL.md
    case "${OS}" in
    Darwin)
	brew install neovim
	;;
    Linux)
	# apt install neovim
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
	chmod u+x nvim-linux-x86_64.appimage
	./nvim-linux-x86_64.appimage --appimage-extract
	./squashfs-root/AppRun --version
	sudo mv squashfs-root /
	sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
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
