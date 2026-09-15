FZF_DIR="$HOME/.fzf"

if [ -d "$FZF_DIR/.git" ]; then
  echo "fzf repository already exists, updating..."
  git -C "$FZF_DIR" pull --ff-only
else
  echo "Installing fzf..."
  git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_DIR"
fi

"$FZF_DIR/install" --key-bindings --completion --no-update-rc
