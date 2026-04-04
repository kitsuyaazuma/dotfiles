#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
ZSHRC="$HOME/.zshrc"

mkdir -p "$HOME/.config"

ln -snf "$DOTFILES_DIR/zsh" "$HOME/.config/zsh"
ln -snf "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

FZF_TAB_DIR="$DOTFILES_DIR/zsh/plugins/fzf-tab"
if [ ! -d "$FZF_TAB_DIR" ]; then
    git clone https://github.com/Aloxaf/fzf-tab "$FZF_TAB_DIR"
fi

LINE='[ -d "$HOME/.config/zsh" ] && source "$HOME/.config/zsh/init.zsh"'

touch "$ZSHRC"
grep -qxF "$LINE" "$ZSHRC" || echo "$LINE" >> "$ZSHRC"
