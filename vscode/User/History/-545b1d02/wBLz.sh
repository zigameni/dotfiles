#!/bin/bash

DOTFILES_DIR=~/workspace/dotfiles

echo "Creating dotfiles directory if it doesn't exist..."
mkdir -p $DOTFILES_DIR/vscode
mkdir -p $DOTFILES_DIR/nvim

echo "Moving configuration files to $DOTFILES_DIR..."

# Move Zsh config
mv ~/.zshrc $DOTFILES_DIR/zshrc
mv ~/.p10k.zsh $DOTFILES_DIR/p10k.zsh

# Move VS Code settings
mv ~/.config/Code/User $DOTFILES_DIR/vscode/User

# Move Neovim config
mv ~/.config/nvim $DOTFILES_DIR/nvim

# Save VS Code extensions list
code --list-extensions > $DOTFILES_DIR/vscode/extensions.txt

echo "Creating symlinks..."

# Create symlinks for Zsh
ln -s $DOTFILES_DIR/zshrc ~/.zshrc
ln -s $DOTFILES_DIR/p10k.zsh ~/.p10k.zsh

# Create symlinks for VS Code
ln -s $DOTFILES_DIR/vscode/User ~/.config/Code/User

# Create symlinks for Neovim
ln -s $DOTFILES_DIR/nvim ~/.config/nvim

echo "Setup saved and symlinks created!"
