#!/bin/bash

DOTFILES_DIR=~/workspace/dotfiles

echo "Creating dotfiles directory if it doesn't exist..."
mkdir -p $DOTFILES_DIR/vscode
mkdir -p $DOTFILES_DIR/nvim

echo "Moving configuration files to $DOTFILES_DIR..."

# Move Zsh config
mv ~/.zshrc $DOTFILES_DIR/zshrc
mv ~/.p10k.zsh $DOTFILES_DIR/p10k.zsh

# Move VS Code settings (ensure User folder is copied correctly)
mkdir -p $DOTFILES_DIR/vscode
mv ~/.config/Code/User $DOTFILES_DIR/vscode/

# Move Neovim config (move contents instead of the entire folder)
mkdir -p $DOTFILES_DIR/nvim
mv ~/.config/nvim/* $DOTFILES_DIR/nvim/
rm -rf ~/.config/nvim  # Remove empty original folder

# Save VS Code extensions list
code --list-extensions > $DOTFILES_DIR/vscode/extensions.txt

echo "Creating symlinks..."

# Create symlinks for Zsh
ln -sfn $DOTFILES_DIR/zshrc ~/.zshrc
ln -sfn $DOTFILES_DIR/p10k.zsh ~/.p10k.zsh

# Create symlinks for VS Code
mkdir -p ~/.config/Code
ln -sfn $DOTFILES_DIR/vscode/User ~/.config/Code/User

# Create symlinks for Neovim
ln -sfn $DOTFILES_DIR/nvim ~/.config/nvim

echo "Setup saved and symlinks created!"

