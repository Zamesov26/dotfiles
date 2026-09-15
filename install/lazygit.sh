if command -v lazygit >/dev/null 2>&1; then
  echo "lazygit already installed"
else
  echo "Installing lazygit..."

  LAZYGIT_VERSION=$(
    curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" |
      grep -Po '"tag_name": *"v\K[^"]*'
  )

  LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/')

  TMP_DIR="$(mktemp -d)"

  curl -fLo "$TMP_DIR/lazygit.tar.gz" \
    "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"

  tar xf "$TMP_DIR/lazygit.tar.gz" -C "$TMP_DIR" lazygit

  sudo install "$TMP_DIR/lazygit" -D -t /usr/local/bin/

  rm -rf "$TMP_DIR"

  echo "lazygit installed"
fi
