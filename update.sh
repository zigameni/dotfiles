#!/bin/bash

# Simple brute-force updater
set -e

# Navigate to dotfiles root
cd "$(dirname "$0")"

# Wipe existing nvim config in repo
echo "🔥 Clearing old Neovim config..."
rm -rf ./nvim

# Copy current nvim config
echo "📦 Copying Neovim config..."
cp -r ~/.config/nvim ./

# Update .zshrc
echo "🔄 Updating .zshrc..."
cp ~/.zshrc ./

# Commit and push
COMMIT_DATE=$(date +"%Y-%m-%d")
git add .
git commit -m "update: $COMMIT_DATE"
git push

echo "✅ Done - dotfiles nuclear sync complete!"
