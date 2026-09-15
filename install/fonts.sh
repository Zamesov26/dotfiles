FONT_DIR="$HOME/.local/share/fonts/JetBrainsMonoNerdFont"

if fc-list | grep -qi "JetBrainsMono.*Nerd Font Mono"; then
  echo "JetBrainsMono Nerd Font Mono already installed"
else
  echo "Installing JetBrainsMono Nerd Font..."

  mkdir -p "$FONT_DIR"

  TMP_DIR="$(mktemp -d)"

  curl -fLo "$TMP_DIR/JetBrainsMono.zip" \
    "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"

  unzip -q "$TMP_DIR/JetBrainsMono.zip" -d "$FONT_DIR"

  rm -rf "$TMP_DIR"

  fc-cache -f

  echo "JetBrainsMono Nerd Font installed"
fi
