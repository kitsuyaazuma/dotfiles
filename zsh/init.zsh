ZSH_CONFIG_DIR="$HOME/.config/zsh"

for file in "$ZSH_CONFIG_DIR"/*.zsh; do
  case "$file" in
    */init.zsh) continue ;;
  esac
  [ -r "$file" ] && source "$file"
done
