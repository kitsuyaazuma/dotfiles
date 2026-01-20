#!/bin/bash

set -u
BASEDIR=$(dirname $0)
cd $BASEDIR
ln -snfv ${PWD}/vim/.vimrc ~/

if ! command -v node &>/dev/null; then
	echo "install Node.js"

	if ! command -v nvm &>/dev/null; then
		echo "install nvm"
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
		export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	fi

	nvm install --lts
fi

if ! command -v mise &>/dev/null; then
	echo "install mise"
	# https://mise.jdx.dev/installing-mise.html

	if [ -n "$BASH_VERSION" ]; then
		curl https://mise.run/bash | sh
		# Installs mise and adds activation to ~/.bashrc
	elif [ -n "$ZSH_VERSION" ]; then
		curl https://mise.run/zsh | sh
		# Installs mise and adds activation to ~/.zshrc
	fi
	# mise use --global terraform-ls
fi

# https://github.com/ryanoasis/nerd-fonts
if [ -d ~/nerd-fonts ]; then
	echo "nerd-fonts already installed"
else
	echo "install nerd-fonts"
	git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
	pushd ~/nerd-fonts
	chmod +x install.sh
	./install.sh Hack
	popd
fi

# https://github.com/junegunn/vim-plug
if [ -f ~/.vim/autoload/plug.vim ]; then
	echo "vim-plug already installed"
else
	echo "install vim-plug"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

mkdir -p ~/.vim/config
if [ -f ~/.vim/config/coc-example-config.vim ]; then
	echo "coc.nvim already configured"
else
	echo "configure coc.nvim"
	wget https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim -P ~/.vim/config/
fi
ln -snfv ${PWD}/vim/coc-settings.json ~/.vim/
