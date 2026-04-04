ZSH_CONFIG_DIR="$HOME/.config/zsh"

autoload -Uz compinit && compinit
autoload -Uz colors && colors

for file in "$ZSH_CONFIG_DIR"/*.zsh; do
  case "$file" in
    */init.zsh) continue ;;
  esac
  [ -r "$file" ] && source "$file"
done
