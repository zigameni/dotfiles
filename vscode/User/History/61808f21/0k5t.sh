#!/bin/bash

DOTFILES_DIR=~/workspace/dotfiles

echo "Creating symlinks from $DOTFILES_DIR..."

# Create symlinks for Zsh
ln -s $DOTFILES_DIR/zshrc ~/.zshrc
ln -s $DOTFILES_DIR/p10k.zsh ~/.p10k.zsh

# Create symlinks for VS Code
ln -s $DOTFILES_DIR/vscode/User ~/.config/Code/User

# Create symlinks for Neovim
ln -s $DOTFILES_DIR/nvim ~/.config/nvim

echo "Reinstalling VS Code extensions..."
cat $DOTFILES_DIR/vscode/extensions.txt | xargs -n1 code --install-extension

echo "Dotfiles setup restored!"
