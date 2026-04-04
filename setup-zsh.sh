#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
ZSHRC="$HOME/.zshrc"

mkdir -p "$HOME/.config"

ln -snf "$DOTFILES_DIR/zsh" "$HOME/.config/zsh"
ln -snf "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

LINE='[ -d "$HOME/.config/zsh" ] && source "$HOME/.config/zsh/init.zsh"'

touch "$ZSHRC"
grep -qxF "$LINE" "$ZSHRC" || echo "$LINE" >> "$ZSHRC"
