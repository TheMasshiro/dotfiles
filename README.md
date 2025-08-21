# My Dotfiles

Personal configuration files for my development environment.

## 📋 Requirements

- **Git**
  ```bash
  sudo dnf install git
  ```

- **GNU Stow**
  ```bash
  sudo dnf install stow
  ```

## Installation

1. Clone the repository:
   ```bash
   git clone git@github.com:TheMasshiro/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Create symlinks:
   ```bash
   stow .
   ```

## Notes

- Backup your existing dotfiles before installation
