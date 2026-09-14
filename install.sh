#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"
BASHRC="$HOME/.bashrc"
NVIM_LINK="$HOME/.config/nvim-lazyvim"
NVIM_TARGET="$DOTFILES/nvim/lazyvim"

# --- System packages ---------------------------------------------------------

PACKAGES=(
  git
  fd-find
  ripgrep
  xclip
  tmux
  curl
  unzip
)

sudo apt-get update
sudo apt-get install -y "${PACKAGES[@]}"

# ---fzf-----
#
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# --- Neovim ------------------------------------------------------------------

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

# --- Bash --------------------------------------------------------------------

ALIASES_LINE='[ -f "$HOME/dotfiles/bash/aliases" ] && source "$HOME/dotfiles/bash/aliases"'

if ! grep -Fqx "$ALIASES_LINE" "$BASHRC"; then
  {
    echo ""
    echo "# Personal dotfiles"
    echo "$ALIASES_LINE"
  } >>"$BASHRC"

  echo "Added dotfiles aliases to ~/.bashrc"
else
  echo "Dotfiles aliases already configured"
fi

# --- fd ----------------------------------------------------------------------

mkdir -p "$HOME/.local/bin"

if ! command -v fd >/dev/null 2>&1; then
  ln -s "$(command -v fdfind)" "$HOME/.local/bin/fd"
fi

# --- Lazygit -----------------------------------------------------------------

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

# --- Nerd Font ---------------------------------------------------------------

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
