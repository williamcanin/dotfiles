#!/usr/bin/env sh

case $1 in
install-packages)
  # shellcheck disable=SC2024
  sudo pacman -S --needed --noconfirm - <"$WORKFLOW_PATH/distros/archlinux/packages/pacman.lst"

  if command -v yay >/dev/null 2>&1; then
    yay -S --noconfirm - <"$WORKFLOW_PATH"/distros/archlinux/packages/aur.lst
  fi
  ;;
export-packages)
  pacman -Qneq >"$WORKFLOW_PATH"/distros/archlinux/packages/pacman.lst
  pacman -Qmeq >"$WORKFLOW_PATH"/distros/archlinux/packages/aur.lst
  ;;
*)
  echo "[archlinux: main.sh] command not recognized"
  echo "Use: install-packages|export-packages"
  ;;
esac
exit 0
