# Dotfiles Configuration Guide

## The config is based on Fedora Sway Spin

## Terminal Setup

- **Shell:** ZSH
- **Theme:** Catppuccin
- **Prompt:** powerlevel10k

## Dotfiles Management

I use GNU Stow to manage dotfiles. To set up a configuration:

```bash
stow <directory>/
```

> [!WARNING]
> Do not use stow sway/. The sway configuration requires manual setup.

## Configuration Notes

### Neovim

Before using the Neovim configuration:

1. Open [`providers.lua`](nvim/.config/nvim/lua/core/providers.lua)
2. Update or remove the provider path as needed

---

[!TIP]
Always backup your existing configuration before applying changes.

[!NOTE]
I accidentally deleted the .git file during configuration
