# Development Environment Setup Guide

## Prerequisites

- Ubuntu or Linux-based system
- Basic terminal and command-line knowledge

## Initial System Preparation

### 1. Update System Packages

```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Install Essential Development Tools

```bash
sudo apt install build-essential procps curl file git -y
```

## Installing Homebrew (Package Manager)

Homebrew is a versatile package manager that works across Linux and macOS.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Configure Homebrew Environment

Add Homebrew to your shell configuration:

```bash
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

## ZSH Shell Setup

### Install ZSH

```bash
brew install zsh
```

### Set ZSH as Default Shell

```bash
echo "/home/linuxbrew/.linuxbrew/bin/zsh" | sudo tee -a /etc/shells
chsh -s /home/linuxbrew/.linuxbrew/bin/zsh
```

## Dotfiles Configuration

### Clone Dotfiles Repository

```bash
mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/zigameni/dotfiles.git
cd dotfiles
```

### Install Configuration Files

```bash
# Copy Neovim Configuration
cp -r nvim ~/.config/

# Copy ZSH Configuration
cp .zshrc ~/.zshrc
source ~/.zshrc
```

## ZSH Enhancements

### Install Oh-My-Zsh Plugins

```bash
# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# History Substring Search
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# Powerlevel10k Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Development Tools and Utilities

### Install Development Utilities via Homebrew

```bash
# Fuzzy Finder
brew install fzf
$(brew --prefix)/opt/fzf/install

# Enhanced ls Replacement
brew install eza

# LLVM Compiler Collection
brew install llvm

# Code Formatting
brew install prettier

# Git Management
brew install lazygit

# File Finder
brew install fd
```

### Path Configuration

Add Homebrew's binary path to your ZSH configuration:

```bash
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

## Final Steps

1. Restart your terminal or run `exec zsh`
2. Configure Powerlevel10k theme (run `p10k configure` if prompted)

## Recommended Next Steps

- Customize your `.zshrc` and Neovim configuration
- Install additional tools as needed
- Backup your dotfiles to a version-controlled repository

## Troubleshooting

- Ensure Homebrew is in your PATH
- Check plugin compatibility
- Verify ZSH shell configuration

## Contributing

Feel free to fork and adapt this setup to your needs!
