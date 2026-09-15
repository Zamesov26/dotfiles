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

# --- fd ----------------------------------------------------------------------
# Ubuntu installs fd as `fdfind`, while tools expect `fd`.
mkdir -p "$HOME/.local/bin"

if ! command -v fd >/dev/null 2>&1; then
  if [ ! -e "$HOME/.local/bin/fd" ]; then
    ln -s "$(command -v fdfind)" "$HOME/.local/bin/fd"
    echo "Created fd -> fdfind symlink"
  fi
fi
