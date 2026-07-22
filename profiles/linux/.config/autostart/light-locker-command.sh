#!/usr/bin/env bash
# ==========================================================
# Definindo Light Locker como bloqueador de tela principal.
# ==========================================================

command="$(xfconf-query -c xfce4-session -p /general/LockCommand)"

if [[ -f $(which "light-locker") ]] && [[ $command != "light-locker-command -l" ]]; then
    xfconf-query -c xfce4-session -p /general/LockCommand -s "light-locker-command -l" --create -t string
    echo "Done!"
fi    
