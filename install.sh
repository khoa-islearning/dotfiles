#!/usr/bin/env bash
set -e

confirm() {
  read -rp "Run: $* ? [y/N] " reply
  case "$reply" in
    [yY][eE][sS]|[yY]) eval "$@" ;;
    *) echo "Skipped: $*";;
  esac
}

echo "Updating Homebrew..."
confirm brew update

echo "Installing packages..."
confirm brew install git
confirm brew install zsh
confirm brew install neovim
confirm brew install tmux
confirm brew install btop
confirm brew install taskd
confirm brew install newsboat
confirm brew install ripgrep
confirm brew install font-hack-nerd-font
confirm npm install -g ls_emmet

echo "Installing lazygit..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  confirm brew install lazygit
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  confirm sudo apt install lazygit
fi

echo "Installing casks..."
confirm brew install --cask kitty
# Example:
# confirm brew install --cask iterm2

echo "All done ✅"

