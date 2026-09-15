BASHRC="$HOME/.bashrc"

ALIASES_LINE='[ -f "$HOME/dotfiles/bash/aliases" ] && source "$HOME/dotfiles/bash/aliases"'
FUNCTIONS_LINE='[ -f "$HOME/dotfiles/bash/functions" ] && source "$HOME/dotfiles/bash/functions"'

if ! grep -Fq "# Personal dotfiles" "$BASHRC"; then
  {
    echo ""
    echo "# Personal dotfiles"
  } >>"$BASHRC"
fi

if ! grep -Fqx "$ALIASES_LINE" "$BASHRC"; then
  echo "$ALIASES_LINE" >>"$BASHRC"
  echo "Added dotfiles aliases to ~/.bashrc"
else
  echo "Dotfiles aliases already configured"
fi

if ! grep -Fqx "$FUNCTIONS_LINE" "$BASHRC"; then
  echo "$FUNCTIONS_LINE" >>"$BASHRC"
  echo "Added dotfiles functions to ~/.bashrc"
else
  echo "Dotfiles functions already configured"
fi
