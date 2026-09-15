#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"

source "$DOTFILES/install/packages.sh"
source "$DOTFILES/install/fzf.sh"
source "$DOTFILES/install/lazygit.sh"
source "$DOTFILES/install/fonts.sh"
source "$DOTFILES/install/nvim.sh"
source "$DOTFILES/install/shell.sh"

echo
echo "Dotfiles installation completed successfully."
echo "Run 'source ~/.bashrc' or open a new terminal to apply shell changes."
