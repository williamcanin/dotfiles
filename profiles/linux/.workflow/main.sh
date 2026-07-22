#!/usr/bin/env sh

# Detect current distribution
_get_distro() {
  if [ ! -f /etc/os-release ]; then
    echo "Cannot detect distribution: /etc/os-release not found."
    exit 1
  fi

  # Read NAME field, strip surrounding quotes
  _name=$(grep '^NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')

  case "$_name" in
  "Arch Linux" | Manjaro*)
    OS_CURRENT="Arch Linux"
    ;;
  Debian | Ubuntu*)
    OS_CURRENT="Debian"
    ;;
  Fedora*)
    OS_CURRENT="Fedora"
    ;;
  *)
    echo "Distribution '$_name' is not supported by this script."
    exit 1
    ;;
  esac
}

_get_distro

# Copy templates to $HOME
TEMPLATES_DIR=$(xdg-user-dir TEMPLATES)
cp -f "$WORKFLOW_PATH"/templates/* "$TEMPLATES_DIR/"

case $1 in
export)
  case "$OS_CURRENT" in
  "Arch Linux")

    # Export packages (pacman and aur) Arch Linux
    chmod +x "$WORKFLOW_PATH"/distros/archlinux/init.sh
    sh "$WORKFLOW_PATH"/distros/archlinux/init.sh export-packages

    ;;
  esac

  # Export extensions VSCode
  chmod +x "$WORKFLOW_PATH"/apps/vscode/init.sh
  sh "$WORKFLOW_PATH"/apps/vscode/init.sh export-extensions
  ;;
install)
  case "$OS_CURRENT" in
  "Arch Linux")
    # Install packages (pacman and aur) in Arch Linux
    chmod +x "$WORKFLOW_PATH"/distros/archlinux/init.sh
    sh "$WORKFLOW_PATH"/distros/archlinux/init.sh install-packages
    ;;
  esac

  # Install extensions VSCode
  chmod +x "$WORKFLOW_PATH"/apps/vscode/init.sh
  sh "$WORKFLOW_PATH"/apps/vscode/init.sh install-extensions
  ;;
*)
  printf "[workflow: main.sh] command not recognized\n\n"
  printf "Use:\n"
  printf "  export  ->    Export the current machine settings to the workflow repository.\n"
  printf "  install  ->   Install workflow settings to the machine.\n"
  ;;
esac
exit 0
