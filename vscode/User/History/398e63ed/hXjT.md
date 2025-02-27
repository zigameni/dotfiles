# Dotfiles

This repository contains my personal configuration files (dotfiles) for:

- **Zsh** (including Oh-My-Zsh and Powerlevel10k)
- **Neovim**
- **VS Code** (settings and extensions)
- **WSL/Debian/Linux terminal setup**

## Installation

To set up a new system with these dotfiles:

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/yourusername/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
```

### 2️⃣ Run the Installation Script

```bash
chmod +x install.sh
./install.sh
```

This will:

- Create symlinks to the config files
- Restore VS Code settings
- Reinstall all saved VS Code extensions
- Detect whether the system is WSL or native Linux and adjust setup accordingly

## Saving Changes

If you make updates to your configuration, save them by running:

```bash
chmod +x save_setup.sh
./save_setup.sh
```

Then commit and push the changes:

```bash
git add .
git commit -m "Updated dotfiles"
git push origin main
```

## Files Included

| File/Folder             | Description                                                                    |
| ----------------------- | ------------------------------------------------------------------------------ |
| `.zshrc`                | Zsh configuration file                                                         |
| `p10k.zsh`              | Powerlevel10k theme config                                                     |
| `vscode/User/`          | VS Code settings and keybindings                                               |
| `vscode/extensions.txt` | List of installed VS Code extensions                                           |
| `nvim/`                 | Neovim configuration                                                           |
| `install.sh`            | Script to set up symlinks, restore setup, and handle Linux vs. WSL differences |
| `save_setup.sh`         | Script to save current setup and create symlinks                               |

## Restoring VS Code Extensions Only

If you only want to reinstall VS Code extensions:

```bash
cat vscode/extensions.txt | xargs -n1 code --install-extension
```

## Additional Setup for Native Linux

If running on **native Linux** (not WSL), ensure:

- **Zsh is installed**: `sudo apt install zsh -y`
- **Oh My Zsh** is installed:
  ```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```
- **Powerlevel10k is installed**:
  ```bash
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
  ```
- **VS Code is installed**: If `code` is not found, install it from [VS Code website](https://code.visualstudio.com/) or via:
  ```bash
  sudo apt install code
  ```

## License

Feel free to use and modify these dotfiles. Happy coding! 🚀
