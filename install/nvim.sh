NVIM_LINK="$HOME/.config/nvim-lazyvim"
NVIM_TARGET="$DOTFILES/nvim/lazyvim"

mkdir -p "$HOME/.config"

if [ -L "$NVIM_LINK" ]; then
  echo "Neovim symlink already exists"
elif [ -e "$NVIM_LINK" ]; then
  echo "Cannot create Neovim symlink: $NVIM_LINK already exists and is not a symlink"
  exit 1
else
  ln -s "$NVIM_TARGET" "$NVIM_LINK"
  echo "Created Neovim symlink"
fi
