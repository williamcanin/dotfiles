# Dotfiles

Personal dotfiles for my machine managed with [Tildr](https://orbitbits.com/tildr/).

## Structure

```sh
.dotfiles/
├── .tildr/                 # tildr configuration (encrypted dotfiles, and more)
├── profiles/
│   └── linux/              # Linux dotfiles profile
│       ├── .bashrc
│       ├── .zshrc
│       ├── .wezterm.lua
│       ├── .config/
│       │   └── ...
│       ├── .config/nvim/   # Neovim config
│       ├── .vim/           # Vim config with colorschemes
│       ├── .workflow/      # Installation workflow scripts
│       │   ├── main.sh     # Main install/export script
│       │   ├── distros/    # Distro-specific package scripts
│       │   ├── apps/       # App-specific scripts (VSCode, etc)
│       │   └── templates/  # Template files
│       └── Templates/      # User templates
```

## Supported Distributions

- Arch Linux / Manjaro
- Debian / Ubuntu

## Installation

### Prerequisites

- [Tildr](https://orbitbits.com/tildr/) installed
- Git and GPG (for encrypted dotfiles)

### Quick Install

```bash
# Clone and apply dotfiles
tildr import https://github.com/williamcanin/dotfiles ~/.dotfiles
```

### Full System Setup (Arch Linux or Debian)

The `workflow` script handles package installation, VS Code extensions, and templates:

```sh
workflow install
```

or

```sh
cd ~/.workflow
./main.sh install
```

> Note: After applying dotfiles

This will:

- Install packages (pacman + AUR on Arch / Debian packages)
- Install VS Code extensions
- Copy templates to `~/Templates`

### Export Current Machine State

```sh
workflow export
```

or

```sh
cd ~/.workflow
./main.sh export
```

> Note: After applying dotfiles

This exports:

- Installed packages (pacman/AUR on Arch)
- VS Code extensions

## Profiles

Managed via `tildr`:

```sh
# List profiles
tildr profile list

# Switch profile
tildr profile set linux

# Apply current profile
tildr apply
```

## Profile Structure (linux)

Here is **part** of the structure of my "linux" profile.

| Path                           | Description                |
|--------------------------------|----------------------------|
| `.term/`, `.bashrc`, `.zshrc`  | Shell configuration        |
| `.wezterm.lua`                 | WezTerm terminal config    |
| `.config/nvim/`                | Neovim configuration       |
| `.vim/`                        | Vim config + colorschemes  |
| `.workflow/`                   | System setup scripts       |
| `.workflow/apps/vscode/`       | VS Code extensions/scripts |
| `.workflow/distros/archlinux/` | Arch package management    |
| `Templates/`                   | User template files        |

## Encrypted Files

Sensitive files (SSH keys, GPG keys, etc.) are encrypted with GPG via tildr:

```sh
# Add encrypted file
tildr secret add ~/.ssh/id_ed25519

# List encrypted files
tildr secret list
```

## Workflow Commands

```sh
# Install packages & apps (distro-specific)
workflow install

# Export current machine state to repo
workflow export

# or

# Show help
cd ~/.workflow
./main.sh
```

## Supported Applications (via workflow)

- **VS Code**: Extensions install/export
- **Arch Linux**: pacman + AUR packages
- **Debian/Ubuntu**: apt packages

## Templates

Templates in `.workflow/templates/` are copied to `~/Templates/` on install.

## Desktop Environment (WM)

I currently use [Hyprland](https://hypr.land); its dotfiles can be installed with:

```sh
sh -c "$(curl -fsSL https://williamcanin.github.io/my-environment/setup.sh)"
```

Documentation and further information can be found at: [https://williamcanin.github.io/my-environment/](https://williamcanin.github.io/my-environment/)

## License

[License](LICENSE)
