#!/bin/bash

DOTFILES_DIR=~/workspace/dotfiles

echo "Creating symlinks from $DOTFILES_DIR..."

# Create symlinks for Zsh
ln -sf $DOTFILES_DIR/zshrc ~/.zshrc
ln -sf $DOTFILES_DIR/p10k.zsh ~/.p10k.zsh

# Create symlinks for VS Code
ln -sf $DOTFILES_DIR/vscode/User ~/.config/Code/User

# Create symlinks for Neovim
ln -sf $DOTFILES_DIR/nvim ~/.config/nvim

# Detect if running inside WSL
if grep -q Microsoft /proc/version; then
    echo "Detected WSL, skipping Linux-specific setup."
else
    echo "Detected Linux, installing missing packages..."
    
    # Install Zsh if missing
    if ! command -v zsh &> /dev/null; then
        sudo apt update && sudo apt install -y zsh
    fi

    # Install VS Code if missing
    if ! command -v code &> /dev/null; then
        echo "VS Code is not installed. Install it from: https://code.visualstudio.com/"
    fi
fi

# Reinstall VS Code extensions
echo "Reinstalling VS Code extensions..."
cat $DOTFILES_DIR/vscode/extensions.txt | xargs -n1 code --install-extension

echo "Dotfiles setup restored!"

