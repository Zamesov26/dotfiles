#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"
LOG_DIR="$DOTFILES/logs"
LOG_FILE="$LOG_DIR/install.log"

mkdir -p "$LOG_DIR"

# Send stdout and stderr both to terminal and log file.
exec > >(tee -a "$LOG_FILE") 2>&1

echo
echo "=================================================="
echo "Dotfiles install started: $(date)"
echo "=================================================="
echo

source "$DOTFILES/install/packages.sh"
source "$DOTFILES/install/fzf.sh"
source "$DOTFILES/install/lazygit.sh"
source "$DOTFILES/install/fonts.sh"
source "$DOTFILES/install/nvim.sh"
source "$DOTFILES/install/shell.sh"

echo
echo "Dotfiles installation completed successfully."
echo "Run 'source ~/.bashrc' or open a new terminal to apply shell changes."
